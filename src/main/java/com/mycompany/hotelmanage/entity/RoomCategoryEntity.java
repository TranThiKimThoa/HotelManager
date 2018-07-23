package com.mycompany.hotelmanage.entity;

import java.awt.Image;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "room_category")
public class RoomCategoryEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String categoryRoomName;

    @Column(name = "categoryRoomDescription", length = 1000)
    private String categoryRoomDescription;

    private String images;

    @OneToMany(mappedBy = "roomCa", fetch = FetchType.EAGER)
    private List<RoomEntity> roomEnt;

    public RoomCategoryEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryRoomName() {
        return categoryRoomName;
    }

    public void setCategoryRoomName(String categoryRoomName) {
        this.categoryRoomName = categoryRoomName;
    }

    public String getCategoryRoomDescription() {
        return categoryRoomDescription;
    }

    public void setCategoryRoomDescription(String categoryRoomDescription) {
        this.categoryRoomDescription = categoryRoomDescription;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public List<RoomEntity> getRoomEnt() {
        return roomEnt;
    }

    public void setRoomEnt(List<RoomEntity> roomEnt) {
        this.roomEnt = roomEnt;
    }

}
