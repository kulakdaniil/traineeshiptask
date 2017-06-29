package tk.freepenguins.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.freepenguins.dao.IUserDAO;
import tk.freepenguins.entity.User;


import java.util.List;

/**
 * Created by danfox on 24.06.17.
 */
@Service
@Transactional
public class UserService implements IUserService {

    public UserService() {
        System.out.println("UserService()");
    }

    @Autowired
    private IUserDAO iUserDAO;

    @Override
    public int createUser(User user){
        return iUserDAO.createUser(user);
    }

    @Override
    public void deleteUser(int id){
        iUserDAO.deleteUser(id);
    }

    @Override
    public User updateUser(User user){
        return iUserDAO.updateUser(user);
    }

    @Override
    public User getUser(int id){
        return iUserDAO.getUser(id);
    }

    @Override
    public List<User> getAllUsers(){
        return iUserDAO.getAllUsers();
    }

    @Override
    public List<User> getAllUsers(String userName){
        return iUserDAO.getAllUsers(userName);
    }
}