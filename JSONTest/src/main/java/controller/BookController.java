package controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Book;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class BookController {
    @RequestMapping("/jsonTest")
    public void jsonTest(HttpServletResponse response, @RequestBody Book book) throws IOException {
        ObjectMapper objectMapper=new ObjectMapper();
        //ObjectMapper是JSON库中的主要类，它提供了一些功能将java转换成对应的JSON格式的数据
        //这里没有将他转换成json对象
        System.out.println(objectMapper.writeValueAsString(book));
        book.setAuthor("朱海涛");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(objectMapper.writeValueAsString(book));
    }

}
