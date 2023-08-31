package com.fuji.inventory.fujiInv.ExcelExporterImporter;

import com.fuji.inventory.fujiInv.models.InvItem;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.util.List;

public class ExcelExporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<InvItem> listOfItems;

    public ExcelExporter(List<InvItem> listOfItems){
        this.listOfItems = listOfItems;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine(){
        sheet = workbook.createSheet("Inventory");
        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);

        createCell(row, 0, "Plant",style);
        createCell(row, 1, "FAE Number",style);
        createCell(row, 2, "SIS Number",style);
        createCell(row, 3, "Item Type",style);
        createCell(row, 4, "Item Brand",style);
        createCell(row, 5, "Item Model",style);
        createCell(row, 6, "Serial Number",style);
        createCell(row, 7, "Location",style);
        createCell(row, 8, "Hostname",style);
        createCell(row, 9, "IP Address",style);
        createCell(row, 10, "Workable / Damaged",style);
        createCell(row, 11, "User's name",style);
        createCell(row, 12, "User's Department",style);
        createCell(row, 13, "User's Op Number",style);
    }

    public void createCell(Row row, int columnCount, Object value, CellStyle style){
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer){
            cell.setCellValue((Integer) value);
        }else if (value instanceof Boolean){
            cell.setCellValue((Boolean) value);
        }else{
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines(){
        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font =  workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);

        for (InvItem item: listOfItems){
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;

            createCell(row, columnCount++, item.getPlant(), style);
            createCell(row, columnCount++, item.getFaenumber(), style);
            createCell(row, columnCount++, item.getSisnumber(), style);
            createCell(row, columnCount++, item.getItemname(), style);
            createCell(row, columnCount++, item.getItembrand(), style);
            createCell(row, columnCount++, item.getItemmodel(), style);
            createCell(row, columnCount++, item.getSerialnumber(), style);
            createCell(row, columnCount++, item.getLocation(), style);
            createCell(row, columnCount++, item.getHostname(), style);
            createCell(row, columnCount++, item.getIp_address(), style);
            createCell(row, columnCount++, item.isDamaged(), style);
            createCell(row, columnCount++, item.getUser_name(), style);
            createCell(row, columnCount++, item.getDepartment(), style);
            createCell(row, columnCount++, item.getOperator_number(), style);
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();
    }

}
