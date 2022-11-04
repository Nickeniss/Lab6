/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.lab6.services;

import ca.sait.lab6.dataaccess.UserDB;
import ca.sait.lab6.models.Role;
import ca.sait.lab6.models.User;
import java.util.List;

/**
 *
 * @author Nico
 */
public class UserService {

    private UserDB userDB = new UserDB();

    public User get(String email) throws Exception {
        User user = this.userDB.get(email);
        return user;

    }

    public List<User> getAll() throws Exception {
        List<User> users = this.userDB.getAll();
        return users;
    }

    public boolean insert(String email, boolean active, String firstName, String lastName, String password, Role role) throws Exception {
        User user = new User(email, active, firstName, lastName, password, role);
        return this.userDB.insert(user);
    }

    public boolean update(String email, boolean active, String firstName, String lastName, String password, Role role) throws Exception {
        User user = new User(email, active, firstName, lastName, password, role);
        return this.userDB.update(user);
    }

    public boolean delete(String email) throws Exception {
        User user = new User();
        user.setEmail(email);
        return this.userDB.delete(user);
    }
}
