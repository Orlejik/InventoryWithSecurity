package com.fuji.inventory.fujiInv.repositories;

import com.fuji.inventory.fujiInv.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> {
    List<Image> getImagesByItemName_AssetModel(String itemModel);
}
