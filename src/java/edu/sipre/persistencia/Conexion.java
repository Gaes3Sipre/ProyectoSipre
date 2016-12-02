/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author
 */
public class Conexion {

    public final static String SERVER_NAME = "ALEJOZEPOL\\ALEJOZEPOL";
    public final static String SERVER_PORT = "";
    public final static String DB_NAME = "sipre";
    public final static String DB_USER = "sa";
    public final static String DB_PASS = "sistemas";
// Declaramos los siguientes objetos
    private static Conexion singleton;
    private Connection cn;

    private Conexion() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://" + SERVER_NAME + ";" + SERVER_PORT + ";databaseName=" + DB_NAME; //+ ";user="+DB_USER+";password=" + DB_PASS;
            this.cn = DriverManager.getConnection(url,DB_USER, DB_PASS);
            System.out.println("Conexion Exitosa");

        } catch (ClassNotFoundException ex) {
            System.out.println("Verifique el conector jdbc");
        } catch (SQLException ex) {
            if (ex.getErrorCode() == 1049) {
                System.out.println(ex.getErrorCode() + ": Verifique el nombre de la base de datos.");
            } else if (ex.getErrorCode() == 1045) {
                System.out.println(ex.getErrorCode() + ": Verifique el usuario de la base de datos.");
            } else {
                System.out.println(ex.getErrorCode() + ": Verifique la conexion al servidor y datos de conexión.");
            }
        }

    }

    public static Conexion getInstance() {
        if (singleton == null) {
            singleton = new Conexion();
        }
        return singleton;
    }

    public Connection getCn() {
        return cn;
    }
    
}
