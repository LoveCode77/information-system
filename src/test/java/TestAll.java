
import com.kuang.dao.ReplyMapper;
import com.kuang.pojo.Reply;
import com.kuang.pojo.Topic;
import com.kuang.pojo.User;
import com.kuang.service.ReplyService;
import com.kuang.service.TopicService;
import com.kuang.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestAll {
    @Autowired
    private TopicService topicService;
    @Autowired
    private ReplyService replyService;
    @Test
    public void All(){
        List<Topic> topics = topicService.queryAllTopics();

        for (int i = 0; i <topics.size(); i++) {
            System.out.println("帖子"+topics.get(i));
            List<Reply> replies = replyService.queryByTopicId(topics.get(i).getTopicId());
            for (int j = 0; j < replies.size(); j++) {
                System.out.println("第+"+j+"+楼"+replies.get(j));
            }
        }

    }
}
