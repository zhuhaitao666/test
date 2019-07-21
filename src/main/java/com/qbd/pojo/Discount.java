package com.qbd.pojo;

import java.util.Date;

public class Discount {
    private Integer discountId;
    private String discountType;
    private Double value;
    private Double full;

    public Integer getDiscountId() {
        return discountId;
    }

    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Double getFull() {
        return full;
    }

    public void setFull(Double full) {
        this.full = full;
    }

    @Override
    public String toString() {
        return "Discount{" +
                "discountId=" + discountId +
                ", discountType='" + discountType + '\'' +
                ", value='" + value + '\'' +
                ", full=" + full +
                '}';
    }


}
