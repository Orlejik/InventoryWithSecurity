package com.fuji.inventory.fujiInv.repositories;

import com.fuji.inventory.fujiInv.models.Image;
import com.fuji.inventory.fujiInv.models.ItemName;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemNameRepository  extends JpaRepository<ItemName, Long>{
    List<ItemName> findAllByAssettype(String assettype);

    List<ItemName> findAll();

}
