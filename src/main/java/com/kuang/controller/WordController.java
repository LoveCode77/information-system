package com.kuang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Reply;
import com.kuang.pojo.Topic;
import com.kuang.pojo.User;
import com.kuang.pojo.Word;
import com.kuang.service.ReplyService;
import com.kuang.service.TopicService;
import com.kuang.service.UserService;
import com.kuang.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SessionAttributes(value = {"id","userName","sort"})
@Controller
@RequestMapping("/word")
public class WordController {
    @Autowired
    @Qualifier("TopicServiceImpl")
    private TopicService topicService;
    @Autowired
    @Qualifier("WordServiceImpl")
    private WordService wordService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("ReplyServiceImpl")
    private ReplyService replyService;


    //http://localhost:8080/information/word/automatic?sort=1
    @RequestMapping("automatic")
    public String automatic(Model model,Integer sort,Integer id,Integer page){
        System.out.println("WordController"+"---"+"automatic"+"---"+sort);
        model.addAttribute("sort",sort);
        if(page==null||page<=1){
            page=1;
        }

        PageHelper.startPage(page,10);
        List<Word> wordPage = wordService.words(new Word());
        System.out.println("WordController"+"---"+"automatic"+"---"+"wordPage="+wordPage);
        List<Word> words=new ArrayList<>();
        for (Word w:wordPage
             ) {
            words.add(w);
        }
        PageInfo<Word> pageInfo = new PageInfo<>(wordPage);
        model.addAttribute("page",page);
        model.addAttribute("pages",pageInfo.getPages());



        List<Map<String,String>> listsTopics=new ArrayList<>();
        List<Map<String,String>> listsReplies=new ArrayList<>();
        for (int i = 0; i < words.size(); i++) {
            List<Topic> topics = topicService.queryByTopicTitleOrTopicContexts(words.get(i).getWordContent());
            for (int j = 0; j < topics.size(); j++) {
                Map<String,String> map=new HashMap<>();
                User user = userService.queryUserById(topics.get(j).getId());
                map.put("receiveId",user.getId()+"");
                map.put("studentNumber",user.getStudentNumber());
                map.put("userName",user.getUserName());
                map.put("wordContent",words.get(i).getWordContent());
                map.put("topicId",topics.get(j).getTopicId()+"");
                map.put("type","帖子");
                listsTopics.add(map);
            }
            List<Reply> replies = replyService.queryByReplyContexts(words.get(i).getWordContent());
            for (int j = 0; j < replies.size(); j++) {
                Map<String,String> map=new HashMap<>();
                User user = userService.queryUserById(replies.get(j).getId());
                map.put("receiveId",user.getId()+"");
                map.put("studentNumber",user.getStudentNumber());
                map.put("userName",user.getUserName());
                map.put("wordContent",words.get(i).getWordContent());
                map.put("replyId",replies.get(j).getReplyId()+"");
                map.put("type","回复");
                listsReplies.add(map);
            }
        }

        System.out.println("WordController"+"---"+"automatic"+"---"+listsTopics);
        System.out.println("WordController"+"---"+"automatic"+"---"+listsReplies);

        model.addAttribute("id",id);
        User user=userService.queryUserById(id);
        model.addAttribute("userName",user.getUserName());

        if(sort==null){
            model.addAttribute("sort",0);
            model.addAttribute("lists",listsTopics);
        }
        else{
            model.addAttribute("sort",1);
            model.addAttribute("lists",listsReplies);
        }
        return "teacher/teacherIndex";
    }




    //http://localhost:8080/information/word/allWord
    @RequestMapping("allWord")
    public String allWord(Model model,Word word,Integer page){
        System.out.println("WordController"+"---"+"allWord"+"---"+"word="+word+"---"+"page="+page);

        if(page==null||page<=1){
            page=1;
        }

        PageHelper.startPage(page,10);
        List<Word> wordsPage = wordService.words(word);
        System.out.println("WordController"+"---"+"allWord"+"---"+"words="+wordsPage);
        PageInfo<Word> pageInfo = new PageInfo<>(wordsPage);

        List<Word> words=new ArrayList<>();
        for (Word w:wordsPage
             ) {
            words.add(w);
        }

        System.out.println("WordController"+"---"+"allWord"+"---"+"words="+words);
        model.addAttribute("words",words);
        model.addAttribute("page",page);
        model.addAttribute("pages",pageInfo.getPages());
        return "teacher/allWords";
    }
    //http://localhost:8080/information/word/addWord
    @RequestMapping("addWord")
    public String addWord(){
        return "teacher/addWord";
    }
    //http://localhost:8080/information/word/storeWord
    @RequestMapping("storeWord")
    public String addWord(Word word){
        System.out.println("WordController"+"---"+"addWord"+"---"+word);
        int i = wordService.insertWord(word);
        System.out.println("WordController"+"---"+"addWord"+"---"+i);
        return "redirect:/word/allWord";
    }
    //http://localhost:8080/information/word/deleteWord?wordId=19
    @RequestMapping("deleteWord")
    public String deleteWord(Integer wordId){
        System.out.println("WordController"+"---"+"deleteWord"+"---"+wordId);
        int i = wordService.deleteWord(wordId);
        System.out.println("WordController"+"---"+"deleteWord"+"---"+i);
        return "redirect:/word/allWord";
    }
    @ModelAttribute
    public void getWord(@RequestParam(value = "wordId",required = false) Integer wordId,
                        @RequestParam(value = "rank",required = false) Integer rank,
                        @RequestParam(value = "wordContent",required = false) String wordContent,
                        @RequestParam(value = "count",required = false) Integer count,
                        Map<String,Object> map){
        System.out.println("WordController"+"---"+"getWord"+"---"+"执行了");
        if(wordId!=null){
            Word word=new Word();
            word.setWordId(wordId);
            List<Word> words = wordService.words(word);
            word=words.get(0);
            System.out.println("WordController"+"---"+"getWord"+"---"+word);
            map.put("word",word);
        }
    }
    //http://localhost:8080/information/word/updateWord?wordId=19&wordContent=太难了
    @RequestMapping("updateWord")
    public String updateWord(Model model,Integer wordId){
        System.out.println("WordController"+"---"+"updateWord"+"---"+wordId);
        Word word = new Word();
        word.setWordId(wordId);
        List<Word> words = wordService.words(word);
        System.out.println("WordController"+"---"+"updateWord"+"---"+words.get(0));
        model.addAttribute("word",words.get(0));
        return "teacher/updateWord";
    }
    //http://localhost:8080/information/word/storeUpdateWord?wordId=19&wordContent=太难了
    @RequestMapping("storeUpdateWord")
    public String storeUpdateWord(Word word){
        System.out.println("WordController"+"---"+"updateWord"+"---"+word);
        int i = wordService.updateWord(word);
        System.out.println("WordController"+"---"+"updateWord"+"---"+i);
        return "redirect:/word/allWord";
    }

}
