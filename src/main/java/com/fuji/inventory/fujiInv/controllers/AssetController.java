package com.fuji.inventory.fujiInv.controllers;

import com.fuji.inventory.fujiInv.models.ItemName;
import com.fuji.inventory.fujiInv.models.User;
import com.fuji.inventory.fujiInv.repositories.UserRepository;
import com.fuji.inventory.fujiInv.service.AssetNameService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@AllArgsConstructor
public class AssetController {
    private final AssetNameService assetNameService;
    private final UserRepository userRepository;


    @GetMapping("/assets-add")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String assets(@RequestParam(name = "assetType", required = false) String assetType, Model model, Principal principal) {
        model.addAttribute("assets", assetNameService.assetList(assetType));
        User user = userRepository.findByUsername(principal.getName());
        model.addAttribute("logenedUser", principal.getName());
        model.addAttribute("userRole", user.getRoles());
        return "assets-add";
    }

    @PostMapping("/assets/create")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String createAsset(@RequestParam("file1") MultipartFile file1,
                              @RequestParam("file2") MultipartFile file2,
                              @RequestParam("file3") MultipartFile file3,
                              ItemName itemName) throws IOException {
        assetNameService.saveAsset(itemName, file1, file2, file3);
        return "redirect:/assets-add";
    }

    @PostMapping("/assets/delete/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteAsset(@PathVariable Long id) {
        assetNameService.deleteAsset(id);
        return "redirect:/assets-add";
    }

}
