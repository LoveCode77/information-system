import com.kuang.pojo.Punishment;
import com.kuang.service.PunishmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;
import com.kuang.util.*;

@RunWith(SpringJUnit4ClassRunner.class)//表示使用spring测试
@ContextConfiguration("classpath:applicationContext.xml")//spring配置文件的路径
public class TestPunishment {
    @Autowired
    private PunishmentService punishmentService;
    /**
     *
     */
    @Test
   public void testQuery(){
        Punishment punishment=new Punishment();
//        punishment.setPunishmentId(1);
        punishment.setPunishmentUser(3);
        List<Punishment> query = punishmentService.query(punishment);
        System.out.println("query = " + query);

    }
    @Test
    public void testInsert(){
        Punishment punishment=new Punishment();
        punishment.setId(1);
        punishment.setPunishmentUser(3);
        punishment.setPunishmentContent("禁止发帖2天");
        punishment.setPunishmentBegin(new Date());
        long size=1000*60*60*24*3;
        punishment.setPunishmentOver(new Date(new Date().getTime()+size));
        punishment.setPunishmentType(1);
        punishment.setPunishmentTime("2day");
        punishment.setOutdated(0);

        int insert = punishmentService.insert(punishment);
        System.out.println("insert = " + insert);

    }

    @Test
    public void testDate(){
        Date date = new Date();
        System.out.println("DataToCommon.getDateMMDDHHMMSS(date) = " + DataToCommon.getDateMMDDHHMMSS(date));
        long dateLong=date.getTime();
        System.out.println("dateLong = " + dateLong);
        long size=1000*60*60*24*3;
        dateLong+=size;
        Date date1 = new Date(dateLong);
        System.out.println("DataToCommon.getDateMMDDHHMMSS(date1) = " + DataToCommon.getDateMMDDHHMMSS(date1));

    }
    @Test
    public void testUpdate(){
        Punishment punishment = new Punishment();
        punishment.setPunishmentId(1);
        punishment.setOutdated(1);
        int update = punishmentService.update(punishment);
        System.out.println("update = " + update);
    }

}
