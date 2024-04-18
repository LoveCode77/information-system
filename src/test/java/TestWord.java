import com.kuang.pojo.Word;
import com.kuang.service.WordService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestWord {
    @Autowired
    @Qualifier("WordServiceImpl")
    private WordService wordService;

    @Test
    public void insertWord(){
        int i=wordService.insertWord(new Word(4,"死了"));
        System.out.println(i);
    }
    @Test
    public void updateWord(){
       int i= wordService.updateWord(new Word(3,4,"自杀",0));
        System.out.println(i);
    }
    @Test
    public void deleteWord(){
        int i= wordService.deleteWord(3);
        System.out.println(i);
    }
    @Test
    public void words(){
        Word word = new Word();
        word.setWordContent("心理问题");
        word.setRank(2);
        System.out.println(word);
        List<Word> words = wordService.words(word);
        System.out.println(words);
    }
}
