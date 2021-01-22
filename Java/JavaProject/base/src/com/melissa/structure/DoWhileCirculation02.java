package com.melissa.structure;

public class DoWhileCirculation02 {
    public static void main(String[] args) {
        int i = 0;
        while (i < 0) {
            i++;
            System.out.println(i);
        }
        System.out.println("=========================================================================================");
        do {
            i ++;
            System.out.println(i);
        }while (i < 0);
    }
}
