package com.yang.app.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@RestController
public class CommonController {
	
	// 파일 출력
	@RequestMapping("/getImage")
	public void getImage(@RequestParam("filename") final String filename, final HttpServletResponse response) {
		// 서버에 저장된 이미지 경로
		String path = "C:/tempImage";
		String sDirPath = path + "/" + filename;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 준비해둔 이미지 파일을 설정한다.
		if (!imgFile.exists() || !imgFile.isFile())
			imgFile = new File(path + "/NOT_FOUND.jpg");

		byte[] buf = new byte[1024];
		int readByte;
		int length;
		byte[] imgBuf;

		
		// 41번째줄 == 해당 이미지파일을 불러들일 스트림 생성 == 1 바이트씩 뽑아올 길 생성
		// 42번째줄 == 해당 이미지파일을 내보낼 스트림 생성 == 1 바이트씩 보내는 길 생성
		// 43번째줄 == 클라이언트한테 보내줄 통로 생성
		
		try (FileInputStream fileInputStream = new FileInputStream(imgFile);
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				ServletOutputStream out = response.getOutputStream();) {
			// (readByte = fileInputStream.read(buf) == 읽을 파일이 없으면 -1을 리턴한다.
			while ((readByte = fileInputStream.read(buf)) != -1) {
				// 1바이트 씩 뽑아온다.
				// 뽑아온 데이터를 버퍼에 넣어준다.
				outputStream.write(buf, 0, readByte); // 베열리스트.add 하듯이 데이터가 차곡차곡 쌓인다.
			}
			imgBuf = outputStream.toByteArray(); // 해당 이미지파일의 전체 바이트를 해당 변수에 저장한다.
			length = imgBuf.length; // 파일 총 길이 == 가로x세로
			out.write(imgBuf, 0, length); // 뽑아온 데이터의 총 길이만큼만 수행한다.
			//(imgBuf, 0, length) == 이미지파일의 바이트 데이터,0번째 인덱스부터 작업 수행 ,끝(바이트의 총 길이) == 정확한 데이터 출력을 위해 imgBuf, length 모두 존재해야 한다.
			out.flush();
			//flush() == 목욕탕 배수구 열어 물빼는 작업 == 왔던 길 통로 비워주는 작업
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}
