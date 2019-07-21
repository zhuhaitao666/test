package com.qbd.pojo;

public class ShoesType1 {
    private Integer id;
    private String color;
    private String size;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }



    @Override
    public String toString() {
        return "ShoesType1{" +
                "id=" + id +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +

                '}';
    }
}
