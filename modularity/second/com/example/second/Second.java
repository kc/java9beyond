package com.example.second;

// import com.example.first.First; // 2
// import com.example.first.internal.Internal;

public class Second {

    public static void main(String[] args) {
        System.out.println("Starting second..."); // 1

        // 2
        // First first = new First(); // with requires static, this will compile but this will not run! requires static is a compile time dependency only; somethng like provided in maven
        // System.out.printf("First says: %s%n", first.getInfo());
        // System.out.printf("Second.class.getModule(): %s%n", Second.class.getModule());

        // Internal internal = new Internal();
        // internal.getInfo();

        // 5?
        // new com.example.second.helper.Util().doeIets();
    }

}
