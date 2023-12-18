package com.example.mpdemo.entity;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("menu")
public class Menu {
    private int mid;
    private String fname;
    private double price;
    private  int rest;

    @Override
    public String toString() {
        return "Menu{" +
                "mid=" + mid +
                ", fname='" + fname + '\'' +
                ", price=" + price +
                ", rest=" + rest +
                '}';
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getRest() {
        return rest;
    }

    public void setRest(int rest) {
        this.rest = rest;
    }
}
