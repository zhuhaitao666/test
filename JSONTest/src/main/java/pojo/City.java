package pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.util.ArrayList;
import java.util.List;

public class City {
    private Integer id;
    private String  name;

    public City() {
    }

    public City(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

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

    public List<City> getCitites(int id){
        List<City> cities=new ArrayList<City>();
        if (id==1)
        {
            cities.add(new City(1,"朝阳区"));
            cities.add(new City(2,"东城区"));
            cities.add(new City(3,"西城区"));
            cities.add(new City(4,"海淀区"));
            cities.add(new City(5,"大兴区"));
        }
        else if (id==2){
           cities.add(new City(1,"浦东新区"));
           cities.add(new City(2,"虹口区"));
           cities.add(new City(3,"闵行区"));
           cities.add(new City(4,"青浦区"));
        }
        else if (id==3){
            cities.add(new City(1,"宛城区"));
        }
        return cities;
    }
}
