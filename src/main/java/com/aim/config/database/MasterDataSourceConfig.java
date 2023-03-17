package com.aim.config.database;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * 第一数据源配置
 */
@Configuration
//扫描 Mapper 接口并容器管理
@MapperScan(basePackages = MasterDataSourceConfig.PACKAGE, sqlSessionFactoryRef = "masterSqlSessionFactory")
public class MasterDataSourceConfig {

    static final String PACKAGE = "com.aim.mapper.master";                                //master 目录
    static final String MAPPER_LOCATION = "classpath:mybatis/master/*/*.xml";            //扫描的 xml 目录
    static final String CONFIG_LOCATION = "classpath:mybatis/master/mybatis-config.xml"; //自定义的mybatis config 文件位置
    static final String TYPE_ALIASES_PACKAGE = "com.aim.entity";                        //扫描的 实体类 目录

    @Value("${spring.datasource.druid.master.url}")
    private String url;

    @Value("${spring.datasource.druid.master.username}")
    private String user;

    @Value("${spring.datasource.druid.master.password}")
    private String password;

    @Value("${spring.datasource.driverClassName}")
    private String driverClass;

    @Bean(name = "masterDataSource")
    @Primary
    public DataSource masterDataSource() {
        DruidDataSource masterDataSource = new DruidDataSource();
        masterDataSource.setDriverClassName(driverClass);
        masterDataSource.setUrl(url);
        masterDataSource.setPassword(password);
        masterDataSource.setUsername(user);
        return masterDataSource;
    }

    @Bean(name = "masterTransactionManager")
    @Primary
    public DataSourceTransactionManager masterTransactionManager() {
        return new DataSourceTransactionManager(masterDataSource());
    }

    @Bean(name = "masterSqlSessionFactory")
    @Primary
    public SqlSessionFactory masterSqlSessionFactory(@Qualifier("masterDataSource") DataSource masterDataSource) throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(masterDataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(MasterDataSourceConfig.MAPPER_LOCATION));
        sessionFactory.setConfigLocation(new DefaultResourceLoader().getResource(MasterDataSourceConfig.CONFIG_LOCATION));
        sessionFactory.setTypeAliasesPackage(MasterDataSourceConfig.TYPE_ALIASES_PACKAGE);
        return sessionFactory.getObject();
    }
}
