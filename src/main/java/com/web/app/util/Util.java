package com.web.app.util;

import java.util.Random;

public class Util {
    public static boolean isEmptyString(String str) {
        return (str == null || "".equals(str) || "null".equals(str) || str.trim().length() == 0);
    }

    public static String createToken(int length, boolean forUser) {
        String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder token = new StringBuilder();
        for (int i = 0; i < length; i++) {
            Random r = new Random();
            int result = r.nextInt(base.length());
            token.append(base.split("")[result]);
        }
        return (forUser ? "u-" : "a-") + token.toString();
    }
}
