package utils;

import java.util.List;

import javax.mail.Authenticator;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import constans.GlobalConstants;
import models.Item;

public class SendMail {
	
	public static String emailContentOrder(List<Item> list, String fullname,int phone) {
		int tongGia = 0;
		String content = "";
		content += "<p>Đơn hàng của tài khoản " + fullname + ",</p>";
		content += "<p>Đặt hàng online Coffee <span style='color: #BB0000; font-weight: bold'>KING COFFEE</span>.</p>";
		content += "<p>Chi tiết đơn hàng:</p>";
		content += "<table width='800px'>";
		content += "<tr><th width='5%'>#</th><th>TÊN SẢN PHẨM</th><th>ĐƠN GIÁ</th><th>SỐ LƯỢNG</th><th>THÀNH TIỀN</th></tr>";
		if (list.size() > 0) {
			int stt = 1;
			for (Item objitems : list) {
				long giaBan = objitems.getPrice();
				long thanhTien = giaBan * objitems.getQuantity();
				tongGia += thanhTien;
				content += "<tr><td align='center'>" + stt++ + "</td><td align='center'>" +objitems.getProduct().getMenu().getName()
						+ "</td><td align='center'>" + giaBan + " VNĐ</td><td align='center'>" +objitems.getQuantity()
						+ "</td><td align='center'>" + thanhTien + " VNĐ</td></tr>";
			}
		}
		content += "</table>";
		content += "<p><span style='font-weight: bold'>TỔNG GIÁ: </span><span style='font-weight: bold; color: #BB0000'>"
				+ tongGia + " VNĐ</span></p>";
		content += "<p>Một đơn hàng mới vừa đặt.</p>";
		content += "<p>Vui lòng làm ngay cho khách. Khách hàng là thượng đế</p>";
		content += "<p>Số điện thoại khách hàng: " + phone + "</p>";
		return content;
	}
	
	public static void send(String catOrderName,int phone, final String fullname, final String email, String address,String content) {
		java.util.Properties props = new java.util.Properties();

		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

//		String pass = "@admin1805";
//		String emailAdmin = "leducnamit1805@gmail.com";
		javax.mail.Session session = javax.mail.Session.getInstance(props, new Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(email, GlobalConstants.PASS_ADMIN);
			}
		});
		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(GlobalConstants.EMAIL_ADMIN));
			message.setSubject(catOrderName,"UTF-8");
			message.setContent(content, "text/html; charset=UTF-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
