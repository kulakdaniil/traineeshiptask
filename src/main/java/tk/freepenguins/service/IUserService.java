package tk.freepenguins.service;

import tk.freepenguins.entity.User;

import java.util.List;

/**
 * Created by danfox on 24.06.17.
 */
public interface IUserService {
    public int createUser(User user);
    public void deleteUser(int id);
    public User updateUser(User user);
    public User getUser(int id);
    public List<User> getAllUsers();
    public List<User> getAllUsers(String userName);
}