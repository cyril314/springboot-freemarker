package com.fit.plugins.websocket.instantMsg;

import org.java_websocket.WebSocket;

import java.util.*;

/**
 * 即时通讯
 */
public class ChatServerPool {

    private static final Map<WebSocket, String> userconnections = new HashMap<WebSocket, String>();
    private static final Map<WebSocket, String> mobileuserconnections = new HashMap<WebSocket, String>();

    /**
     * 获取用户名
     */
    public static String getUserByKey(WebSocket conn) {
        return userconnections.get(conn);
    }

    /**
     * 获取用户名(手机端)
     */
    public static String mobilegetUserByKey(WebSocket conn) {
        return mobileuserconnections.get(conn);
    }

    /**
     * 向所有的用户发送消息
     *
     * @param message
     */
    public static void sendMessage(String message) {
        getWebSocket(userconnections, null, message);
    }

    /**
     * 获取WebSocket
     *
     * @param user
     */
    public static WebSocket getWebSocketByUser(String user) {
        return getWebSocket(userconnections, user, null);
    }

    /**
     * 获取WebSocket(手机端)
     *
     * @param user
     */
    public static WebSocket mobilegetWebSocketByUser(String user) {
        return getWebSocket(mobileuserconnections, user, null);
    }

    private static WebSocket getWebSocket(Map<WebSocket, String> webSocketMap, String user, String message) {
        Set<WebSocket> keySet = webSocketMap.keySet();
        synchronized (keySet) {
            for (WebSocket conn : keySet) {
                String cuser = webSocketMap.get(conn);
                if (user != null && cuser.equals(user)) {
                    return conn;
                }
                if (message != null && cuser != null) {
                    conn.send(message);
                }
            }
        }
        return null;
    }

    /**
     * 向连接池中添加连接
     */
    public static void addUser(String user, WebSocket conn) {
        userconnections.put(conn, user);    //添加连接
    }

    /**
     * 向连接池中添加连接(手机端)
     */
    public static void mobileaddUser(String user, WebSocket conn) {
        mobileuserconnections.put(conn, user);    //添加连接
    }

    /**
     * 获取所有的在线用户
     *
     * @return
     */
    public static Collection<String> getOnlineUser() {
        List<String> setUsers = new ArrayList<String>();
        Collection<String> setUser = userconnections.values();
        for (String u : setUser) {
            setUsers.add(u);
        }
        return setUsers;
    }

    /**
     * 移除连接池中的连接
     */
    public static boolean removeUser(WebSocket conn) {
        if (userconnections.containsKey(conn)) {
            userconnections.remove(conn);    //移除连接
            return true;
        } else {
            return false;
        }
    }

    /**
     * 移除连接池中的连接(手机端)
     */
    public static boolean mobileremoveUser(WebSocket conn) {
        if (mobileuserconnections.containsKey(conn)) {
            mobileuserconnections.remove(conn);    //移除连接
            return true;
        } else {
            return false;
        }
    }

    /**
     * 向特定的用户发送数据
     *
     * @param message
     */
    public static void sendMessageToUser(WebSocket conn, String message) {
        if (null != conn && null != userconnections.get(conn)) {
            conn.send(message);
        }
    }

    /**
     * 向特定的用户发送数据(手机端)
     */
    public static void mobilesendMessageToUser(WebSocket conn, String message) {
        if (null != conn && null != mobileuserconnections.get(conn)) {
            conn.send(message);
        }
    }
}
