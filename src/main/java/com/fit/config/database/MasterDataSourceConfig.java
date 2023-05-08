package com.fit.config.database;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
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

    static final String PACKAGE = "com.fit.mapper.master";                                //master 目录
    static final String MAPPER_LOCATION = "classpath:mybatis/master/*/*.xml";            //扫描的 xml 目录
    static final String CONFIG_LOCATION = "classpath:mybatis/master/mybatis-config.xml"; //自定义的mybatis config 文件位置
    static final String TYPE_ALIASES_PACKAGE = "com.fit.entity";                        //扫描的 实体类 目录


    @Bean(name = "masterDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.druid.master")
    public DataSource masterDataSource() {
        return new DruidDataSource();
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
