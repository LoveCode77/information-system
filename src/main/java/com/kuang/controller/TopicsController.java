package com.kuang.controller;

import com.kuang.pojo.*;
import com.kuang.service.*;
import com.kuang.util.DataToCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@SessionAttributes(value = {"topicId","id","topicSectonId","search"})
@Controller
@RequestMapping("/topics")
public class TopicsController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("TopicServiceImpl")
    private TopicService topicService;
    @Autowired
    @Qualifier("ReplyServiceImpl")
    private ReplyService replyService;
    @Autowired
    @Qualifier("ImageServiceImpl")
    private ImageService imageService;
    @Autowired
    private PunishmentService punishmentService;


    /**
     * 主页，一般用户主页
     * @param model
     * @param id
     * @param page
     * @param topicSectonId
     * @param search
     * @return
     */
//    http://localhost:8080/information/topics/homepage
    @RequestMapping("homepage")
    public String allTopics(Model model,Integer id,Integer page,Integer topicSectonId,String search){
         //日志
        System.out.println("id="+id);
        System.out.println("page="+page);
        System.out.println("topicSectonId="+topicSectonId);
        System.out.println("search"+search);

        System.out.println(this.getClass()+"-----"+this.getClass().getName());
        //把全局属性id存入session
        model.addAttribute("id",id);
        model.addAttribute("topicSectonId",topicSectonId);
        model.addAttribute("search",search);
        //添加用户名到页面
        User userHeader = userService.queryUserById(id);
        model.addAttribute("userName",userHeader.getUserName());

        //创建一个list集合存储发给后端的数据
        List<Map<String,String>> lists=new ArrayList<>();
        //创建一个集合，存储从数据库查到的数据
        List<Topic> topics=null;
        if((topicSectonId==null||topicSectonId==0)&&search==null){
            System.out.println("queryAllTopicsOrderByReply");
            //如果topicSectonId没有，查出所有的帖子并按照回复次数排序
           topics=topicService.queryAllTopicsOrderByReply();
        }
        else if(search!=null){
            System.out.println("queryByTopicTitleOrTopicContexts");
            topics=topicService.queryByTopicTitleOrTopicContexts(search);
        }
        else {
            System.out.println("queryByTopicSectonId");
            //如果topicSectonId存在，按topicSectonId查出相应类别的帖子
            topics=topicService.queryByTopicSectonId(topicSectonId);
        }
        //格式化日期工具
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd");

        if(page==null){
            if(topics.size()>9){
            for (int i = 0; i <10 ; i++) {
                Map<String,String> map=new HashMap<>();
                map.put("topicReplyCount",String.valueOf(topics.get(i).getTopicReplyCount()));
                map.put("topicTitle",topics.get(i).getTopicTitle());
                map.put("topicId",String.valueOf(topics.get(i).getTopicId()));
                User user = userService.queryUserById(topics.get(i).getId());
                map.put("userName",user.getUserName());
                map.put("topicLastClickTime",simpleDateFormat.format(topics.get(i).getTopicLastClickTime()));
                lists.add(map);
            }}else{
                for (int i = 0; i <topics.size() ; i++) {
                    Map<String,String> map=new HashMap<>();
                    map.put("topicReplyCount",String.valueOf(topics.get(i).getTopicReplyCount()));
                    map.put("topicTitle",topics.get(i).getTopicTitle());
                    map.put("topicId",String.valueOf(topics.get(i).getTopicId()));
                    User user = userService.queryUserById(topics.get(i).getId());
                    map.put("userName",user.getUserName());
                    map.put("topicLastClickTime",simpleDateFormat.format(topics.get(i).getTopicLastClickTime()));
                    lists.add(map);
            }}
        }
        else{
            if(topics.size()>10*page){
            for (int i = 10*page-10; i <10*page ; i++) {
                Map<String,String> map=new HashMap<>();
                map.put("topicReplyCount",String.valueOf(topics.get(i).getTopicReplyCount()));
                map.put("topicTitle",topics.get(i).getTopicTitle());
                map.put("topicId",String.valueOf(topics.get(i).getTopicId()));
                User user = userService.queryUserById(topics.get(i).getId());
                map.put("userName",user.getUserName());
                map.put("topicLastClickTime",simpleDateFormat.format(topics.get(i).getTopicLastClickTime()));
                lists.add(map);
            }}
            else{
                for (int i = 10*page-10; i <topics.size(); i++) {
                    Map<String,String> map=new HashMap<>();
                    map.put("topicReplyCount",String.valueOf(topics.get(i).getTopicReplyCount()));
                    map.put("topicTitle",topics.get(i).getTopicTitle());
                    map.put("topicId",String.valueOf(topics.get(i).getTopicId()));
                    User user = userService.queryUserById(topics.get(i).getId());
                    map.put("userName",user.getUserName());
                    map.put("topicLastClickTime",simpleDateFormat.format(topics.get(i).getTopicLastClickTime()));
                    lists.add(map);
                }
            }
        }
        model.addAttribute("id",id);
        model.addAttribute("p",page);
        model.addAttribute("last",topics.size()/10+1);
        model.addAttribute("lists",lists);


        List<Topic> topicsRank = topicService.queryAllTopics();
        List<String> listRank=new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            listRank.add(topicsRank.get(i).getTopicTitle());
        }
        model.addAttribute("listRank",listRank);

        return "topics/homepage";
    }

    /**
     *  http://localhost:8080/information/topics/oneTopic?topicId=1
     *
     *展示一个帖子
     *
     */
    @RequestMapping("oneTopic")
    public String oneTopic(Model model,Integer topicId,Integer id){
        //帖子标题和第一楼

        HashMap<String,String> header=new HashMap<>();
        Topic topic = topicService.queryTopicByTopicId(topicId);
        header.put("topicTitle",topic.getTopicTitle());
        header.put("topicContexts",topic.getTopicContexts());
        //图像
        Image imageFirst = imageService.queryImageById(topic.getId());
        header.put("imageAddress",imageFirst.getImageAddress());
        //用户名字
        User user = userService.queryUserById(topic.getId());
        header.put("userName",user.getUserName());

        model.addAttribute("header",header);

        System.out.println("TopicsController"+"---"+"oneTopic"+"---"+header);
        //剩下的楼
        List<HashMap<String, String> > lists=new ArrayList<>();
        List<Reply> replies = replyService.queryByTopicId(topicId);
        for (int i = 0; i < replies.size(); i++) {
            HashMap<String, String> map = new HashMap<>();
            map.put("replyContexts",replies.get(i).getReplyContexts());
            map.put("id",String.valueOf(replies.get(i).getId()));
            Image image = imageService.queryImageById(replies.get(i).getId());
            map.put("imageAddress",image.getImageAddress());
            User user1 = userService.queryUserById(replies.get(i).getId());
            map.put("userName",user1.getUserName());
            lists.add(map);
        }
        //帖子计数器
        topic.setTopicReplyCount(topic.getTopicReplyCount()+1);
        topicService.updataTopic(topic);

        System.out.println("TopicsController"+"---"+"oneTopic"+"---"+lists);
        System.out.println("----------------------------------------------------");

        model.addAttribute("lists",lists);

        model.addAttribute("topicId",topicId);
        model.addAttribute("id",id);

        User user1 = userService.queryUserById(id);
        model.addAttribute("userName",user1.getUserName());

        return "topics/oneTopic";
    }

    /**
     *添加帖子
     */
    @RequestMapping("addTopic")
    public String addTopic(int id ,Model model){
        //检查处罚是够过期
        DataToCommon.updateP(punishmentService);

        //判断该用户是否有发帖资格
        Punishment punishment=new Punishment();
        punishment.setId(id);
        List<Punishment> query = punishmentService.query(punishment);
        //若没有发帖资格 就返回提示
        for (Punishment p : query) {
            if(p.getOutdated()==0&&p.getPunishmentType()==1){
               return "login/banTopic";
            }
        }


        User user = userService.queryUserById(id);
        model.addAttribute("userName",user.getUserName());
        model.addAttribute("id",id);

        System.out.println("TopicsController"+"---"+"addTopic");
        System.out.println("----------------------------------------------------");

        return "topics/addTopic";
    }
    @RequestMapping("storeTopic")
    public String storeTopic(String pcArticleCont,int id,Model model,int topicSectonId,String topicTitle){

        Topic topic=new Topic(topicSectonId,id,0,0,topicTitle,pcArticleCont,0,new Date());
        topicService.addTopic(topic);

        System.out.println("TopicsController"+"---"+"storeReply"+"---"+topicTitle);
        System.out.println("----------------------------------------------------");

        return "redirect:/topics/homepage?id="+id;
    }






    /**
     *跳转到添加回复页面
     */
    @RequestMapping("addReply")
    public String addReply(){

        System.out.println("TopicsController"+"---"+"addReply");
        System.out.println("----------------------------------------------------");

        return "topics/addReply";
    }
    /**
     *存储回复
     * 重定向到单个帖子页面
     */
    @RequestMapping("storeReply")
    public String storeReply(String replyContexts,int topicId,int id,Model model){

        Reply reply=new Reply(topicId,id,replyContexts);
        int i = replyService.addReply(reply);

        System.out.println("TopicsController"+"---"+"storeReply"+"---"+i);
        System.out.println("----------------------------------------------------");

        return "redirect:/topics/oneTopic?topicId="+String.valueOf(topicId);
    }

    /**
     * 个人信息页的 处罚展示
     * 展示前要进行过期处理
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("allPunishment")
    public String allPunishment(HttpSession session,Model model){

        int id =(int) session.getAttribute("id");

        //过期处理
        DataToCommon.updateP(punishmentService);
        //前端信息写入
        Punishment punishment=new Punishment();
        punishment.setId(id);
        List<Punishment> query = punishmentService.query(punishment);

        List<String> strings=new ArrayList<>();
        for (Punishment p : query) {
            String s=new String();
            s+=p.getPunishmentContent();
            s+="至";
            s+= DataToCommon.getDateMMDDHHMMSS(p.getPunishmentOver());
            if(p.getOutdated()==0){
                s+=";处罚进行中";
            }
            if(p.getOutdated()==1){
                s+=";处罚结束";
            }
            strings.add(s);
        }

        System.out.println(strings);
        model.addAttribute("strings",strings);

        return "person/punishmentShow";

    }

}
