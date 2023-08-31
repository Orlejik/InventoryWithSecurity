package com.fuji.inventory.fujiInv.repositories;

import com.fuji.inventory.fujiInv.models.InvItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface InvRepository extends JpaRepository<InvItem, Long> {

    Optional<InvItem> getInvItemById(Long id);

    List<InvItem> findAllByPlantOrFaenumberOrSisnumberOrItemnameOrItembrandOrItemmodelOrSerialnumber(
            String plant, String faenumber, String sisnumber, String itemname, String itembrand, String itemmodel, String serialnumber);


    List<InvItem> findAll();
    long countAllByItemnameAndPlant(String itemname, String plant);

    long countAllByItembrandAndPlant(String itembrand, String plant);
    long countAllByItemmodelAndPlant(String itemmodel, String plant);
    List<InvItem> findAllByPlant(String plant);
}
