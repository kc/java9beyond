package com.example.second;

import com.example.first.First;

public class Second {

    public static void main(String[] args) {
        First first = new First();
        System.out.println("starting second... " + first.getInfo());
        System.out.println("Module is: " + Second.class.getModule());
    }
}
