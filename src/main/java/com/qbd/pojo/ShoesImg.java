package com.qbd.pojo;

import java.util.Date;

public class ShoesImg {
    private Integer goodsImgId;
    private String path;
    private Date uploadTime;
    private String uploader;

    public Integer getGoodsImgId() {
        return goodsImgId;
    }

    public void setGoodsImgId(Integer goodsImgId) {
        this.goodsImgId = goodsImgId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    @Override
    public String toString() {
        return "BooksImg{" +
                "goodsImgId=" + goodsImgId +
                ", path='" + path + '\'' +
                ", uploadTime=" + uploadTime +
                ", uploader='" + uploader + '\'' +
                '}';
    }
}
