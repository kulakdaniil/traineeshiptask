package tk.freepenguins.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.jboss.logging.Logger;
import tk.freepenguins.entity.User;
import tk.freepenguins.service.IUserService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by danfox on 25.06.17.
 */
@Controller
public class UserController {
    private static final int ROWS_ON_PAGE = 18;
    private static final Logger logger = Logger.getLogger(UserController.class);
    private static final String USER_TABLE = "userTable";
    private static final String USER_LIST = "userList";

    public UserController() {
        System.out.println("UserController()");
    }

    @Autowired
    private IUserService iUserService;

    @RequestMapping("createUser")
    public ModelAndView createUser(@ModelAttribute User user) {
        logger.info("Create user: " + user);
        return new ModelAndView("userData");
    }

    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam int id)
    {
        logger.info("Delete user by id: " + id);
        iUserService.deleteUser(id);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam int id, @ModelAttribute User user) {
        logger.info("Update user by id: " + id);
        user = iUserService.getUser(id);
        return new ModelAndView("userData", "user", user);
    }

    @RequestMapping("saveUser")
    public ModelAndView saveUser(@ModelAttribute User user) {
        logger.info("Save user: " + user);
        if(user.getId() == 0)
            iUserService.createUser(user);
        else
            iUserService.updateUser(user);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName){
        logger.info("Search for user: " + searchName);
        List<User> userList = iUserService.getAllUsers(searchName);
        return new ModelAndView(USER_TABLE, USER_LIST, userList);
    }

    @RequestMapping(value = {"getAllUsers"})
    public ModelAndView getAllUsers(){
        logger.info("Get all users.");
        List<User> userList = iUserService.getAllUsers();
        return new ModelAndView(USER_TABLE, USER_LIST, userList);
    }

    @RequestMapping(value="/")
    public ModelAndView listOfUsers(@RequestParam(required = false) Integer page) {
        logger.info("Get all users.");
        ModelAndView modelAndView = new ModelAndView(USER_TABLE);
        List<User> userList = iUserService.getAllUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(userList);
        pagedListHolder.setPageSize(ROWS_ON_PAGE);
        modelAndView.addObject("maxPage", pagedListHolder.getPageCount());
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
            modelAndView.addObject("page", page);
            pagedListHolder.setPage(0);
            modelAndView.addObject(USER_LIST, pagedListHolder.getPageList());
        }
        else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject(USER_LIST, pagedListHolder.getPageList());
        }
        return modelAndView;
    }
}