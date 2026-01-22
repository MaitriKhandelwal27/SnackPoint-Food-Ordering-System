/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vgt.models;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author maitr
 */
public class Category {
    private int category_id;
    private String category_name;

    public Category(int category_id, String category_name) {
        this.category_id = category_id;
        this.category_name = category_name;
    }

    public Category() {
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
    
    public String saveData()
    {
        String msg="";
        try
        {
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
            
            String sql="insert into categories values(?,?)";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1,"0");
            p1.setString(2,category_name);
            int a=p1.executeUpdate();
            if(a==1)
            {
                msg="Data Saved Successfully.";
            }
            else msg="Data not saved";
        }
        catch(Exception e)
        {
            System.out.println("saveData() "+e.getMessage());
        }
        return msg;
    }
    
    public ArrayList<Category> getData()
    {
        ArrayList<Category> lt=new ArrayList();
        try
        {
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
            
            String sql="select * from categories";
            PreparedStatement p1=cn.prepareStatement(sql);
            ResultSet r1=p1.executeQuery();
            while(r1.next())
            {
                Category obj=new Category();
                obj.setCategory_id(r1.getInt("category_id"));
                obj.setCategory_name(r1.getString("category_name"));
                lt.add(obj);
            }
        }
        catch(Exception e)
        {
            e.getMessage();
        }
        return lt;
    }
}
