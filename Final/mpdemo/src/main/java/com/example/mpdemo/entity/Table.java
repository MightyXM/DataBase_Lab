package com.example.mpdemo.entity;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("`table`")
public class Table {
    private int tid;
    private int used;
    private int reserved;
    private double money;

    public int getUsed() {
        return used;
    }

    @Override
    public String toString() {
        return "Table{" +
                "tid=" + tid +
                ", reserved=" + reserved +
                ", used=" + used +
                ", money=" + money +
                '}';
    }

    public void setUsed(int used) {
        this.used = used;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }


    public int getReserved() {
        return reserved;
    }

    public void setReserved(int reserved) {
        this.reserved = reserved;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
