package com.ezen.teamb;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FileDownloadController {
   //파일의 저장 위치를 
   private static String CURR_IMAGE_REPO_PATH = "C:\\BTeam\\src\\main\\webapp\\image";

   @RequestMapping("/download")
   //다운 로드할 이미지 화일 이름을 알려줌 
   public void download(@RequestParam("imageFileName") String imageFileName,
                          HttpServletResponse response)throws Exception {
      OutputStream out = response.getOutputStream();
      String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
      //다운로드할 파일의 객체를 생성
      File file = new File(downFile);

   //   response.setHeader("Cache-Control", "no-cache");
   //   response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
      FileInputStream in = new FileInputStream(file);
      //8KB 의 크기를 설정...
      byte[] buffer = new byte[1024 * 8];
      while (true) {
         int count = in.read(buffer); // 버퍼에 읽어들인 문자개수
         if (count == -1) // 버퍼의 마지막에 도달했는지 체크
            break;
         out.write(buffer, 0, count);
      }
      in.close();
      out.close();
   }

}