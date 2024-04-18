package com.kuang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Punishment;
import com.kuang.pojo.User;
import com.kuang.service.PunishmentService;
import com.kuang.service.UserService;
import com.kuang.util.DataToCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/punishment")
public class PunishmentController {
    @Autowired
    private PunishmentService punishmentService;
    @Autowired
    private UserService userService;

    /**
     * 处罚所有信息展示
     * @param httpSession
     * @param model
     * @param page
     * @return
     */
    //punishment/punishmentInformation
    @RequestMapping("punishmentInformation")
    public String punishmentInformation(HttpSession httpSession,
                                        Model model,Integer page){
        if(page==null)
            page=1;


        Punishment punishment = new Punishment();

        PageHelper.startPage(page,9);
        List<Punishment> punishments = punishmentService.query(punishment);

        List<Map<String,Object>> lists=new ArrayList<>();

        for (Punishment p: punishments) {
            Map<String,Object> map=new HashMap<>();
            map.put("punishmentId",p.getPunishmentId());
            map.put("crime",userService.queryUserById(p.getId()).getUserName());
            map.put("police",userService.queryUserById(p.getPunishmentUser()).getUserName());
            map.put("information",p.getPunishmentContent());
            map.put("punishmentBegin", DataToCommon.getDateMMDD(p.getPunishmentBegin()));
            map.put("punishmentOver", DataToCommon.getDateMMDD(p.getPunishmentOver()));

            if(p.getOutdated()==0){
                map.put("outDated","正在处罚");
            }else{
                map.put("outDated","处罚结束");

            }
            lists.add(map);
        }
        PageInfo<Punishment> punishmentPageInfo = new PageInfo<>(punishments);
        int pages = punishmentPageInfo.getPages();
        model.addAttribute("lists",lists);
        System.out.println("lists = " + lists);
        model.addAttribute("pages",pages);
        model.addAttribute("pageUrl","http://localhost:8080/information/punishment/punishmentInformation");
        model.addAttribute("controlPage",1);
        return "administrator/punishmentIndex";
    }
    /**
     * 跳转到处罚页面
     */
    //punishment/punishmentUser
    @RequestMapping("punishmentUser")
    public String punishmentUser(Model model){
        model.addAttribute("controlPage",2);
        return "administrator/punishmentUser";
    }

    /**
     * 保存管理员提交的处罚信息
     * @param httpSession
     * @param name
     * @param type
     * @param date
     * @return
     */
    //punishment/storePunishmentUser
    @RequestMapping("storePunishmentUser")
    public String storePunishmentUser(HttpSession httpSession,String name, String type, String date){

        System.out.println("name = " + name);
        System.out.println("type = " + type);
        System.out.println("date = " + date);


        Punishment punishment=new Punishment();
        //设置id
        User user = new User();
        user.setUserName(name);
        List<User> query = userService.query(user);
        punishment.setId(query.get(0).getId());


        int id = (int)httpSession.getAttribute("id");
        System.out.println("id = " + id);
        punishment.setPunishmentUser(id);

        punishment.setPunishmentTime(date);
        if(type.equals("禁止发帖")){
            punishment.setPunishmentType(1);
            punishment.setPunishmentContent(""+type+date+"天");

        }
        else if(type.equals("禁止回复")){
            punishment.setPunishmentType(2);
            punishment.setPunishmentContent(""+type+date+"天");

        }else if(type.equals("禁止登录")){
            punishment.setPunishmentType(3);
            punishment.setPunishmentContent(""+type+date+"天");
        }


        Date current = new Date();
        punishment.setPunishmentBegin(current);
        punishment.setPunishmentOver(DataToCommon.addDate(current,Float.valueOf(date)));
        System.out.println("punishment = " + punishment);
        int insert = punishmentService.insert(punishment);
        System.out.println("insert = " + insert);
        return "redirect:/punishment/punishmentInformation";
    }
    /**
     * 取消处罚
     *
     */
    @RequestMapping("cancelPunishment")
    public String cancelPunishment(Integer punishmentId){
        Punishment punishment=new Punishment();
        punishment.setPunishmentId(punishmentId);
        punishment.setOutdated(1);
        int update = punishmentService.update(punishment);
        System.out.println("update = " + update);
        return "redirect:/punishment/punishmentInformation";
    }
}
