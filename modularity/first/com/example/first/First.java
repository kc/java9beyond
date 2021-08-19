package com.example.first;

public class First {
    public String getInfo() {
        String s1 = "Hello from first!"; // 1
        String s2 = "\nFirst.class.getModule() is: " + First.class.getModule(); // 2

        return s1
                + s2 // 2
                ;
    }

}
