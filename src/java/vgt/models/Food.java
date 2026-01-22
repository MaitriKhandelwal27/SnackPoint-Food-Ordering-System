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
public class Food {
    private int food_id,category_id;
    private String food_name,type,description,image;
    private double price;
    private boolean is_available;
 

    public Food() {
    }

    public Food(int food_id, int category_id, String food_name, String type, String description, double price, boolean is_available,String image) {
        this.food_id = food_id;
        this.category_id = category_id;
        this.food_name = food_name;
        this.type = type;
        this.description = description;
        this.price = price;
        this.is_available = is_available;
        this.image=image;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getFood_name() {
        return food_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setFood_name(String food_name) {
        this.food_name = food_name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isIs_available() {
        return is_available;
    }

    public void setIs_available(boolean is_available) {
        this.is_available = is_available;
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
            
            String sql="insert into food_items values(?,?,?,?,?,?,?,?)";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1,"0");
            p1.setString(2, food_name);
            p1.setDouble(3,price);
            p1.setString(4,type);
            
            p1.setInt(5,category_id);
            p1.setBoolean(6,true);
            p1.setString(7,description);
            p1.setString(8,"no");
            int a=p1.executeUpdate();
            if(a==1)
            {
                msg="Successfully saved ";
            }
            else
            {
                msg="Not saved";
            }
        }
        catch(Exception e)
        {
            System.out.println("saveData() "+e.getMessage());
        }
        return msg;
    }
    
    public String check_photo(int food_id)
    {
        String image="no";
        try
        {
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
            
            String sql="select image from food_items where food_id=?";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setInt(1,food_id);
            ResultSet r=p1.executeQuery();
            
            if(r.next())
            {
                image=r.getString("image");
            }
            
        }
        catch(Exception e)
        {
            System.out.println("Check_photo"+e.getStackTrace());
        }
        return image;
    }
    public int updateImage(String image,int foodid)
    {
        int a=0;
        try
        {
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
            
            String sql="update food_items set image=? where food_id=?";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1, image);
            p1.setInt(2, foodid);
            a=p1.executeUpdate();
        }
        catch(Exception e)
        {
            System.out.println("updateImage : "+e.getStackTrace());
        }
        return a;
    }
    
    public String UpdateFood()
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
            
            String sql="Update food_item set food_name=?,price=?,available=?,description=?,type=?,image=? where food_id=? ";
            PreparedStatement p1=cn.prepareStatement(sql);
          
            p1.setString(1, food_name);
            p1.setDouble(2,price);
            p1.setBoolean(3,is_available);
            p1.setString(4, description);
            p1.setString(5, type);
            p1.setString(6, image);
            p1.setInt(7, food_id);
            int a=p1.executeUpdate();
            if(a==1)
            {
                msg="Data Update Successfully.";
            }
            else msg="Data not Update";
        }
        catch(Exception e)
        {
            System.out.println("saveData() "+e.getMessage());
        }
        return msg;
        }
    public String Delete()
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
            
            String sql="Delete from food_items where food_id=? ";
            PreparedStatement p1=cn.prepareStatement(sql);
          
           
            p1.setInt(1, food_id);
            int a=p1.executeUpdate();
            if(a==1)
            {
                msg="success";
            }
            else msg="Data not Delete";
        }
        catch(Exception e)
        {
            System.out.println("saveData() "+e.getMessage());
        }
        return msg;
    }
         
    public static ArrayList<Food> fetchAll()
    {
        ArrayList<Food> lst=new ArrayList<Food>();
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            String dbpath = "jdbc:mysql://localhost:3306/snackers";
            String dbuser = "root";
            String dbpass = "maitri27";

            Connection cn = DriverManager.getConnection(dbpath, dbuser, dbpass);
            String s1 = "select * from food_items";
            PreparedStatement p1 = cn.prepareStatement(s1);
            ResultSet r1 = p1.executeQuery();

            while(r1.next())
            {       
                Food ad=new Food();
               ad.setFood_id(r1.getInt("food_id"));
               ad.setFood_name(r1.getString("food_name"));
               ad.setPrice(r1.getDouble("price"));
               ad.setType(r1.getString("type"));
               ad.setDescription(r1.getString("description"));
               ad.setImage(r1.getString("image"));
               ad.setIs_available(r1.getBoolean("is_available"));
                 lst.add(ad);
            }
       }
        catch(Exception e)
        {
           System.out.println("Error is fetchAll :"+e.getMessage());        
        }
        return lst;
    }
}
