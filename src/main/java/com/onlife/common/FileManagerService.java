package com.onlife.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 실제 이미지가 (컴퓨터에) 저장될 경로
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\luthi\\OneDrive\\바탕 화면\\Web개발\\06. Spring_project\\quiz\\Onlife_workspace\\Onlife\\images/";
	
	// 이미지를 저장 -> URL Path 리턴
	public String saveFile(String userLoginId, MultipartFile file) throws IOException {
		// 파일을 컴퓨터에 저장
		
		// 1. 파일 디렉토리 경로 만듦(겹치지 않게) 	예: marobiana_1620998551/sun.png
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";	// marobiana_1620998551/
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {	// 파일을 업로드 할 filePath 경로에 폴더 생성을 한다.
			logger.error("[파일업로드] 디렉토리 생성 실패");
			// 디렉토리 생성 실패
			return null;
		}
		
		// 파일 업로드 => byte 단위로 업로드한다.
		byte[] bytes = file.getBytes();
		Path path = Paths.get(filePath + file.getOriginalFilename());
		Files.write(path, bytes);
		
		// 이미지 URL 만들어 리턴
		return "/images/" + directoryName;
	}
}