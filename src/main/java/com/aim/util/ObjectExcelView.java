package com.aim.util;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import com.aim.entity.PageData;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 导出到EXCEL
 */
public class ObjectExcelView extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String filename = DateUtil.getNowTime();
        HSSFSheet sheet;
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");

        HSSFWorkbook book = (HSSFWorkbook) workbook;
        sheet = book.createSheet("sheet1");

        List<String> titles = (List<String>) model.get("titles");
        int len = titles.size();
        HSSFCellStyle headerStyle = book.createCellStyle(); //标题样式
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        HSSFFont headerFont = book.createFont();            //标题字体
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 11);
        headerStyle.setFont(headerFont);
        short height = 25 * 20;
        HSSFRow row = sheet.createRow(0);
        for (int i = 0; i < len; i++) { //设置标题
            String title = titles.get(i);
            row.setRowStyle(headerStyle);
            row.createCell(i).setCellValue(title);
        }
        sheet.getRow(0).setHeight(height);

        HSSFCellStyle contentStyle = book.createCellStyle(); //内容样式
        contentStyle.setAlignment(HorizontalAlignment.CENTER);
        List<PageData> varList = (List<PageData>) model.get("varList");
        int varCount = varList.size();
        for (int i = 0; i < varCount; i++) {
            PageData vpd = varList.get(i);
            HSSFRow rows = sheet.createRow(i + 1);
            for (int j = 0; j < len; j++) {
                String varstr = vpd.getString("var" + (j + 1)) != null ? vpd.getString("var" + (j + 1)) : "";
                rows.setRowStyle(contentStyle);
                rows.createCell(j).setCellValue(varstr);
            }

        }

    }

}
