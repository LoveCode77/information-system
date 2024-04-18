package com.kuang.util;

import com.kuang.pojo.Punishment;
import com.kuang.service.PunishmentService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class DataToCommon {

    public static String getDateMMDDHHMMSS(Date date){
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("MM/dd hh:mm:ss");
        String format = simpleDateFormat.format(date);

        return format;
    }
    public static String getDateMMDD(Date date){
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("MM/dd");
        String format = simpleDateFormat.format(date);

        return format;
    }

    /**
     * 返回日期加上相应天数后的日期
     * @param date
     * @param day
     * @return
     */
    public static Date addDate(Date date,float day){
        long dateLong=date.getTime();
        long dayLong= (long) (1000*60*60*24*day);
        dateLong+=dayLong;
        Date date1 = new Date(dateLong);
        return date1;
    }

    /**
     * date1是否大于date2
     *
     * @param date1
     * @param date2
     * @return
     */
    public static Boolean isOutdated(Date date1,Date date2){
        long long1=date1.getTime();
        long long2=date2.getTime();
        if(long1>long2){
            return true;
        }
        return false;
    }

    public static void updateP(PunishmentService punishmentService){
        List<Punishment> query = punishmentService.query(new Punishment());
        for (Punishment p : query) {
            if(isOutdated(new Date(),p.getPunishmentOver())){
                p.setOutdated(1);
            }
        }
    }

}
