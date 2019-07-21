package test;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.jupiter.api.Test;
import pojo.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class JSONTest{
    //将java对象转换成JSON
    @Test
    public void TestJson(){
        User user=new User();
        user.setUserId(1715925062);
        user.setUserName("朱海涛");
        user.setUserAge(18);
        JSONObject object=JSONObject.fromObject(user);
        System.out.println(object);
    }
    //将java数组转换成JSON
    @Test
    public void TestArray(){
        String [] usersName= {"小明","小刚","小涛","小浪"};
        JSONArray arrays=JSONArray.fromObject(usersName);
        System.out.println(arrays);
    }
    //将List转换成JSON
    @Test
    public void TestList(){
        List <User> users=new ArrayList<User>();
        for(int i=0;i<3;i++){
            User user =new User();
            user.setUserName("张三"+i);
            user.setUserId(new Random().nextInt(100));
            user.setUserAge(new Random().nextInt(100));
            users.add(user);
        }
        JSONArray jsonArray=JSONArray.fromObject(users);
        System.out.println(jsonArray);
    }
}
