package com.fuji.inventory.fujiInv.service.ImportServices;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImportItemNameService {
    void importToDB(List<MultipartFile> multipartFiles);
}
