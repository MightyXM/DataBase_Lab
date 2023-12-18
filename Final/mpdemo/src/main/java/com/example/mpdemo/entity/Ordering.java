package com.example.mpdemo.entity;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("ordering")
public class Ordering {
    private int index;
    private int no;
    private int mid;
    private int tid;

    @Override
    public String toString() {
        return "Ordering{" +
                "index=" + index +
                ", no=" + no +
                ", mid=" + mid +
                ", tid=" + tid +
                '}';
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }
}
