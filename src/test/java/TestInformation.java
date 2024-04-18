import com.kuang.pojo.Information;
import com.kuang.service.ImageService;
import com.kuang.service.InformationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
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

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestInformation {
    @Autowired
    @Qualifier("InformationServiceImpl")
    private InformationService informationService;

    @Test
    public  void insertInformation(){
        int i=informationService.insertInformation(new Information(1,1,"我爱java","1822649761@qq.com","1822649761","15236447077","15236447077"));
        System.out.println(i);

    }
    @Test
    public  void updateInformation(){
        int i=informationService.updateInformation(new Information(1,1,"我爱c++","1822649761@qq.com","1822649761","15236447077","15236447077"));
        System.out.println(i);
    }
    @Test
    public  void queryById(){
        Information information = informationService.queryById(1);
        System.out.println(information);
    }
}
