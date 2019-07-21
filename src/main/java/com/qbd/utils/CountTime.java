package com.qbd.utils;

import com.qbd.pojo.Discount;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CountTime {
    public static Date getEndTime(Date startTime,int howLong) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        String nowTime = null;
        try {
            nowTime = sdf.format(startTime);
        //打印当前日期
            System.out.println("nowTime="+nowTime);

            calendar.setTimeInMillis(sdf.parse(nowTime).getTime());
        } catch (ParseException e) {
        // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //设置多少天后的日期
        calendar.add(Calendar.DAY_OF_MONTH, howLong);
        String endTime = sdf.format(calendar.getTime());
        System.out.println("得到的时间："+calendar.getTime());
        return calendar.getTime();//返回时间
    }
    public static void main(String []args){
        new CountTime().getEndTime(new Date(),10);
    }
}
