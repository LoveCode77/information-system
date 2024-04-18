package com.kuang.controller;

/**
 * 和用户表有关的操作都在这里
 */

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Information;
import com.kuang.pojo.Punishment;
import com.kuang.pojo.User;
import com.kuang.pojo.Word;
import com.kuang.service.InformationService;
import com.kuang.service.PunishmentService;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SessionAttributes(value = {"id","userName"})
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    private InformationService informationService;
    @Autowired
    private PunishmentService punishmentService;

    /**
     * 用来验证登录信息
     * 判断用户类型
     *
     */
    //user/login
    @RequestMapping("/login")
    public String login(Model model, HttpServletRequest request) {
        System.out.println("--------------------------------用户登录");
        String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        System.out.println("UserController"+"---"+"login"+"---"+"userName="+userName+"---"+"password="+password);
        Map<String,String> map=new HashMap<>();
        map.put("userName",userName);
        map.put("password",password);

        User user = userService.queryByUserNameAndPassword(map);
        System.out.println("UserController"+"---"+"login"+"---"+"user="+user);
        //判断是否被禁止登录
        Punishment punishment=new Punishment();
        punishment.setId(user.getId());
        List<Punishment> query = punishmentService.query(punishment);
        //若没有发帖资格 就返回提示
        for (Punishment p : query) {
            if(p.getOutdated()==0&&p.getPunishmentType()==3){
                return "login/banLogin";
            }
        }

        if(user==null){
            return "login/loginFail";
        }
        else if(user.getType()==0){

            model.addAttribute("id",user.getId());
            model.addAttribute("userName",user.getUserName());

           return "redirect:/topics/homepage?id="+user.getId();
        }
        else if (user.getType()==1){

            model.addAttribute("id",user.getId());
            model.addAttribute("userName",user.getUserName());

            return "redirect:/word/automatic?id="+user.getId();
        }
        else {

            model.addAttribute("id",user.getId());
            model.addAttribute("userName",user.getUserName());

            return "redirect:/user/administratorIndex";
        }

    }

    //转到注册页面
    //http://localhost:8080/information/user/register
    @RequestMapping("/register")
    public String register(Model model){
        System.out.println("--------------------------------用户请求注册");
        return "login/register";
    }
    //验证注册，并存储注册信息
    //http://localhost:8080/information/user/registerInformation
    @RequestMapping("/registerInformation")
    public String registerInformation(Model model, User user, Information information){
        System.out.println("--------------------------------用户注册");

        //通过注册页面注册默认为普通用户
        user.setType(0);

        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"user="+user);
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"information="+information);
        int i = userService.addUser(user);
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"i="+i);

        Map<String,String> map=new HashMap<>();
        map.put("userName",user.getUserName());
        map.put("password",user.getPassword());
        User userFromDateBase = userService.queryByUserNameAndPassword(map);
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"userFromDateBase="+userFromDateBase);
        information.setId(userFromDateBase.getId());
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"information="+information);
        int i1 = informationService.insertInformation(information);
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"i="+i);

        return "login/registerSuccess";
    }


    /**
     * 管理员页面的处理器
     */
    //user/administratorIndex
    @RequestMapping("administratorIndex")
    public String administratorIndex(Integer page,Model model){
        System.out.println("UserController"+"---"+"administratorIndex"+"---"+"page="+page);

        if(page==null){
            page=1;
        }
        PageHelper.startPage(page,9);
        List<User> users = userService.queryAllUsers();
        List<User> lists=new ArrayList<>();
        for (User user : users) {
            lists.add(user);
        }
        PageInfo<User> pageInfo = new PageInfo<>(users);
        model.addAttribute("page",page);
        model.addAttribute("pages",pageInfo.getPages());
        model.addAttribute("lists",lists);
        model.addAttribute("pageUrl","http://localhost:8080/information/user/administratorIndex");
        model.addAttribute("controlPage",1);
        return "administrator/index";
    }
    //user/administratorDelete?id=
    @RequestMapping("administratorDelete")
    public String administratorDelete(Integer id){
        System.out.println("administratorDelete-------------------");
        System.out.println("UserController"+"---"+"administratorDelete"+"---"+"id="+id);

        int i = userService.deleteUser(id);
        System.out.println("UserController"+"---"+"administratorDelete"+"---"+"id="+id);

        return "redirect:/user/administratorIndex";
    }

    /**
     * 跳转到修改用户页面
     * @param deleteId
     * @param model
     * @return
     */
    //user/administratorUpdateIndex?id=
    @RequestMapping("administratorUpdateIndex")
    public String administratorUpdateIndex(Integer deleteId,Model model){
        System.out.println("administratorUpdateIndex-------------------");
        System.out.println("UserController"+"---"+"administratorUpdateIndex"+"---"+"deleteId="+deleteId);
        User user = userService.queryUserById(deleteId);
        model.addAttribute("user",user);
        model.addAttribute("controlPage",3);

        return "administrator/update";
    }

    /**
     * 保存修改后的数据
     * @param user
     * @return
     */
    @RequestMapping("storeAdministratorUpdateIndex")
    public String storeAdministratorUpdateIndex(User user){
        System.out.println("UserController"+"---"+"storeAdministratorUpdateIndex"+"---"+"user="+user);
        int i = userService.updataUser(user);
        System.out.println("UserController"+"---"+"storeAdministratorUpdateIndex"+"---"+"i="+i);

        return "administrator/index";
    }


    //跳转到新建用户页面
    @RequestMapping("administratorInsertIndex")
    public String administratorInsertIndex(Model model){
        model.addAttribute("controlPage",2);
        return "administrator/insert";
    }
    //提交后 调到所用用户页面
    @RequestMapping("storeAdministratorInsertIndex")
    public String storeAdministratorInsertIndex(User user){
        System.out.println("UserController"+"---"+"storeAdministratorInsertIndex"+"---"+"user="+user);
        int i = userService.addUser(user);
        System.out.println("UserController"+"---"+"storeAdministratorInsertIndex"+"---"+"i="+i);
        return "administrator/index";
    }


}
