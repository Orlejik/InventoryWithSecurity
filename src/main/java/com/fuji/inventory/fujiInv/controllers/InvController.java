package com.fuji.inventory.fujiInv.controllers;

import com.fuji.inventory.fujiInv.ExcelExporterImporter.ExcelExporter;
import com.fuji.inventory.fujiInv.models.*;
import com.fuji.inventory.fujiInv.repositories.UserRepository;
import com.fuji.inventory.fujiInv.service.AssetNameService;
import com.fuji.inventory.fujiInv.service.ImportServices.ImportInvItemService;
import com.fuji.inventory.fujiInv.service.ItemService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class InvController {
    private final ItemService itemService;
    private final ImportInvItemService importInvItemService;
    private final UserRepository userRepository;
    private final AssetNameService assetNameService;

    @GetMapping("/")
    public String items(@RequestParam(name = "plant", required = false) String plant,
                        @RequestParam(name = "faenumber", required = false) String faenumber,
                        @RequestParam(name = "sisnumber", required = false) String sisnumber,
                        @RequestParam(name = "itemname", required = false) String itemname,
                        @RequestParam(name = "itembrand", required = false) String itembrand,
                        @RequestParam(name = "itemmodel", required = false) String itemmodel,
                        @RequestParam(name = "serialnumber", required = false) String serialnumber,
                        Model model,
                        Principal principal
    ) {

        User user = userRepository.findByUsername(principal.getName());

        model.addAttribute("items", itemService.itemList(plant, faenumber, sisnumber, itemname, itembrand, itemmodel, serialnumber));
        model.addAttribute("logenedUser", principal.getName());
        model.addAttribute("userRole", user.getRoles());
        return "listOfItems";
    }

    @GetMapping("/item/{id}")
    public String itemInfo(@PathVariable Long id, Model model, Principal principal) {
        InvItem item = itemService.getItemById(id);
        List<Logs> logs = itemService.getLogsByItem_Id(id);
        List<Image> images = itemService.getImagesByItemName_Assettype(item.getItemmodel());
        model.addAttribute("item", item);
        User user = userRepository.findByUsername(principal.getName());
        model.addAttribute("logenedUser", principal.getName());
        model.addAttribute("userRole", user.getRoles());
        model.addAttribute("images", images);
        model.addAttribute("logs", logs);
        return "item-info";
    }

    @GetMapping("/additem")
    public String additem(Model model, String assetType, Principal principal) {
        User user = userRepository.findByUsername(principal.getName());
        model.addAttribute("logenedUser", principal.getName());
        model.addAttribute("userRole", user.getRoles());
        List<ItemName> assets = assetNameService.assetList(assetType);
        model.addAttribute("itemNames", assets);
        model.addAttribute("itemnames", assetNameService.getAllItemNames());
        model.addAttribute("itembrands", assetNameService.getAllItemBrands());
        model.addAttribute("itemmodels", assetNameService.getAllItemModels());
        return "additem";
    }

    @PostMapping("/item/create")
    public String createItem(InvItem invItem, Principal principal, Logs logs) {
        itemService.saveItem(invItem, logs, principal);
        return "redirect:/additem";
    }

    @PostMapping("/item/{id}/update")
    public String updateItem(@PathVariable Long id, InvItem invItem, Principal principal, Logs logs) {
        InvItem item = itemService.updateItem(id);
        item.setPlant(invItem.getPlant());
        item.setLocation(invItem.getLocation());
        item.setDamaged(invItem.isDamaged());
        item.setHostname(invItem.getHostname());
        item.setIp_address(invItem.getIp_address());
        item.setUser_name(invItem.getUser_name());
        item.setDepartment(invItem.getDepartment());
        item.setOperator_number(invItem.getOperator_number());
        log.info("item with id {} saved in DB", item.getId());
        itemService.saveUpdatedItem(item, logs, principal);
        return "redirect:/item/{id}";
    }

    @GetMapping("/charts")
    public String seeTheCharts(Principal principal, Model model) {
        User user = userRepository.findByUsername(principal.getName());
        model.addAttribute("logenedUser", principal.getName());
        model.addAttribute("userRole", user.getRoles());

        model.addAttribute("itemnames", new HashSet<>(itemService.ListOfItemnames()));

        model.addAttribute("itemnamesLength", itemService.countItemNamesByPlant());
        model.addAttribute("itembrandsLength", itemService.countItemBrandsByPlant());
        model.addAttribute("itemmodelsLength", itemService.countItemModelsByPlant());
        return "chartsByModel";
    }

    @GetMapping("/charts/export/")
    public void exportToExcel(HttpServletResponse response, Model model) throws IOException{
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=List_of_inventory_"+currentDateTime+".xlsx";
        response.setHeader(headerKey, headerValue);
        List<InvItem> itemsList = itemService.findAllItems();

        ExcelExporter excelExporter = new ExcelExporter(itemsList);
        excelExporter.export(response);
    }

    @PostMapping("/charts/import/")
    public void importInvItemsFromExcelToDB(@RequestPart(required = true)List<MultipartFile> files){
        importInvItemService.importToDB(files);
    }
}
