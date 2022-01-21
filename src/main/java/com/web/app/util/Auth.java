package com.web.app.util;

import java.util.Objects;

public class Auth {

    public static User credentialCheck(String userName, String password) {
        if (Objects.equals(userName, "admin") && Objects.equals(password, User.get("admin").getPassword())) {
            return User.get("admin");
        } else if (Objects.equals(userName, "user") && Objects.equals(password, User.get("user").getPassword())) {
            return User.get("user");
        }
        return null;
    }
}
