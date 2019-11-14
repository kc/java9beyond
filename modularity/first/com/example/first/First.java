package com.example.first;

public class First {
    public String getInfo() {
        return "hello from first; module is: " + this.getClass().getModule();
    }

}
