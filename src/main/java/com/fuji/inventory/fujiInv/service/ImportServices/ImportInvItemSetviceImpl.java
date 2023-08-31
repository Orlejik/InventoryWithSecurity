package com.fuji.inventory.fujiInv.service.ImportServices;

import com.fuji.inventory.fujiInv.models.InvItem;
import com.fuji.inventory.fujiInv.repositories.InvRepository;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ImportInvItemSetviceImpl implements ImportInvItemService {

    @Autowired
    private InvRepository invRepository;

    @Override
    public void importToDB(List<MultipartFile> multipartFiles) {
        if (!multipartFiles.isEmpty()){
            List<InvItem> invItems = new ArrayList<>();
            multipartFiles.forEach(multipartFile -> {
                try{
                    XSSFWorkbook workbook = new XSSFWorkbook(multipartFile.getInputStream());

                    XSSFSheet sheet = workbook.getSheetAt(0);
//                    looping through each row
                    for (int rowIndex=0; rowIndex<getNumberOfNonEmptyCells(sheet, 0)-1; rowIndex++) {
//                        current row
                        XSSFRow row = sheet.getRow(rowIndex);
                        // skip the first row because it is a header row
                        if (rowIndex == 0){
                            continue;
                        }
                        Long itemId = Long.parseLong(getValue(row.getCell(0)).toString());
                        String plant = String.valueOf(row.getCell(1));
                        String faenum = String.valueOf(row.getCell(2));
                        String sisnum = String.valueOf(row.getCell(3));
                        String itemname = String.valueOf(row.getCell(4));
                        String brand = String.valueOf(row.getCell(5));
                        String model = String.valueOf(row.getCell(6));
                        String serialnumber = String.valueOf(row.getCell(7));
                        String location = String.valueOf(row.getCell(8));
                        String hostname = String.valueOf(row.getCell(9));
                        String ip_address = String.valueOf(row.getCell(10));
                        String isDamaged = String.valueOf(row.getCell(11));
                        String username = String.valueOf(row.getCell(12));
                        String department = String.valueOf(row.getCell(13));
                        String operator_number = String.valueOf(row.getCell(14));

                        InvItem invItem = InvItem.builder().id(itemId).plant(plant)
                                .faenumber(faenum)
                                .sisnumber(sisnum)
                                .itemname(itemname)
                                .itembrand(brand)
                                .itemmodel(model)
                                .serialnumber(serialnumber)
                                .location(location)
                                .hostname(hostname)
                                .ip_address(ip_address)
                                .isDamaged(Boolean.parseBoolean(isDamaged))
                                .user_name(username)
                                .department(department)
                                .operator_number(operator_number).build();

                        invItems.add(invItem);

                    }

                }catch (IOException e){
                    e.printStackTrace();
                }
            });
            if (!invItems.isEmpty()){
                //save to database
                invRepository.saveAll(invItems);
            }
        }
    }

    private Object getValue(Cell cell){
        switch (cell.getCellType()){
            case STRING: return cell.getStringCellValue();
            case NUMERIC: return String.valueOf((int) cell.getNumericCellValue());
            case BOOLEAN: return cell.getBooleanCellValue();
            case ERROR: return cell.getErrorCellValue();
            case FORMULA:return cell.getCellFormula();
            case BLANK: return null;
            case _NONE: return null;
            default: break;
        }
        return null;
    }

    public static int getNumberOfNonEmptyCells(XSSFSheet sheet, int columnIndex){
        int numOfNonEmptyCell = 0;
        for (int i = 0; i < sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            if (row != null){
                XSSFCell cell = row.getCell(columnIndex);
                if (cell != null && cell.getCellType() != CellType.BLANK){
                    numOfNonEmptyCell++;
                }
            }
        }
        return numOfNonEmptyCell;
    }
}
