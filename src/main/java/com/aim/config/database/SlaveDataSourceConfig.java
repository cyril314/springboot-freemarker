package com.aim.config.database;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * 第二数据源配置
 */
@Configuration
//扫描 Mapper 接口并容器管理
@MapperScan(basePackages = SlaveDataSourceConfig.PACKAGE, sqlSessionFactoryRef = "slaveSqlSessionFactory")
public class SlaveDataSourceConfig {

    static final String PACKAGE = "com.aim.mapper.slave";                               //master 目录
    static final String MAPPER_LOCATION = "classpath:mybatis/slave/*/*.xml";            //扫描的 xml 目录
    static final String CONFIG_LOCATION = "classpath:mybatis/slave/mybatis-config.xml"; //自定义的mybatis config 文件位置
    static final String TYPE_ALIASES_PACKAGE = "com.aim.entity";                        //扫描的 实体类 目录

    @Value("${spring.datasource.druid.slave.url}")
    private String url;

    @Value("${spring.datasource.druid.slave.username}")
    private String user;

    @Value("${spring.datasource.druid.slave.password}")
    private String password;

    @Value("${spring.datasource.driverClassName}")
    private String driverClass;

    @Bean(name = "slaveDataSource")
    public DataSource slaveDataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClass);
        dataSource.setUrl(url);
        dataSource.setUsername(user);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean(name = "slaveTransactionManager")
    public DataSourceTransactionManager slaveTransactionManager() {
        return new DataSourceTransactionManager(slaveDataSource());
    }

    @Bean(name = "slaveSqlSessionFactory")
    public SqlSessionFactory slaveSqlSessionFactory(@Qualifier("slaveDataSource") DataSource slaveDataSource) throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(slaveDataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(SlaveDataSourceConfig.MAPPER_LOCATION));
        sessionFactory.setConfigLocation(new DefaultResourceLoader().getResource(SlaveDataSourceConfig.CONFIG_LOCATION));
        sessionFactory.setTypeAliasesPackage(SlaveDataSourceConfig.TYPE_ALIASES_PACKAGE);
        return sessionFactory.getObject();
    }
}
