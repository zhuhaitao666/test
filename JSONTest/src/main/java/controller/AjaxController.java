package controller;

import com.sun.deploy.net.HttpResponse;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.City;
import pojo.Province;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class AjaxController {
    @RequestMapping("/ajaxTest")
    public void  AjaxTest(HttpServletResponse response){
        System.out.println("成功访问到视图层");
        //无法跳转回去
        try {
            response.getWriter().print(new Date().toLocaleString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/ajaxTestSamePassword")
    public void AjaxTest1(HttpServletResponse response, String username, String password, String repeatPassword){
        System.out.println(password+"  "+repeatPassword);
        try {
            if(password.equals(repeatPassword)){
                response.getWriter().print(true);//判断用户俩次输入的密码是否一致
            }else{
                response.getWriter().print(false);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getCity")
    public void Level2Linkage(HttpServletResponse response,String id) throws IOException {
        response.setContentType("text/json;charset=UTF-8");
        if (id==null)
        {
            Province province=new Province();
            List<Province>provinces =province.getallProvinces();
            JSONArray JSONStr=JSONArray.fromObject(provinces);
            response.getWriter().print(JSONStr);
        }
        else{
            City city=new City();
            List<City> cities=city.getCitites(Integer.parseInt(id));
            JSONArray JSONStr=JSONArray.fromObject(cities);
            response.getWriter().print(JSONStr);
        }

    }
}
