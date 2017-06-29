package tk.freepenguins.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tk.freepenguins.entity.User;
import tk.freepenguins.tools.HibernateSF;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by danfox on 24.06.17.
 */
@Repository
public class UserDAO implements IUserDAO {

    public UserDAO() {
        System.out.println("UserDAO()");
    }

    @Autowired
    private HibernateSF hibernateSF;

    @Override
    public int createUser(User user){
        return (int) hibernateSF.createRecord(user);
    }

    @Override
    public void deleteUser(int id){
        User user = new User();
        user.setId(id);
        hibernateSF.deleteRecord(user);
    }

    @Override
    public User updateUser(User user){
        return hibernateSF.updateRecord(user);
    }

    @Override
    public User getUser(int id) {
        return hibernateSF.getRecordById(id, User.class);
    }

    @Override
    public List<User> getAllUsers() {
        return hibernateSF.getAllRecords(User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers(String userName){
        String sqlQuery = "SELECT t.* FROM User t WHERE t.name LIKE '%" + userName + "%'";
        List<Object[]> userObjects = hibernateSF.getAllRecords(sqlQuery);
        List<User> users = new ArrayList<>();
        for (Object[] userObject: userObjects) {
            User user = new User();
            int id = (int) userObject[0];
            String name = (String) userObject[1];
            int age = (int) userObject[2];
            boolean isAdmin = (boolean) userObject[3];
            Timestamp timestamp = (Timestamp) userObject[4];
            user.setId(id);
            user.setName(name);
            user.setAge(age);
            user.setIsAdmin(isAdmin);
            user.setCreatedDate(timestamp);
            users.add(user);
        }
        return users;
    }
}