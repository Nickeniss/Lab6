/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.lab6.dataaccess;

import java.sql.*;
/**
 *
 * @author Nico
 */
public class DBUtil {
    public static void closePreparedStatement(Statement ps){
        try{
            if (ps != null){
                ps.close();
            }
        }catch (SQLException e){
            System.out.println(e);
        }
    }
    
    public static void closeResultSet(ResultSet rs){
       try{
            if (rs != null){
                rs.close();
            }
        }catch (SQLException e){
            System.out.println(e);
        } 
    }
}
