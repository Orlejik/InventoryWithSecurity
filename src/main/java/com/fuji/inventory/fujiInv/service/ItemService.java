package com.fuji.inventory.fujiInv.service;

import com.fuji.inventory.fujiInv.models.Image;
import com.fuji.inventory.fujiInv.models.InvItem;
import com.fuji.inventory.fujiInv.models.ItemName;
import com.fuji.inventory.fujiInv.models.Logs;
import com.fuji.inventory.fujiInv.repositories.ImageRepository;
import com.fuji.inventory.fujiInv.repositories.InvRepository;
import com.fuji.inventory.fujiInv.repositories.LogRepository;
import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;

@RequiredArgsConstructor
@Slf4j
@Service
public class ItemService {
    public final InvRepository invRepository;
    public final ImageRepository imageRepository;

    public final LogRepository logRepository;

    public List<InvItem> itemList(String plant, String faenumber, String sisnumber, String itemname, String itembrand, String itemmodel, String serialnumber) {
        if (plant != null || faenumber != null || sisnumber != null || itemname != null || itembrand != null || itemmodel != null || serialnumber != null) {
            return invRepository.findAllByPlantOrFaenumberOrSisnumberOrItemnameOrItembrandOrItemmodelOrSerialnumber(
                    plant, faenumber, sisnumber, itemname, itembrand, itemmodel, serialnumber);
        }
        return invRepository.findAll();
    }

    public List<Image> getImagesByItemName_Assettype(String itemtype) {
        return imageRepository.getImagesByItemName_AssetModel(itemtype);
    }

    public List<Logs> getLogsByItem_Id(Long id) {
        return logRepository.getLogsByItem_Id(id);
    }

    public void saveItem(InvItem invItem, Logs logs, Principal principal) {
        logs.setLogText(
                principal.getName() + " added new item in " + invItem.getPlant() + " - " + invItem.getItemname() + " " + invItem.getItembrand() + " - "
                        + invItem.getItemmodel() + " is " + invItem.isDamaged() + " which places in " + invItem.getLocation() + " identified by " + invItem.getHostname() + " or "
                        + invItem.getIp_address() + " is using by " + invItem.getUser_name() + " " + invItem.getOperator_number() + " working in " + invItem.getDepartment() + " department"
        );
        invItem.addLogToInvItem(logs);
        invItem.setUser_added_item(principal.getName());
        invRepository.save(invItem);
    }

    //    UPDATE RECORD IN DATABASE
    public InvItem updateItem(Long id) {
        Optional<InvItem> item = invRepository.getInvItemById(id);
        InvItem invItem = null;
        if (item.isPresent()) {
            invItem = item.get();
        } else {
            throw new RuntimeException("No such Item with id = " + id);
        }
        return invItem;
    }

    //    create a new log as entity
    private Logs toLogsEntity(Logs log) {
        Logs logs = new Logs();
        logs.setLogText(log.getLogText());
        return logs;
    }

    public void saveUpdatedItem(InvItem invItem, Logs logs, Principal principal) {
        Logs logs1;
        logs.setLogText(
                principal.getName() + " updated new item in " + invItem.getPlant() + " - " + invItem.getItemname() + " " + invItem.getItembrand() + " - "
                        + invItem.getItemmodel() + " is " + invItem.isDamaged() + " which places in " + invItem.getLocation() + " identified by " + invItem.getHostname() + " or "
                        + invItem.getIp_address() + " is using by " + invItem.getUser_name() + " " + invItem.getOperator_number() + " working in " + invItem.getDepartment() + " department"
        );
        logs1 = toLogsEntity(logs);
        invItem.addLogToInvItem(logs1);
        log.info("Item with id {} updated", invItem.getId());
        invRepository.save(invItem);
    }

    public InvItem getItemById(Long id) {
        return invRepository.findById(id).orElse(null);
    }

//    ---------Counting items for Charts! -----------------

    public List<InvItem> findAllItems() {
        return invRepository.findAll();
    }

    List<InvItem> foundByPlant(String plant) {
        return invRepository.findAllByPlant(plant);
    }

    public List<String> ListOfItemnames() {
        List<String> itemnames = new ArrayList<>();
        for (InvItem item : findAllItems()) {
            itemnames.add(item.getItemname());
        }
        return itemnames;
    }

    Set<String> getPlants() {
        Set<String> plants = new HashSet<>();
        for (InvItem item : findAllItems()) {
            plants.add(item.getPlant());
        }
        return plants;
    }
//    Count by Item Name :

    public Map<String, Long> contbyitemname(String plant) {
        Map<String, Long> itemsNamesCount = new HashMap<>();
        for (InvItem item : findAllItems()) {
            if (invRepository.countAllByItemnameAndPlant(item.getItemname(), plant) == 0) {
                continue;
            }
            itemsNamesCount.put(item.getItemname(), invRepository.countAllByItemnameAndPlant(item.getItemname(), plant));
        }
        return itemsNamesCount;
    }

    public Map<String, Map<String, Long>> countItemNamesByPlant() {
        Map<String, Map<String, Long>> itemNamesByPlant = new HashMap<>();
        for (String plant : getPlants()) {
            for (InvItem item : foundByPlant(plant)) {
                itemNamesByPlant.put(plant, (contbyitemname(plant)));
            }
        }
        return itemNamesByPlant;
    }

    //    Count by Item Brand :
    public Map<String, Long> contbyitemBrand(String plant) {
        Map<String, Long> itemsBrandsCount = new HashMap<>();
        for (InvItem item : findAllItems()) {
            if (invRepository.countAllByItembrandAndPlant(item.getItembrand(), plant) == 0) {
                continue;
            }
            itemsBrandsCount.put(item.getItembrand(), invRepository.countAllByItembrandAndPlant(item.getItembrand(), plant));
        }
        return itemsBrandsCount;
    }

    public Map<String, Map<String, Long>> countItemBrandsByPlant() {
        Map<String, Map<String, Long>> itemBrandsByPlant = new HashMap<>();
        for (String plant : getPlants()) {
            for (InvItem item : foundByPlant(plant)) {
                itemBrandsByPlant.put(plant, (contbyitemBrand(plant)));
            }
        }
        return itemBrandsByPlant;
    }

    //    Count by Item Model :
    public Map<String, Long> contbyitemModel(String plant) {
        Map<String, Long> itemsModelsCount = new HashMap<>();
        for (InvItem item : findAllItems()) {
            if (invRepository.countAllByItemmodelAndPlant(item.getItemmodel(), plant) == 0) {
                continue;
            }
            itemsModelsCount.put(item.getItemmodel(), invRepository.countAllByItemmodelAndPlant(item.getItemmodel(), plant));
        }
        return itemsModelsCount;
    }

    public Map<String, Map<String, Long>> countItemModelsByPlant() {
        Map<String, Map<String, Long>> itemModelsByPlant = new HashMap<>();
        for (String plant : getPlants()) {
            for (InvItem item : foundByPlant(plant)) {
                itemModelsByPlant.put(plant, (contbyitemModel(plant)));
            }
        }
        return itemModelsByPlant;
    }
}


