/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vgt.models;

import java.sql.*;
import java.util.ArrayList;

public class User 
{
    private String name;
    private String contact;
    private String email;
    private String pass;
     private int user_id;
    private double balance;
    private Timestamp created_at;
    private Object session;

   

    public User() {
    }

    public User(String name, String contact, String email, String pass, int user_id, double balance, Timestamp created_at) {
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.pass = pass;
        this.user_id = user_id;
        this.balance = balance;
        this.created_at = created_at;
    }

  

     public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
     
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
    
    public String savedata()
    {
        String msg="";
        try
        {
             String usertype= "User";
    
            DbSettings ds=new DbSettings();
            Connection cn=ds.connect();
            
            String s2="Insert into logindata values(?,?,?)";
            PreparedStatement p2=cn.prepareStatement(s2);
            
            String s1 = "INSERT INTO users (name, email, contact, password, balance) VALUES (?,?,?,?,?)";
            PreparedStatement p1 = cn.prepareStatement(s1);
            p1.setString(1, name);
            p1.setString(2, email);
            p1.setString(3, contact);
            p1.setString(4, pass);
            p1.setDouble(5, 0.0);
            p2.setString(1,usertype);
            p2.setString(2,email);
            p2.setString(3,pass);

            int a=p1.executeUpdate();
            int b=p2.executeUpdate();
            
            if(a==1 && b==1)
            {
               msg="Data Saved"; 
            }
            else
            {
                msg="Data not Saved";
            }
        }
        catch(Exception e)
        {
            msg="Error in save User"+e.getMessage();
        }
        return msg;
    }
     public static ArrayList<User> fetchAll()
    {
        ArrayList<User> lst=new ArrayList<User>();
        
        try
        {
            DbSettings ds=new DbSettings();
            Connection cn=ds.connect();
            
            String s1 = "select * from users";
            PreparedStatement p1 = cn.prepareStatement(s1);
            ResultSet r1 = p1.executeQuery();

            while(r1.next())
            {       
                User ad=new User();
               ad.setUser_id(r1.getInt("user_id"));
               ad.setName(r1.getString("name"));
               ad.setContact(r1.getString("contact"));
               ad.setEmail(r1.getString("email"));
               ad.setBalance(r1.getDouble("balance"));
               ad.setCreated_at(r1.getTimestamp("created_at"));
               lst.add(ad);
              
            }
        }
        catch(Exception e)
        {
           System.out.println("Error is fatchAll :"+e.getMessage());        
        }
        return lst;
    }
     
    public String updateuser()
    {
        String msg="";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String dbpath = "jdbc:mysql://localhost:3306/snackers";
            String dbuser = "root";
            String dbpass = "maitri27";
            Connection cn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            String s1="Update users set name=?,contact=? where email=?";
            PreparedStatement p1=cn.prepareStatement(s1);
            p1.setString(1, name);
            p1.setString(2,contact);
            p1.setString(3, email);
            int a=p1.executeUpdate();
            if(a==1)
            {
                msg="data Update";
            }
            else
            {
                msg="data not Update";
            }
        }
        catch(Exception e)
        {
             System.out.println("Error is Update :"+e.getMessage());   
        }
        return msg;
    }
    public String Delete()
    {
         String msg="";
        try
        {
            DbSettings ds=new DbSettings();
            Connection cn=ds.connect();
           String s1 = "DELETE FROM users WHERE email=?";
             String s2 = "DELETE FROM logindata WHERE email=?";
            PreparedStatement p1=cn.prepareStatement(s1);
            PreparedStatement p2=cn.prepareStatement(s2);
           
            p1.setString(1, email);
            
             p2.setString(1, email);
            int a=p1.executeUpdate();
            int b=p2.executeUpdate();
            
            if(a==1 && b==2)
            {
                msg="data Delete";
            }
            else
            {
                msg="data not Delete";
            }
        }
        catch(Exception e)
        {
             System.out.println("Error is Delete :"+e.getMessage());   
        }
        return msg;
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
    
    public String getUserName(String e)
    {
        String name="";
        try
        {
            DbSettings ds=new DbSettings();
            Connection cn=ds.connect();
                String sql="select * from users where email=?";
                PreparedStatement p1=cn.prepareStatement(sql);
                 p1.setString(1, e);
                   ResultSet r1 = p1.executeQuery();
                if(r1.next())
                {       
                  name=r1.getString("name");
                }
 
        }
        catch(Exception ex)
        {
            System.out.println("User : getUserName : "+ex.getMessage());
        }
        return name;
    }
    
    public Double getBalance(String e)
    {
        Double balance=0.0;
        try
        {
            DbSettings ds=new DbSettings();
            Connection cn=ds.connect();
            String sql="select * from users where email=?";
            PreparedStatement p1=cn.prepareStatement(sql);
             p1.setString(1, e);
               ResultSet r1 = p1.executeQuery();
            if(r1.next())
            {       
              balance=r1.getDouble("balance");
            }
              
        }
        catch(Exception ex)
        {
            System.out.println("User : getUserName : "+ex.getMessage());
        }
        return balance;
    }
}