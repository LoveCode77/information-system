import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import com.kuang.util.DataToCommon;
import com.kuang.service.BookService;
import com.kuang.service.BookServiceImpl;
import com.kuang.service.UserService;
import com.kuang.service.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class test {


    @Autowired
    @Qualifier("UserServiceImpl")

    private UserService userService;
    /**
     * 测试说明底层代码没问题
     */
    @Test

  public void  test01(){
      ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
      BookServiceImpl bookServiceImpl = (BookServiceImpl) context.getBean("BookServiceImpl");
      List<Books> books = bookServiceImpl.queryAllBook();
      System.out.println(books);
  }

    /**
     * 测试说明底层代码没问题
     */
    @Test
    public void  test02(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserServiceImpl userServiceImpl = (UserServiceImpl)context.getBean("UserServiceImpl");
        List<User> users = userServiceImpl.queryAllUsers();
        for (int i = 2; i <100 ; i++) {
            int i1 = userServiceImpl.addUser(new User(i, "17101130" + i, i + "2222", 0,"月色"+i));

            System.out.println(i1);
        }
    }
    @Test
    public void testNew(){
        List<User> users = userService.queryAllUsers();
        System.out.println(users);
    }
    @Test
    public void testnull(){
        User user=null;
      if(user==null){
          System.out.println("successful!");
      }
    }
    @Test
    public void testdata(){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/HH:mm");
        String format = simpleDateFormat.format(new Date());
        System.out.println(format);
        System.out.println(this.getClass().getName());
        System.out.println(this.getClass());
    }
    @Test
    public void testdata1(){
    Integer integer = null;
    if(integer<1){
        System.out.println("1");
    }
    }

    @Test
    public void testdata2(){
        String dateMMDDHHMMSS = DataToCommon.getDateMMDDHHMMSS(new Date());
        System.out.println(dateMMDDHHMMSS);
        String dateMMDD = DataToCommon.getDateMMDD(new Date());
        System.out.println(dateMMDD);
    }
    @Test
    public void test001(){
        Date date = DataToCommon.addDate(new Date(), 1);
        String dateMMDDHHMMSS = DataToCommon.getDateMMDDHHMMSS(date);
        System.out.println("dateMMDDHHMMSS = " + dateMMDDHHMMSS);
    }
}
