package pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Province implements Serializable {
    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    @JsonBackReference
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    @JsonBackReference
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Province{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
    public static List<Province> getallProvinces(){
        List<Province> provinces=new ArrayList<Province>();
        Province province1=new Province();
        province1.setId(1);province1.setName("北京");
        Province province2=new Province();
        province2.setId(2);province2.setName("上海");
        Province province3=new Province();
        province3.setId(3);province3.setName("南阳");
        provinces.add(province1);
        provinces.add(province2);
        provinces.add(province3);
        return provinces;
    }
}
