package com.kuang.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kuang.pojo.Image;
import com.kuang.pojo.PrivateLetter;
import com.kuang.pojo.User;
import com.kuang.service.ImageService;
import com.kuang.service.PrivateLetterService;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.kuang.util.*;

import java.util.*;
@SessionAttributes(value = {"url"})
@Controller
@RequestMapping("/privateLetter")
public class PrivateLetterController {
    @Autowired
    private UserService userService;
    @Autowired
    private PrivateLetterService privateLetterService;
    @Autowired
    private ImageService imageService;
    //privateLetter/query?sendId=2&id=1
    @RequestMapping(value = "query")
    public String query(Integer sendId,Integer id, Model model){
        model.addAttribute("sendId",sendId);
        model.addAttribute("id",id);

        User userReceive = userService.queryUserById(id);
        Image imageUserReceive = imageService.queryImageById(id);
        model.addAttribute("userName",userReceive.getUserName());
        model.addAttribute("addressReceive",imageUserReceive.getImageAddress());


        User userSend= userService.queryUserById(sendId);
        Image imageUserSend = imageService.queryImageById(sendId);
        model.addAttribute("sendName",userSend.getUserName());
        model.addAttribute("addressSend",imageUserSend.getImageAddress());

        PrivateLetter privateLetter=new PrivateLetter();

        privateLetter.setSendId(sendId);
        privateLetter.setReceiveId(id);

        List<PrivateLetter> lists= privateLetterService.queryForLetter(privateLetter);


        model.addAttribute("lists",lists);

        return "person/letter";
    }
    //privateLetter/insert
    @ResponseBody
    @RequestMapping(value = "insert")
    public String insert(Integer sendId,Integer id,String content, Model model) throws JsonProcessingException {
        System.out.println("WordController"+"---"+"automatic"+"---"+"sendId="+sendId);
        System.out.println("WordController"+"---"+"automatic"+"---"+"id="+id);
        System.out.println("WordController"+"---"+"automatic"+"---"+"content="+content);

        PrivateLetter privateLetter=new PrivateLetter();
        privateLetter.setSendId(id);
        privateLetter.setReceiveId(sendId);
        privateLetter.setTime(new Date());
        privateLetter.setContent(content);
        privateLetter.setIsReceive(0);

        System.out.println("WordController"+"---"+"automatic"+"---"+"privateLetter="+privateLetter);

        int i = privateLetterService.insertPrivateLetter(privateLetter);
        System.out.println("WordController"+"---"+"automatic"+"---"+"i="+i);

        ObjectMapper mapper = new ObjectMapper();
        String string=mapper.writeValueAsString("ok");

        return string;
    }
    //privateLetter/allChat
    @RequestMapping(value = "allChat")
    public String allChat(Integer id,Model model){

        Image image = imageService.queryImageById(id);
        model.addAttribute("url",image.getImageAddress());

        List<PrivateLetter> privateLetters = privateLetterService.queryAllChat(id);
        System.out.println("PrivateLetterController"+"---"+"allChat"+"---"+"privateLetters="+privateLetters);

        List<Map<String,String>> lists=new ArrayList<>();

        for (PrivateLetter p:privateLetters
             ) {
            Map<String,String> map=new HashMap<>();

            map.put("sendId",p.getSendId()+"");
            map.put("sendName",userService.queryUserById(p.getSendId()).getUserName());
            map.put("address",imageService.queryImageById(p.getSendId()).getImageAddress());
            lists.add(map);
        }
        System.out.println("PrivateLetterController"+"---"+"allChat"+"---"+"lists="+lists);

        model.addAttribute("lists",lists);

        return "person/allChat";
    }


}
