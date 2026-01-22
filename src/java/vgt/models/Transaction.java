/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vgt.models;

import java.sql.Timestamp;

/**
 *
 * @author maitr
 */
public class Transaction 
{
    private int tid;
    private int user_id;
    private Double amt;
    private String trans_type;
    private Timestamp trans_date;

    public Transaction() {
    }

    public Transaction(int tid, int user_id, Double amt, String trans_type, Timestamp trans_date) {
        this.tid = tid;
        this.user_id = user_id;
        this.amt = amt;
        this.trans_type = trans_type;
        this.trans_date = trans_date;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Double getAmt() {
        return amt;
    }

    public void setAmt(Double amt) {
        this.amt = amt;
    }

    public String getTrans_type() {
        return trans_type;
    }

    public void setTrans_type(String trans_type) {
        this.trans_type = trans_type;
    }

    public Timestamp getTrans_date() {
        return trans_date;
    }

    public void setTrans_date(Timestamp trans_date) {
        this.trans_date = trans_date;
    }
    
}
