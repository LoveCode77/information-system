
import com.kuang.dao.ReplyMapper;
import com.kuang.pojo.Reply;
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
public class TestReply {
    @Autowired
    @Qualifier("ReplyServiceImpl")
    private ReplyService replyService;

    @Test
    public void queryByTopicId(){
        List<Reply> replies = replyService.queryByTopicId(1);
        System.out.println(replies);
    }
    @Test
    public void addReply(){
        Reply reply=new Reply(1,1,"农大就一般吧");
        int i = replyService.addReply(reply);
        System.out.println(i);
    }
    @Test
    public void queryByReplyContexts(){
        List<Reply> lists = replyService.queryByReplyContexts("农大");
        System.out.println(lists);
    }


}
