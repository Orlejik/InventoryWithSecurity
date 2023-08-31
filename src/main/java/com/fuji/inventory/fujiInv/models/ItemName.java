package com.fuji.inventory.fujiInv.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "assets")
@Data
@AllArgsConstructor
@NoArgsConstructor
//@Builder(toBuilder = true)
//@EntityListeners(ItemNameListener.class)
public class ItemName {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "asset_type")
    private String assettype;
    @Column(name = "asset_brand")
    private String assetBrand;
    @Column(name = "asset_model")
    private String assetModel;


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "itemName")
    private List<Image> images = new ArrayList<>();



    private Long previewImageId;
    private LocalDateTime creationDate;
    @PrePersist //to read about inversion of control
    private void init() {
        creationDate = LocalDateTime.now();
    }
    public void addImageToItemName(Image image) {
        image.setItemName(this);
        images.add(image);
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<InvItem> invItem = new ArrayList<>();
}
