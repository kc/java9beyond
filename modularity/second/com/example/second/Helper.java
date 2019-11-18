package com.example.second;

import com.example.first.First;

public class Helper {

    public void doeIets() {
        System.out.println("Help.doeIets()");

        // 2a
        First first = new First();
        System.out.println("First info: " + first.getInfo());

        // 2b
        System.out.println("Second.class.getModule() is: " + Second.class.getModule());
        System.out.println();
    }
}
