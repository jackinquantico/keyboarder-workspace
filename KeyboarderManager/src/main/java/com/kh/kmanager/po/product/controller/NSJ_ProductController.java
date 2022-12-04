package com.kh.kmanager.po.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.po.product.model.service.NSJ_ProductService;
import com.kh.kmanager.po.product.model.vo.Product;

@Controller
public class NSJ_ProductController {

	@Autowired
	NSJ_ProductService productService;

	// po상품 메인화면 띄워주기
	@RequestMapping("show.pro")
	public String showProduct() {

		// WEB-INF/views/po/poProduct/

		return "po/poProduct/poProductManageMain";
	}

	/**
	 * po 상품 등록 메인 창으로 이동 -성진
	 * 
	 * @return
	 */
	@RequestMapping("insertEnroll.pro")
	public String insertEnrollForm() {

		return "po/poProduct/poProductInsert";
	}

	/**
	 * po 쿠폰 등록 창으로 이동 -성진
	 * 
	 * @return
	 */
	@RequestMapping("poInsert.co")
	public String poInsertCoupon() {

		return "po/poCoupon/poInsertCoupon";
	}

	/**
	 * po 상품 등록 메소드 -성진
	 * @return
	 */		
	@RequestMapping("insert.pro")
	public ModelAndView insertProduct(Product p, MultipartHttpServletRequest request, HttpSession session, ModelAndView mv)
	throws Exception{
			
		 List<MultipartFile> upfiles = request.getFiles("upfile");
		    
		  String path = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		    
//		    File fileDir = new File(path);
//		    
//		    if (!fileDir.exists()) {
//		    	fileDir.mkdirs();
//		    }
		    
		    long time = System.currentTimeMillis();
		    
		    for (MultipartFile f : upfiles) {
		    
		    	String originFileName = f.getOriginalFilename(); // 원본 파일 명
		        String saveFileName = String.format("%d_%s", time, originFileName);
		        
		        try {
		        	// 파일생성
		            f.transferTo(new File(path, saveFileName));
		            p.setAttachment1(saveFileName);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        System.out.println(p);
		        int result = productService.insertProduct(p);
		        if(result>0) {
		        	session.setAttribute("alertMst", "사진이 업로드 되었습니다.");
		        }
		        else {
		        	
		        }
		       
		   }
		    return mv;
		}
	
	public String attachment(MultipartFile upfile, HttpSession session) {

		// 파일명 수정 작업 후 서버에 업로드 시키기
		// 예) "flower.png" => "2022112210405012345.png"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "flower.png"

		// 2. 시간 형식을 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20221122104050"

		// 3. 뒤에 붙을 5자리 랜덤값 뽑기
		int ranNum = (int) (Math.random() * 90000) + 10000; // 5자리 랜덤값

		// 4. 원본파일로부터 확장자만 뽑기
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"

		// 5. 모두 이어 붙이기
		String attachment = (currentTime + ranNum + ext);

		// 6. 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기
		try {
			((org.springframework.web.multipart.MultipartFile) upfile).transferTo(new File(savePath + attachment));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return attachment;
	}

}
