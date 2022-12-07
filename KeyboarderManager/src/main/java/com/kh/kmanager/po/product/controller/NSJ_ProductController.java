package com.kh.kmanager.po.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.po.product.model.service.NSJ_ProductService;
import com.kh.kmanager.po.product.model.service.ProductService;
import com.kh.kmanager.po.product.model.vo.Product;

@Controller
public class NSJ_ProductController {

	@Autowired
	NSJ_ProductService productService;

	/**
	 * po 전체 상품 조회 메소드 -성진
	 * 
	 * @return
	 */
	// po상품 메인화면 띄워주기
	@RequestMapping("show.pro")
	public String showProduct(Product p, Model model) {

		ArrayList<Product> list = productService.showProduct(p);

		// WEB-INF/views/po/poProduct/
		model.addAttribute("list", list);
		return "po/poProduct/poProductManageMain";
	}

	/**
	 * po 상세 상품 조회
	 * 
	 * @return
	 */
	@RequestMapping("detail.pro")
	public ModelAndView detailProduct(int productNo, ModelAndView mv) {

		Product p = productService.detailProduct(productNo);
		System.out.println(p);

		mv.addObject("p", p).setViewName("po/poProduct/poProductUpdate");

		return mv;
	}

	
	/**
	 * po 상품 수정 메소드 -성진
	 * 
	 * @return //
	 */
	@RequestMapping("update.pro")
	public String updateProduct(Product p, List<MultipartFile> reupfile, HttpSession session) throws Exception {
		// 새로넘어온 첨부파일이 있는 경우 => 기존 넘어온 첨부파일을 삭제

		int c = 0;
		// 기존 첨부파일이 있었을 경우 => 기존첨부파일을 찾아서 삭제
		for (MultipartFile f : reupfile) {
			if(!f.getOriginalFilename().equals("")) {
				// 수정 파일명 만들기
				String path = session.getServletContext().getRealPath("/resources/uploadFiles/");
				String originFileName = f.getOriginalFilename();// 원본 파일 명
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String saveFileName = String.format("%s%s", currentTime, ext);

				try {
					if (c == 0) {
						if(p.getAttachment1()!=null)
						session.getServletContext().getRealPath(p.getAttachment1());
						new File(path).delete();
						f.transferTo(new File(path, saveFileName));
						p.setAttachment1(saveFileName);
					}
						else if (c == 1) {
							if(p.getAttachment2()!=null)
							session.getServletContext().getRealPath(p.getAttachment2());
							new File(path).delete();
							f.transferTo(new File(path, saveFileName));
							p.setAttachment2(saveFileName);

						} else if (c == 2) {
							if(p.getAttachment3()!=null)
							session.getServletContext().getRealPath(p.getAttachment3());
							new File(path).delete();
							f.transferTo(new File(path, saveFileName));
							p.setAttachment3(saveFileName);

						} else {
							if(p.getAttachment4()!=null)
							session.getServletContext().getRealPath(p.getAttachment4());
							new File(path).delete();
							f.transferTo(new File(path, saveFileName));
							p.setAttachment4(saveFileName);

						}
						c++;
					}
				

				catch (Exception e) {
					e.printStackTrace();
				}

				
			}
		}
			int result = productService.updateProduct(p);
			
			System.out.println(result);
			if (result > 0) {
				session.setAttribute("alertMsg", "성공적으로 상품정보가 수정되었습니다.");

			}
			
			return "redirect:/show.pro";
		}
		
	

	/**
	 * po 상품 등록 메소드 -성진
	 * 
	 * @return
	 */
	@RequestMapping("insert.pro")
	public ModelAndView insertProduct(Product p, MultipartHttpServletRequest request, HttpSession session,
			ModelAndView mv) throws Exception {

		List<MultipartFile> upfiles = request.getFiles("upfile"); // 파일name 담기
		String path = session.getServletContext().getRealPath("/resources/uploadFiles/"); // 실제 경로 알아내기

		System.out.println(upfiles);
		int c = 0;
		for (MultipartFile f : upfiles) {
			if (!f.getOriginalFilename().equals("")) {
				// System.out.println(f.getOriginalFilename());

				String originFileName = f.getOriginalFilename();// 원본 파일 명
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String saveFileName = String.format("%s%s", currentTime, ext);// 수정파일명 만들기

				try {
					// 파일생성 하기
					f.transferTo(new File(path, saveFileName));

					if (c == 0) {
						p.setAttachment1(saveFileName); // Product에 담아주기
					} else if (c == 1) {
						p.setAttachment2(saveFileName); // Product에 담아주기
					} else if (c == 2) {
						p.setAttachment3(saveFileName); // Product에 담아주기
					} else {
						p.setAttachment4(saveFileName); // Product에 담아주기
					}

				} catch (Exception e) {
					e.printStackTrace();
				}

				c++;
			}
		}
		int result = productService.insertProduct(p); // Service단으로 보내기

		if (result > 0) {
			session.setAttribute("alertMsg", "사진이 업로드 되었습니다.");
			mv.setViewName("redirect:/insertEnroll.pro");
		} else {

		}
		return mv;
	}
	
	/**
	 * po 상품 삭제 메소드
	 * 
	 * @return //
	 */@RequestMapping("delete.pro")
	public String deleteProduct(int productNo, HttpSession session, Model model) {
		 
		 int result = productService.deleteProduct(productNo);
			
			if(result > 0) { 
				session.setAttribute("alertMsg", "성공적으로 상품이 비공개처리되었습니다.");
				
			}else {
				session.setAttribute("alertMsg", "상품 비공개에 실패했습니다.");
			}
			return "redirect:/show.pro";
	 }
	 
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

}
