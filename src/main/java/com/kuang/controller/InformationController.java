package com.kuang.controller;

import com.kuang.pojo.Image;
import com.kuang.pojo.Information;
import com.kuang.pojo.User;
import com.kuang.service.*;
import com.kuang.util.ImageUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
@SessionAttributes(value = {"userName"})
@Controller
@RequestMapping("/information")
public class InformationController {
    @Autowired
    private UserService userService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private InformationService informationService;
    @Autowired
    private ImageService imageService;


    //localhost:8080/information/information/information
    @RequestMapping("/information")
    public String information(Model model,Integer id){
        System.out.println("InformationController"+"---"+"information"+"---"+"id="+id);

        Information information = informationService.queryById(id);

        System.out.println("InformationController"+"---"+"information"+"---"+"information="+information);
        model.addAttribute("information",information);

        Image image = imageService.queryImageById(id);
        System.out.println("InformationController"+"---"+"information"+"---"+"image="+image);
        if(image!=null){
        model.addAttribute("url",image.getImageAddress());}

        User user = userService.queryUserById(id);
        System.out.println("InformationController"+"---"+"information"+"---"+"user="+user);
        model.addAttribute("userName",user.getUserName());
        return "person/personInformation";
    }
    //localhost:8080/information/information/replaceImage
    @RequestMapping("/replaceImage")
    public String insertInformation(){

        return "person/updateImage";
    }
    //localhost:8080/information/information/storeInsertInformation
    @RequestMapping("/storeReplaceImage")
    public String storeReplaceImage(Integer id,
                                        @RequestParam("file") CommonsMultipartFile file,
                                         HttpServletRequest request)throws IOException {
        System.out.println("----------------------------------------------");
        System.out.println("InformationController"+"---"+"storeReplaceImage"+"---"+"id="+id);
        System.out.println("InformationController"+"---"+"storeReplaceImage"+"---"+"information="+file);

        String  address= ImageUpload.uploadImage(file, request);
        System.out.println("InformationController"+"---"+"storeReplaceImage"+"---"+"address="+address);

        //将图片添加到数据库
        Image image = imageService.queryImageById(id);
        if (image!=null){
            image.setImageAddress(address);
            int i1 = imageService.updateImage(image);
            System.out.println("InformationController"+"---"+"storeReplaceImage"+"---"+"i1="+i1+"image="+image);
        }
        else{
            int i2 = imageService.addImage(new Image(id, address));
            System.out.println("InformationController"+"---"+"storeReplaceImage"+"---"+"i2="+i2);
        }

        return "redirect:/information/information?id="+id;
    }


    //localhost:8080/information/information/updateInformation
    @RequestMapping("updateInformation")
    public String updateInformation(Integer id,Model model){
        System.out.println("----------------------------------------------");

        Information information = informationService.queryById(id);
        System.out.println("InformationController"+"---"+"updateInformation"+"---"+"information="+information);
        model.addAttribute("information",information);
        return "person/update";
    }

    @RequestMapping("storeUpdateInformation")
    public String storeUpdateInformation(Information information,Model model){
        System.out.println("----------------------------------------------");
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"information="+information);

        int i = informationService.updateInformation(information);
        System.out.println("InformationController"+"---"+"storeUpdateInformation"+"---"+"i="+i);

        return  "redirect:/information/information?id="+information.getId();
    }
    //localhost:8080/information/information/updateInformation
    @RequestMapping("updatePassword")
    public String updatePassword(){
        return "person/updatePassword";
    }
    //localhost:8080/information/information/StoreUpdatePassword
    @RequestMapping("storeUpdatePassword")
    public String storeUpdatePassword(Integer id,String passwordOld,String password,String passwordAgain){
        System.out.println("----------------------------------------------");
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"id="+id);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"passwordOld="+passwordOld);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"password="+password);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"passwordAgain="+passwordAgain);

        User user=userService.queryUserById(id);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"user="+user);
        user.setPassword(password);
        int i=userService.updataUser(user);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"i="+i);

        return  "redirect:/information/information?id="+id;
    }
    //localhost:8080/information/information/updateInformation
    @RequestMapping("updateUserName")
    public String updateUserName(){
        return "person/updateUserName";
    }
    //localhost:8080/information/information/StoreUpdatePassword
    @RequestMapping("storeUpdateUserName")
    public String storeUpdateUserName(Integer id,String userName,Model model){
        System.out.println("----------------------------------------------");
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"id="+id);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"passwordOld="+userName);

        User user=userService.queryUserById(id);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"user="+user);
        user.setUserName(userName);
        int i=userService.updataUser(user);
        System.out.println("InformationController"+"---"+"storeUpdatePassword"+"---"+"i="+i);
        model.addAttribute("userName",userName);

        return  "redirect:/information/information?id="+id;
    }
}
