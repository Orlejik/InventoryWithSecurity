package com.fuji.inventory.fujiInv.service;

import com.fuji.inventory.fujiInv.models.Image;
import com.fuji.inventory.fujiInv.models.ItemName;
import com.fuji.inventory.fujiInv.repositories.ItemNameRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Slf4j
@RequiredArgsConstructor
public class AssetNameService {
    public final ItemNameRepository itemNameRepository;

    public List<ItemName> assetList(String assettype){
        if(assettype != null) return itemNameRepository.findAllByAssettype(assettype);
        return itemNameRepository.findAll();
    }

    public List<ItemName> allItems(){
        return itemNameRepository.findAll();
    }

    public Set<String> getAllItemNames(){
        Set<String> itemNames = new HashSet<>();
        for (ItemName item:allItems()) {
            itemNames.add(item.getAssettype());
        }
        return itemNames;
    }
    public Set<String> getAllItemModels(){
        Set<String> itemModel = new HashSet<>();
        for (ItemName item:allItems()) {
            itemModel.add(item.getAssetModel());
        }
        return itemModel;
    }
    public Set<String> getAllItemBrands(){
        Set<String> itemBrand = new HashSet<>();
        for (ItemName item:allItems()) {
            itemBrand.add(item.getAssetBrand());
        }
        return itemBrand;
    }



    public void saveAsset(ItemName itemName, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        Image image1;
        Image image2;
        Image image3;

        if(file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            itemName.addImageToItemName(image1);
        }
        if(file2.getSize() != 0){
            image2 = toImageEntity(file2);
            itemName.addImageToItemName(image2);
        }
        if(file3.getSize() != 0){
            image3 = toImageEntity(file3);
            itemName.addImageToItemName(image3);
        }

        ItemName itemFromDB = itemNameRepository.save(itemName);
        itemFromDB.setPreviewImageId(itemFromDB.getImages().get(0).getId());
        itemNameRepository.save(itemName);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteAsset(Long id){
        log.info("Asset with ID \"{}\" ({}) was deleted", id, getItemByID(id));
        itemNameRepository.delete(getItemByID(id));
    }

    public ItemName getItemByID(Long id){
        return itemNameRepository.findById(id).orElse(null);
    }
}
