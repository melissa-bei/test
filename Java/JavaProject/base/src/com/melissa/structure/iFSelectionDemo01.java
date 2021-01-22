package com.melissa.structure;

import java.util.Scanner;

public class iFSelectionDemo01 {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        System.out.println("接收用户的输入：");
        String str = s.nextLine();

        //equals：判断字符串是否相等
        if (str.equals("hello")){
            System.out.println(str);
        }

        System.out.println("End");
        s.close();
    }
}
