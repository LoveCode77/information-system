import com.kuang.pojo.User;
import com.kuang.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestUser {


    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Test
    public void testQueryAllUsers(){
        List<User> users = userService.queryAllUsers();
        System.out.println(users);
    }
    @Test
    public void testAddUser() {
//        String [] strings1={"ad","to","cd"};
//        String [] strings2={"w","t","a"};
//        String [] strings3={"ad","to","cd"};
        for (int i = 0; i < 10; i++) {
            int i1 = userService.addUser(new User("17101120" + i+i,  "1", 0,"xiaoming"+i));
            System.out.println(i1);
        }
    }

    @Test
    public void testDeleteUser(){
        int i = userService.deleteUser(99);
        System.out.println(i);
    }
    @Test
    public void queryUserById(){
        User user = userService.queryUserById(1);
        System.out.println(user);
    }
    @Test
    public void queryByUserNameAndPassword(){
        Map<String,String> map=new HashMap<>();
        map.put("userName","xiaoming1");
        map.put("password","1");
        User user = userService.queryByUserNameAndPassword(map);
        System.out.println(user);
    }
    @Test
    public void query(){
        User user=new User();
        user.setUserName("yang");
        List<User> query = userService.query(user);
        System.out.println("query = " + query);
    }
}