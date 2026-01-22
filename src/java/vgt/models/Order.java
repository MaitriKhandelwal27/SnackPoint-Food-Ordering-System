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
public class Order 
{
    private
    String order_status;
    Timestamp order_time;
    int order_id,user_id,food_id,quantity;
    double price;
    
    public Order() {
    }

    public Order(String order_status, Timestamp order_time, int order_id, int user_id, int food_id, int quantity, double price) {
        this.order_status = order_status;
        this.order_time = order_time;
        this.order_id = order_id;
        this.user_id = user_id;
        this.food_id = food_id;
        this.quantity = quantity;
        this.price = price;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }



    public Timestamp getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Timestamp order_time) {
        this.order_time = order_time;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public ArrayList<Order> getData()
    {
        ArrayList<Order> lt=new ArrayList();
        try
        {
            Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
            
            String sql="select * from orders";
            PreparedStatement p1=cn.prepareStatement(sql);
            ResultSet r1=p1.executeQuery();
            
             System.out.println("1");
            while(r1.next())
            {
                   System.out.println("2");
                Order obj=new  Order();
                
                obj.setOrder_id(r1.getInt("order_id"));
                obj.setUser_id(r1.getInt("user_id"));
                obj.setFood_id(r1.getInt("food_id"));
                obj.setQuantity(r1.getInt("quantity"));
                obj.setPrice(r1.getDouble("price"));
                obj.setOrder_status(r1.getString("order_status"));
                obj.setOrder_time(r1.getTimestamp("order_time"));
                lt.add(obj);
                System.out.println("3 ");
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getStackTrace());
        }
        return lt;
    }
}
