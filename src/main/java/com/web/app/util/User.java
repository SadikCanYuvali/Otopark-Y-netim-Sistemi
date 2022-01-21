package com.web.app.util;

import java.util.HashMap;

public enum User {
    SUPER_USER("admin", "3k89fj349"),
    REGULAR_USER("user", "3k89fnbg9");

    private String userName;
    private String password;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private static HashMap<String, User> map;

    static {
        map = new HashMap<>();
        for (User u : User.values()) {
            map.put(u.getUserName(), u);
        }
    }

    User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public static User get(String userName) {
        return map.get(userName);
    }
}
