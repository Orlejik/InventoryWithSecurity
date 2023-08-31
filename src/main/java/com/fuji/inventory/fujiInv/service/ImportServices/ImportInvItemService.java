package com.fuji.inventory.fujiInv.service.ImportServices;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImportInvItemService {
    void importToDB(List<MultipartFile> multipartFiles);
}
