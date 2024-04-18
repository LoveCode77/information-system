import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Topic;
import com.kuang.service.TopicService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestTopic {
    @Autowired
    @Qualifier("TopicServiceImpl")
    private TopicService topicService;
    @Test
    public void queryAllTopics(){
        List<Topic> topics = topicService.queryAllTopics();
        System.out.println(topics);
    }
    @Test
    public void queryAllTopicsOrderByReply(){
        List<Topic> topics = topicService.queryAllTopicsOrderByReply();
        System.out.println(topics);
    }
    @Test
    public void addTopic(){
//        for (int i = 2; i < 99; i++) {
//            Topic topic=new Topic();
//            topic.setTopicId(i);
//            topic.setTopicSectonId(0);
//            topic.setId(1);
//            topic.setTopicReplyCount(i*2);
//            topic.setTopicImage(1);
//            topic.setTopicTitle();
//        }


        for (int i = 0; i < 70; i++) {
            int e= topicService.addTopic(new Topic(1,1,0,1,"demo","democ？",0,new Date()));
            System.out.println(e);
        }

    }
    @Test
    public void deleteTopic(){
        int i = topicService.deleteTopic(3);
        System.out.println(i);
    }
    @Test
    public void updataTopic(){

    }
    @Test
    public void queryTopicByTopicId(){
        Topic topic = topicService.queryTopicByTopicId(1);
        System.out.println(topic);

    }
    @Test
    public void queryByTopicTitleOrTopicContexts(){
        List<Topic> lists = topicService.queryByTopicTitleOrTopicContexts("美");
        System.out.println(lists);

    }
    @Test
    public void queryByTopicSectonId(){
        PageHelper.startPage(1,3);
        List<Topic> topics = topicService.queryByTopicSectonId(1);
        System.out.println("topics="+topics);
        System.out.println("topics size"+topics.size());
        for (Topic t:topics
             ) {
            System.out.println("foreach="+t);
        }
        PageInfo<Topic> pageInfo = new PageInfo<>(topics);
        System.out.println(pageInfo.getList());
        System.out.println(pageInfo.getPages());
        System.out.println(pageInfo.getPageNum());
        System.out.println(pageInfo.getTotal());
    }
}

