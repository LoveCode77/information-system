import com.kuang.pojo.Image;
import com.kuang.service.ImageService;
import com.kuang.service.ReplyService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestImage {

    @Autowired
    @Qualifier("ReplyServiceImpl")
    private ReplyService replyService;
    @Autowired
    @Qualifier("ImageServiceImpl")
    private ImageService imageService;
    @Test
    public void queryAll(){
        List<Image> images = imageService.queryAll();
        System.out.println(images);
    }
    @Test
    public void queryImageById(){
        Image image = imageService.queryImageById(1);
        System.out.println(image);

    }
    @Test
    public void addImage(){
        for (int i = 4; i <14 ; i++) {
            int e = imageService.addImage(new Image(i, "http://localhost:8080/information/static/image/"+i+".jpeg"));
            System.out.println(3);
        }


    }
    @Test
    public void updateImage(){
        int i = imageService.updateImage(new Image(2,2, "http://localhost:8080/information/image/logo.png"));
        System.out.println(i);
    }
    @Test
    public void deleteImage(){
        int i = imageService.deleteImage(3);
        System.out.println(i);
    }
}
