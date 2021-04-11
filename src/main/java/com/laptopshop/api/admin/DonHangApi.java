package com.laptopshop.api.admin;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptopshop.dto.SearchDonHangObject;
import com.laptopshop.entities.ChiMucGioHang;
import com.laptopshop.entities.ChiTietDonHang;
import com.laptopshop.entities.DonHang;
import com.laptopshop.entities.GioHang;
import com.laptopshop.entities.NguoiDung;
import com.laptopshop.entities.ResponseObject;
import com.laptopshop.entities.SanPham;
import com.laptopshop.service.ChiMucGioHangService;
import com.laptopshop.service.ChiTietDonHangService;
import com.laptopshop.service.DonHangService;
import com.laptopshop.service.GioHangService;
import com.laptopshop.service.SanPhamService;

@RestController
@RequestMapping("/api/don-hang")
public class DonHangApi {

	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private DonHangService donHangService;
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private ChiMucGioHangService chiMucGioHangService;
	@Autowired
	private ChiTietDonHangService chiTietDonHangService;
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}

	@GetMapping("/addOrder")
	public ResponseObject sendOrder(@RequestParam String id,HttpServletRequest request,HttpServletResponse response) {
		ResponseObject ro = new ResponseObject();
		DonHang donhang = new DonHang();
				//donHangService.findById(Long.parseLong(id));
		donhang.setNgayDatHang(new Date());
		donhang.setTrangThaiDonHang("Đang chờ giao");
		NguoiDung currentUser = getSessionUser(request);
		donhang.setDiaChiNhan(currentUser.getDiaChi());
		donhang.setHoTenNguoiNhan(currentUser.getHoTen());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Map<Long,String> quanity = new HashMap<Long,String>();
		List<SanPham> listsp = new ArrayList<SanPham>();
		List<ChiTietDonHang> listDetailDH = new ArrayList<ChiTietDonHang>();
	
		if(auth == null || auth.getPrincipal() == "anonymousUser")     //Lay tu cookie
		{
			DonHang d = donHangService.save(donhang);
			Cookie cl[] = request.getCookies();		
			Set<Long> idList = new HashSet<Long>();
			for(int i=0; i< cl.length; i++)
			{
				if(cl[i].getName().matches("[0-9]+"))
				{
					idList.add(Long.parseLong(cl[i].getName()));					
					quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());  
				}	
			}
			listsp = sanPhamService.getAllSanPhamByList(idList);
			for(SanPham sp: listsp)
			{
				ChiTietDonHang detailDH = new ChiTietDonHang();
				detailDH.setSanPham(sp);
				detailDH.setSoLuongDat(Integer.parseInt(quanity.get(sp.getId())));
				detailDH.setDonGia(Integer.parseInt(quanity.get(sp.getId()))*sp.getDonGia());
				detailDH.setDonHang(d);
				listDetailDH.add(detailDH);
			}
		}else     //Lay tu database
		{
			
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			donhang.setTongGiaTri(Long.parseLong(g.getTong_tien()));
			donhang.setNguoiDat(currentUser);
			DonHang d = donHangService.save(donhang);
			List<ChiMucGioHang> listchimuc = chiMucGioHangService.getChiMucGioHangByGioHang(g);
			for(ChiMucGioHang c: listchimuc)
			{			
				ChiTietDonHang detailDH = new ChiTietDonHang();
				detailDH.setSanPham(c.getSanPham());
				detailDH.setDonGia(c.getSo_luong()*c.getSanPham().getDonGia());	
				detailDH.setSoLuongDat(c.getSo_luong());
				detailDH.setDonHang(d);
				listDetailDH.add(detailDH);		
				
				//listsp.add(c.getSanPham());
				//quanity.put(c.getSanPham().getId(), Integer.toString(c.getSo_luong()));
			}
//			ChiMucGioHangService ctdh= chiTietDonHangService.save(listDetailDH);
			
		}					
			
		
		
		ro.setStatus("success");
		return ro;
	}
	// lấy danh sách đơn hàng theo search object
	@GetMapping("/all")
	public Page<DonHang> getDonHangByFilter(@RequestParam(defaultValue = "1") int page, @RequestParam String trangThai,
			@RequestParam String tuNgay, @RequestParam String denNgay) throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon(trangThai);
		object.setTuNgay(tuNgay);
		Page<DonHang> listDonHang = donHangService.getAllDonHangByFilter(object, page);
		return listDonHang;
	}

	@GetMapping("/{id}")
	public DonHang getDonHangById(@PathVariable long id) {
		return donHangService.findById(id);
	}


	// xác nhận hoàn thành đơn hàng
	@PostMapping("/update")
	public void xacNhanHoanThanhDon(@RequestParam("donHangId") long donHangId,
			@RequestParam("ghiChu") String ghiChuAdmin) {
		DonHang dh = donHangService.findById(donHangId);
		
		for(ChiTietDonHang ct : dh.getDanhSachChiTiet()) {
			SanPham sp = ct.getSanPham();
			sp.setDonViBan(sp.getDonViBan() + ct.getSoLuongNhanHang());
			sp.setDonViKho(sp.getDonViKho() - ct.getSoLuongNhanHang() );
		}
		dh.setTrangThaiDonHang("Hoàn thành");
		String ghiChu = dh.getGhiChu();
		if (!ghiChuAdmin.equals("")) {
			ghiChu += "<br> Ghi chú admin:\n" + ghiChuAdmin;
		}
		dh.setGhiChu(ghiChu);
		donHangService.save(dh);
	}

	// xác nhận hoàn thành đơn hàng
	@PostMapping("/cancel")
	public void huyDonHangAdmin(@RequestParam("donHangId") long donHangId) {
		DonHang dh = donHangService.findById(donHangId);
		dh.setTrangThaiDonHang("Đã bị hủy");
		donHangService.save(dh);
	}

	// lấy dữ liệu làm báo cáo thống kê
	@GetMapping("/report")
	public List<Object> test() {
		return donHangService.layDonHangTheoThangVaNam();
	}
}
