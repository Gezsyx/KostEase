/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.util;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class koneksi {
    

    public static Connection Go() {
        try {
            MysqlDataSource MDS = new MysqlDataSource();
            MDS.setServerName("localhost");
            MDS.setDatabaseName("kostease"); 
            MDS.setUser("root");
            MDS.setPassword("");
            MDS.setPort(3306);
            MDS.setServerTimezone("Asia/Jakarta");
            return MDS.getConnection();
        } catch (SQLException e) {
            System.err.println("Gagal Terhubung. \n"
                    + "Error: "+e.getMessage());
        }
        return null;
    }
    
}
