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
public class admin 
{
  private String name,password,email,contact;

    public admin() {
    }

    public admin(String name, String password, String email, String contact) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.contact = contact;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
 
    public String savedata()
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
            
            String sql="insert into logindata values(?,?,?,?,?)";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1,name);
            p1.setString(2,email);
            p1.setString(3,contact);
            p1.setString(4,password);
            p1.setString(5,"ADMIN");

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
    
    public ArrayList<admin> getData()
    {
        ArrayList<admin> lt=new ArrayList();
        try
        {
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
            
            String sql="select * from admin";
            PreparedStatement p1=cn.prepareStatement(sql);
            ResultSet r1=p1.executeQuery();
            while(r1.next())
            {
                admin obj=new admin();
                obj.setName(r1.getString("name"));
                obj.setContact(r1.getString("contact"));
                obj.setEmail(r1.getString("email"));
                lt.add(obj);
            }
        }
        catch(Exception e)
        {
            e.getMessage();
        }
        return lt;
    }
    
    public String ChangePass(String npass,String opass,String email)
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
            
            String sql="Update  logindata set password=? where email=? And password=?  ";
            PreparedStatement p1=cn.prepareStatement(sql);
               p1.setString(1, npass);
               p1.setString(2, email);
               p1.setString(3, opass);
               int a=p1.executeUpdate();
               msg="password not Change";
               if(a==1)
               {
                   msg="Password not Change";
               }
                   
        }
        catch(Exception e)
        {
            
        }  
            return msg;
    }
}
