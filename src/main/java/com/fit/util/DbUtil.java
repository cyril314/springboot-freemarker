package com.fit.util;

import com.fit.entity.PageData;

import java.io.*;
import java.net.Socket;
import java.sql.*;
import java.util.*;
import java.util.concurrent.*;

/**
 * 用于备份、还原数据库、在线编辑SQL
 */
public class DbUtil {

    public static Map<String, String> backUpTableList = new ConcurrentHashMap<String, String>();
    public static Map<String, String> recoverTableList = new ConcurrentHashMap<String, String>();
    private static DbUtil dbUtil = new DbUtil();
    private static Properties pros = getPropertiesForDB();
    private static String remoteDB, DBSeverPort, dbType, username, password, address, dbPort, databaseName, dbPath, sqlPath = "";

    static {
        remoteDB = pros.getProperty("remoteDB");        //是否远程备份数据库 yes or no
        DBSeverPort = pros.getProperty("DBSeverPort");  //远程服务器备份程序端口
        dbType = pros.getProperty("dbType");            //数据库类型
        username = pros.getProperty("username");        //用户名
        password = pros.getProperty("password");        //密码
        address = pros.getProperty("dbAddress");        //数据库连接地址
        dbPort = pros.getProperty("dbPort");            //端口
        databaseName = pros.getProperty("databaseName");//数据库名
        dbPath = pros.getProperty("dbPath");            //数据库的安装路径
        sqlPath = pros.getProperty("sqlFilePath");      //存储路径
    }

    public static void main(String[] arg) {
        try {
            String str = DbUtil.getDbUtil().backup("").toString();//调用数据库备份
            System.out.println(FileUtil.getFilesize(str));
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }

    public static DbUtil getDbUtil() {
        return dbUtil;
    }

    /**
     * 执行数据库备份入口
     *
     * @param tableName 表名
     */
    public Object backup(String tableName) throws InterruptedException, ExecutionException {
        if (null != backUpTableList.get(tableName)) return null;
        backUpTableList.put(tableName, tableName);                // 标记已经用于备份(防止同时重复备份,比如备份一个表的线程正在运行，又发来一个备份此表的命令)
        ExecutorService pool = Executors.newFixedThreadPool(2);
        Callable<Object> fhc = new DbBackUpCallable(tableName);    //创建一个有返回值的线程
        Future<Object> f1 = pool.submit(fhc);                    //启动线程
        String backstr = f1.get().toString();                    //获取线程执行完毕的返回值
        pool.shutdown();                                        //关闭线程
        return backstr;
    }

    /**
     * 执行数据库还原入口
     *
     * @param tableName   表名
     * @param sqlFilePath 备份文件存放完整路径
     */
    public Object recover(String tableName, String sqlFilePath) throws InterruptedException, ExecutionException {
        if (null != recoverTableList.get(tableName)) return null;
        recoverTableList.put(tableName, tableName);                            // 标记已经用于还原(防止同时重复还原,比如还原一个表的线程正在运行，又发来一个还原此表的命令)
        ExecutorService pool = Executors.newFixedThreadPool(2);
        Callable<Object> fhc = new DbRecoverCallable(tableName, sqlFilePath);    //创建一个有返回值的线程
        Future<Object> f1 = pool.submit(fhc);                                    //启动线程
        String backstr = f1.get().toString();                                    //获取线程执行完毕的返回值
        pool.shutdown();                                                        //关闭线程
        return backstr;
    }

    /**
     * 获取本数据库的所有表名(通过PageData)
     */
    public static Object[] getTables(PageData pd) throws ClassNotFoundException, SQLException {
        String dbType = pd.getString("dbType");                //数据库类型
        String username = pd.getString("username");            //用户名
        String password = pd.getString("password");            //密码
        String address = pd.getString("dbAddress");            //数据库连接地址
        String dbPort = pd.getString("dbPort");                //端口
        String databaseName = pd.getString("databaseName");    //数据库名
        Connection conn = DbUtil.getCon(dbType, username, password, address + ":" + dbPort, databaseName);
        if ("oracle".equals(dbType)) {
            databaseName = username.toUpperCase();
        }
        Object[] arrOb = {databaseName, DbUtil.getTablesByCon(conn, "sqlserver".equals(dbType) ? null : databaseName), dbType};
        return arrOb;
    }

    /**
     * 获取本数据库的所有表名(通过配置文件)
     */
    public static Object[] getTables() throws ClassNotFoundException, SQLException {
        Connection conn = DbUtil.getCon(dbType, username, password, address + ":" + dbPort, databaseName);
        if ("oracle".equals(dbType)) {
            databaseName = username.toUpperCase();
        }
        Object[] arrOb = {databaseName, DbUtil.getTablesByCon(conn, "sqlserver".equals(dbType) ? null : databaseName), dbType};
        return arrOb;
    }

    /**
     * 获取conn对象(通过配置文件)
     */
    public static Connection getConn() throws ClassNotFoundException, SQLException {
        return DbUtil.getCon(dbType, username, password, address + ":" + dbPort, databaseName);
    }

    /**
     * 获取conn对象(通过PageData)
     */
    public static Connection getConn(PageData pd) throws ClassNotFoundException, SQLException {
        String dbType = pd.getString("dbType");                //数据库类型
        String username = pd.getString("username");            //用户名
        String password = pd.getString("password");            //密码
        String address = pd.getString("dbAddress");            //数据库连接地址
        String dbPort = pd.getString("dbPort");                //端口
        String databaseName = pd.getString("databaseName");    //数据库名
        return DbUtil.getCon(dbType, username, password, address + ":" + dbPort, databaseName);
    }

    /**
     * @param dbType       数据库类型
     * @param username     用户名
     * @param password     密码
     * @param dbUrl        数据库连接地址:端口
     * @param databaseName 数据库名
     */
    public static Connection getCon(String dbType, String username, String password, String dbUrl, String databaseName) throws SQLException, ClassNotFoundException {
        if ("mysql".equals(dbType)) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://" + dbUrl + "/" + databaseName + "?user=" + username + "&password=" + password + "&serverTimezone=UTC&nullCatalogMeansCurrent=true");
        } else if ("oracle".equals(dbType)) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection("jdbc:oracle:thin:@" + dbUrl + ":" + databaseName, username, password);
        } else if ("sqlserver".equals(dbType)) {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection("jdbc:sqlserver://" + dbUrl + "; DatabaseName=" + databaseName, username, password);
        } else {
            return null;
        }
    }

    /**
     * 获取某个conn下的所有表
     *
     * @param conn   数据库连接对象
     * @param schema mysql:数据库名; oracle:用户名;sqlserver:null
     */
    public static List<String> getTablesByCon(Connection conn, String schema) {
        try {
            List<String> listTb = new ArrayList<String>();
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet rs = meta.getTables(null, schema, null, new String[]{"TABLE"});
            while (rs.next()) {
                listTb.add(rs.getString(3));
            }
            return listTb;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 数据库备份命令字符串
     *
     * @param dbType       数据库类型
     * @param dbpath       数据库的路径
     * @param address      数据库连接地址
     * @param username     用户名
     * @param password     密码
     * @param sqlPath      存储路径
     * @param tableName    表名
     * @param databaseName 数据库名
     * @param ffilename    日期当路径和保存文件名的后半部分
     * @return 完整的命令字符串
     */
    public static String getExecStr(String dbType, String dbpath, String address, String username, String password, String sqlPath, String tableName, String databaseName, String ffilename) {
        StringBuffer sb = new StringBuffer();
        if ("mysql".equals(dbType)) {
            address = "localhost";
            sb.append(dbpath);
            sb.append("mysqldump ");
            sb.append("--opt ");
            sb.append("-h ");
            sb.append(address);
            sb.append(" ");
            sb.append("--user=");
            sb.append(username);
            sb.append(" ");
            sb.append("--password=");
            sb.append(password);
            sb.append(" ");
            sb.append("--lock-all-tables=true ");
            sb.append("--result-file=");
            sb.append(sqlPath);
            sb.append(("".equals(tableName) ? databaseName + "_" + ffilename : tableName + "_" + ffilename) + ".sql");
            sb.append(" ");
            sb.append("--default-character-set=utf8 ");
            sb.append(databaseName);
            sb.append(" ");
            sb.append(tableName);//当tableName为“”时，备份整库
        } else if ("oracle".equals(dbType)) {
            if ("".equals(tableName)) {//备份整库
                sb.append("EXP " + username + "/" + password + " BUFFER=880000 FILE=" + sqlPath + username + "_" + ffilename + ".DMP LOG=" + sqlPath + username + "_" + ffilename + ".LOG OWNER=" + username);
            } else {//备份单表
                sb.append("EXP " + username + "/" + password + " BUFFER=880000 FILE=" + sqlPath + tableName + "_" + ffilename + ".DMP LOG=" + sqlPath + tableName + "_" + ffilename + ".LOG TABLES=(" + username + "." + tableName + ")");
            }
        }
        return sb.toString();
    }

    /**
     * 用于执行某表的备份(内部类)线程
     * <p>
     * Callable 有返回值的线程接口
     */
    class DbBackUpCallable implements Callable<Object> {

        String tableName = null;

        public DbBackUpCallable(String tableName) {
            this.tableName = tableName;
        }

        @Override
        public Object call() {
            try {
                String ffilename = DateUtil.getNowTime();
                String commandStr = "";

                if (!"sqlserver".equals(dbType)) {
                    sqlPath = sqlPath + DateUtil.getNowDate() + "/";            //日期当路径分支
                    if ("yes".equals(remoteDB)) {//数据库另外一台服务器上(和tomcat不在同一台服务器上)
                        commandStr = DbUtil.getExecStr(dbType, dbPath, "localhost", username, password, sqlPath, tableName, databaseName, ffilename); //命令语句
                        Socket ss = null;
                        DataOutputStream bb = null;
                        DataInputStream dat = null;
                        ss = new Socket(address, Integer.parseInt(DBSeverPort));//连接远程服务器数据库备份程序
                        bb = new DataOutputStream(ss.getOutputStream());
                        dat = new DataInputStream(ss.getInputStream());
                        bb.writeUTF("FHQ313596790" + commandStr + "FH313596790" + sqlPath);    //发送指令给服务端
                        bb.flush();
                        Boolean llm = true;
                        while (llm) {
                            String returnstr = dat.readUTF();
                            if ("errer".equals(returnstr)) {
                                return returnstr;    //远程服务器备份失败或超时
                            }
                            llm = false;
                            ss.close();
                            bb.close();
                            dat.close();
                        }
                    } else {                            //数据库在本地(和tomcat在同一台服务器上)
                        FileUtil.createDir(sqlPath + "/fh.fh");
                        commandStr = DbUtil.getExecStr(dbType, dbPath, address, username, password, sqlPath, tableName, databaseName, ffilename); //命令语句
                        Runtime cmd = Runtime.getRuntime();
                        Process p = cmd.exec(commandStr);
                        p.waitFor();                // 该语句用于标记，如果备份没有完成，则该线程持续等待
                    }
                } else {//当数据库为sqlserver时 只能备份整库，不能单表备份
                    String spath = sqlPath + databaseName + "_" + ffilename + ".bak";// name文件名
                    String bakSQL = "backup database " + databaseName + " to disk=? with init";// SQL语句
                    PreparedStatement bak = DbUtil.getConn().prepareStatement(bakSQL);
                    bak.setString(1, spath);// path必须是绝对路径
                    bak.execute();            // 备份数据库
                    bak.close();
                }
                String fileType = ".bak";
                if ("mysql".equals(dbType)) {
                    fileType = ".sql";
                } else if ("oracle".equals(dbType)) {
                    fileType = ".DMP";
                }
                if ("".equals(tableName)) {
                    return sqlPath + databaseName + "_" + ffilename + fileType;
                } else {
                    return sqlPath + tableName + "_" + ffilename + fileType;
                }
            } catch (Exception e) {
                return "errer"; //备份操作出现问题
            } finally {
                backUpTableList.remove(tableName); // 最终都将解除
            }
        }
    }

    /**
     * 用于执行某表或整库的还原(内部类)线程
     * <p>
     * Callable 有返回值的线程接口
     */
    class DbRecoverCallable implements Callable<Object> {

        String tableName = null;
        String sqlFilePath = null;

        public DbRecoverCallable(String tableName, String sqlFilePath) {
            this.tableName = tableName;
            this.sqlFilePath = sqlFilePath;
        }

        @Override
        public Object call() {
            try {
                if (!"sqlserver".equals(dbType)) {
                    if ("yes".equals(remoteDB)) {        //数据库另外一台服务器上(和tomcat不在同一台服务器上)
                        String commandStr = "";
                        if ("mysql".equals(dbType)) {
                            commandStr = "FHMysqlHyQ313596790" + dbPath + "mysql -u " + username + " -p" + password + " " + databaseName + "FH313596790" + sqlFilePath; //mysql还原命令语句
                        } else {
                            commandStr = "FHOracleHyQ313596790IMP " + username + "/" + password + " FILE=" + sqlFilePath + " LOG=" + sqlFilePath.replace("DMP", "") + "LOG FULL=Y"; //oracle还原命令语句(还原前，先需要手动删除表,在sql编辑器里面删除即可)
                        }
                        Socket ss = null;
                        DataOutputStream bb = null;
                        DataInputStream dat = null;
                        ss = new Socket(address, Integer.parseInt(DBSeverPort));//连接远程服务器数据库备份程序
                        bb = new DataOutputStream(ss.getOutputStream());
                        dat = new DataInputStream(ss.getInputStream());
                        bb.writeUTF(commandStr);    //发送指令给服务端
                        bb.flush();
                        Boolean llm = true;
                        while (llm) {
                            String returnstr = dat.readUTF();
                            if ("errer".equals(returnstr)) return returnstr; //远程服务器还原失败或超时
                            llm = false;
                            ss.close();
                            bb.close();
                            dat.close();
                        }
                        return "ok";
                    } else {                            //数据库在本地(和tomcat在同一台服务器上)
                        if ("mysql".equals(dbType)) {
                            this.recoverMysql(sqlFilePath, dbPath, username, password, databaseName);
                            return "ok";
                        } else {
                            String oracleCommandStr = "IMP " + username + "/" + password + " FILE=" + sqlFilePath + " LOG=" + sqlFilePath.replace("DMP", "") + "LOG FULL=Y"; //oracle还原命令语句(还原前，先需要手动删除表,在sql编辑器里面删除即可
                            Runtime cmd = Runtime.getRuntime();
                            Process p = cmd.exec(oracleCommandStr);
                            p.waitFor();
                            return "ok";
                        }
                    }
                } else {//当数据库为sqlserver时
					/*String recoverySql = "ALTER DATABASE "+databaseName+" SET ONLINE WITH ROLLBACK IMMEDIATE";// 恢复所有连接  
					PreparedStatement ps = DbUtil.getConn().prepareStatement(recoverySql);
			        CallableStatement cs = DbUtil.getConn().prepareCall("{call killrestore(?,?)}");
			        cs.setString(1, databaseName);	 // 数据库名  
	                cs.setString(2, sqlFilePath); 	// 已备份数据库所在路径  
	                cs.execute(); 					// 还原数据库  
	                ps.execute(); 					// 恢复数据库连接   */
                    String reSQL = "use master exec killspid '" + databaseName + "' restore database " + databaseName + " from disk=? with replace"; // 还原数据库
                    PreparedStatement recovery = DbUtil.getConn().prepareStatement(reSQL);
                    recovery.setString(1, sqlFilePath);
                    if (!recovery.execute()) {
                        return "ok";
                    } else {
                        return "errer";
                    }
                }
            } catch (Exception e) {
                return "errer"; //还原操作出现问题
            } finally {
                recoverTableList.remove(tableName); // 最终都将解除
            }
        }

        /**
         * 还原mysql数据库命令
         *
         * @param sqlFilePath  备份文件的完整路径
         * @param dbPath       mysql安装路径
         * @param username     用户名 例如：root
         * @param password     用户密码
         * @param databaseName 数据库名
         */
        public void recoverMysql(String sqlFilePath, String dbPath, String username, String password, String databaseName) throws IOException {
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime.exec(dbPath + "mysql -u " + username + " -p" + password + " " + databaseName);
            OutputStream outputStream = process.getOutputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(sqlFilePath), "utf8"));
            String str = null;
            StringBuffer sb = new StringBuffer();
            while ((str = br.readLine()) != null) {
                sb.append(str + "\r\n");
            }
            str = sb.toString();
            OutputStreamWriter writer = new OutputStreamWriter(outputStream, "utf-8");
            writer.write(str);
            writer.flush();
            outputStream.close();
            br.close();
            writer.close();
        }
    }

    /**
     * 动态读取数据记录
     *
     * @param sql 查询语句
     */
    public static Object[] executeQuery(String sql) throws Exception {
        List<String> columnList = new ArrayList<String>();                //存放字段名
        List<List<Object>> dataList = new ArrayList<List<Object>>();    //存放数据(从数据库读出来的一条条的数据)
        Statement stmt = null;
        ResultSet rs = null;
        Connection conn = null;
        conn = DbUtil.getConn();
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        columnList = DbUtil.getFieldList(conn, sql);
        while (rs.next()) {
            List<Object> onedataList = new ArrayList<Object>();        //存放每条记录里面每个字段的值
            for (int i = 1; i < columnList.size() + 1; i++) {
                onedataList.add(rs.getObject(i));
            }
            dataList.add(onedataList);                                    //把每条记录放list中
        }
        Object[] arrOb = {columnList, dataList};
        conn.close();
        return arrOb;
    }

    /**
     * 执行 INSERT、UPDATE 或 DELETE
     */
    public static void executeUpdate(String sql) throws ClassNotFoundException, SQLException {
        Statement stmt = null;
        Connection conn = null;
        conn = DbUtil.getConn();
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        conn.close();
    }

    /**
     * 字段名列表
     */
    public static List<String> getFieldList(Connection conn, String table) throws SQLException {
        PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(table);
        pstmt.execute();                                    //这点特别要注意:如果是Oracle而对于mysql可以不用加.
        List<String> columnList = new ArrayList<String>();    //存放字段
        ResultSetMetaData rsmd = (ResultSetMetaData) pstmt.getMetaData();
        for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
            columnList.add(rsmd.getColumnName(i));            //把字段名放list里
        }
        return columnList;
    }

    /**
     * (字段名、类型、长度)列表
     */
    public static List<Map<String, String>> getFieldParameterList(Connection conn, String table, String dbType) throws SQLException {
        if ("oracle".equals(dbType)) {
            PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement("select * from " + table);
            pstmt.execute();
            PreparedStatement pstmtc = (PreparedStatement) conn.prepareStatement("select * from user_col_comments where Table_Name='" + table + "'");
            pstmtc.execute();
            List<Map<String, String>> columnList = new ArrayList<Map<String, String>>();        //存放字段
            ResultSetMetaData rsmd = (ResultSetMetaData) pstmt.getMetaData();
            ResultSet rs = pstmtc.getResultSet();
            List<Map<String, String>> commentList = new ArrayList<Map<String, String>>();       //字段的注释
            while (rs.next()) {
                Map<String, String> cmap = new HashMap<String, String>();
                cmap.put("COLUMN_NAME", rs.getString("COLUMN_NAME"));   //字段名称
                cmap.put("COMMENTS", rs.getString("COMMENTS"));         //字段注释备注
                commentList.add(cmap);
            }
            for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
                Map<String, String> fmap = new HashMap<String, String>();
                String columnName = rsmd.getColumnName(i);
                fmap.put("fieldNanme", columnName);                                      //字段名称
                fmap.put("fieldType", rsmd.getColumnTypeName(i));                        //字段类型名称
                fmap.put("fieldLength", String.valueOf(rsmd.getColumnDisplaySize(i)));   //长度
                fmap.put("fieldSccle", String.valueOf(rsmd.getScale(i)));                //小数点右边的位数
                for (int n = 0; n < commentList.size(); n++) {
                    if (columnName.equals(commentList.get(n).get("COLUMN_NAME").toString())) {
                        String fieldComment = "备注" + i;
                        if (null != commentList.get(n).get("COMMENTS")) {
                            fieldComment = commentList.get(n).get("COMMENTS").toString();
                            fieldComment = "".equals(fieldComment.trim()) ? "备注" + i : fieldComment;
                        }
                        fmap.put("fieldComment", fieldComment);                        //字段注释备注
                    }
                }
                columnList.add(fmap);                                                    //把字段名放list里
            }
            return columnList;
        } else if ("mysql".equals(dbType)) {
            PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement("show full fields from " + table);
            pstmt.execute();                                              //这点特别要注意:如果是Oracle而对于mysql可以不用加.
            List<Map<String, String>> columnList = new ArrayList<Map<String, String>>();    //存放字段
            ResultSet rs = pstmt.getResultSet();
            while (rs.next()) {
                Map<String, String> fmap = new HashMap<String, String>();
                fmap.put("fieldNanme", rs.getString("Field"));      //字段名称
                //截取
                String typeStr = rs.getString("Type"); //varchar(30)
                String typName = "", length = "0", sccle = "0";
                if (typeStr.indexOf("(") != -1 && typeStr.indexOf("") != -1) {
                    typName = typeStr.substring(0, typeStr.indexOf("("));
                    String numStr = typeStr.substring(typeStr.indexOf("(") + 1, typeStr.indexOf(")"));
                    if (numStr.contains(",")) { //3,3
                        length = numStr.split(",")[0];
                        sccle = numStr.split(",")[1];
                    } else {
                        length = numStr;
                    }
                } else {
                    typName = typeStr;
                }
                fmap.put("fieldType", typName);                         //字段类型名称
                fmap.put("fieldLength", length);                        //长度
                fmap.put("fieldSccle", sccle);                          //小数点右边的位数
                fmap.put("fieldComment", rs.getString("Comment"));   //字段注释
                columnList.add(fmap);
            }
            return columnList;
        } else { //sqlserver类型
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT CONVERT(varchar(200),B.name) AS column_name, CONVERT(varchar(200),C.value) AS column_description");
            sql.append(" FROM sys.tables A");
            sql.append(" INNER JOIN sys.columns B ON B.object_id = A.object_id");
            sql.append(" LEFT JOIN sys.extended_properties C ON C.major_id = B.object_id AND C.minor_id = B.column_id");
            sql.append(" WHERE A.name = '").append(table).append("'");
            PreparedStatement fullPt = (PreparedStatement) conn.prepareStatement(sql.toString());
            fullPt.execute();
            ResultSet rs = fullPt.getResultSet();
            PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement("select * from " + table);
            pstmt.execute();                                              //这点特别要注意:如果是Oracle而对于mysql可以不用加.
            List<Map<String, String>> columnList = new ArrayList<Map<String, String>>();    //存放字段
            ResultSetMetaData rsmd = (ResultSetMetaData) pstmt.getMetaData();
            for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
                Map<String, String> fmap = new HashMap<String, String>();
                fmap.put("fieldComment", "");
                fmap.put("fieldNanme", rsmd.getColumnName(i));         //字段名称
                while (rs.next()) {
                    if (rsmd.getColumnName(i).equals(rs.getString("column_name"))) {
                        fmap.put("fieldComment", rs.getString("column_description") == null ? "" : rs.getString("column_description"));//字段注释
                        break;
                    }
                }
                fmap.put("fieldType", rsmd.getColumnTypeName(i));                        //字段类型名称
                fmap.put("fieldLength", String.valueOf(rsmd.getColumnDisplaySize(i)));   //长度
                fmap.put("fieldSccle", String.valueOf(rsmd.getScale(i)));                //小数点右边的位数
                columnList.add(fmap);                                                       //把字段名放list里
            }
            return columnList;
        }
    }

    /**
     * 读取DbUtil.properties 配置文件
     */
    public static Properties getPropertiesForDB() {
        Properties p = new Properties();
        try {
            InputStream inputStream = DbUtil.class.getClassLoader().getResourceAsStream("db.properties");
            p.load(inputStream);
            inputStream.close();
        } catch (IOException e) { //读取配置文件出错
            e.printStackTrace();
        }
        return p;
    }

    /**
     * 获取备份数据库的参数
     */
    public static Map<String, String> getDBParameter() {
        Map<String, String> fhmap = new HashMap<String, String>();
        fhmap.put("dbType", pros.getProperty("dbType"));    //数据库类型
        fhmap.put("remoteDB", pros.getProperty("remoteDB"));//是否远程备份数据库 yes or no
        return fhmap;
    }
}