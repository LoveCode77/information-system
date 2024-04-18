import com.kuang.pojo.PrivateLetter;
import com.kuang.service.PrivateLetterService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestPrivateLetter {
    @Autowired
    private PrivateLetterService privateLetterService;

    @Test
    public void query(){
        PrivateLetter privateLetter = new PrivateLetter();
        privateLetter.setReceiveId(2);
        List<PrivateLetter> query = privateLetterService.query(privateLetter);
        System.out.println(query);
    }
    @Test
    public void queryForLetter(){
        PrivateLetter privateLetter = new PrivateLetter();
        privateLetter.setReceiveId(2);
        privateLetter.setSendId(1);
        List<PrivateLetter> privateLetters = privateLetterService.queryForLetter(privateLetter);
        System.out.println(privateLetters);
    }

    @Test
    public void add(){
        PrivateLetter privateLetter = new PrivateLetter();
        privateLetter.setSendId(1);
        privateLetter.setReceiveId(2);
        privateLetter.setContent("我是你爹");
        privateLetter.setTime(new Date());
        privateLetter.setIsReceive(0);
        int i = privateLetterService.insertPrivateLetter(privateLetter);
        System.out.println(i);
    }
    @Test
    public void delete(){
        int i = privateLetterService.deletePrivateLetter(2);
        System.out.println(i);
    }

    @Test
    public void update(){
        PrivateLetter privateLetter = new PrivateLetter();
        privateLetter.setPrivateLetterId(3);
        privateLetter.setSendId(1);
        privateLetter.setReceiveId(2);
        privateLetter.setContent("i love you forever");
        privateLetter.setTime(new Date());
        privateLetter.setIsReceive(0);
        int i = privateLetterService.updatePrivateLetter(privateLetter);
        System.out.println(i);
    }
    @Test
    public void queryAllChat(){
        List<PrivateLetter> privateLetters = privateLetterService.queryAllChat(1);
        System.out.println(privateLetters);
    }
}
