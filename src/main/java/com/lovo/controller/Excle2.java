package com.lovo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.lovo.entity.MessageEntity;

public class Excle2 {
	
	public static void dbToExcle(List<MessageEntity> list) throws IOException{
		//����Excle
		XSSFWorkbook workbook = new XSSFWorkbook(); 
		//����Execl��
		XSSFSheet spreadsheet = workbook.createSheet("newsheet");
		
		for(int i=0;i<list.size();i++){
	
			//������
		XSSFRow row=	spreadsheet.createRow(i);
			//������
			row.createCell(0).setCellValue(list.get(i).getStudentName());
			row.createCell(1).setCellValue(list.get(i).getSex());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time = sdf.format(list.get(i).getBirthday());
			row.createCell(2).setCellValue(time);
			row.createCell(3).setCellValue(list.get(i).getClassNameId());
			row.createCell(4).setCellValue(list.get(i).getAddress());
			row.createCell(5).setCellValue(list.get(i).getScondition());
			row.createCell(6).setCellValue(list.get(i).getTel());
			row.createCell(7).setCellValue(list.get(i).getFatherName());
			row.createCell(8).setCellValue(list.get(i).getFatherTel());
			row.createCell(9).setCellValue(list.get(i).getMotherName());
			row.createCell(10).setCellValue(list.get(i).getMotherTel());
			row.createCell(11).setCellValue(list.get(i).getScomment());
		}
		
		FileOutputStream out = new FileOutputStream(
			      new File("D:\\poi.xlsx"));
			      workbook.write(out);
			      out.close();
			      System.out.println(
			      "typesofcells.xlsx written successfully");
		
		
	}
}
