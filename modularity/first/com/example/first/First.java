package com.example.first;

public class First {
    public String getInfo() {
        String s1 = "Hello from first!"; // 1
        String s2 = "\nFirst.class.getModule() is: " + First.class.getModule();

        return s1 + s2;
    }

}
