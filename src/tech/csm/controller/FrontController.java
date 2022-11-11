package tech.csm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.query.internal.BindingTypeHelper;

import tech.csm.entity.BirthCertificate;
import tech.csm.entity.Role;
import tech.csm.entity.User1;
import tech.csm.service.UserServiceImpl;
import tech.csm.util.FileUploadUtil;
import tech.csm.util.HibernateUtil;

@WebServlet("/")
@MultipartConfig
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Session session;

	@Override
	public void init() throws ServletException {
		session = HibernateUtil.getSession();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		String endPoint = req.getServletPath();

		if (endPoint.equals("/getLoginForm")) {
			RequestDispatcher rd = req.getRequestDispatcher("userView/user_login.jsp");
			rd.forward(req, resp);

		} else if (endPoint.equals("/login")) {
			String userName = req.getParameter("username").trim();
			String password = req.getParameter("password").trim();

			Query<User1> seQueryUser = session.createQuery("from User1 where userId=?1 and password=?2");
			seQueryUser.setParameter(1, userName);
			seQueryUser.setParameter(2, password);
			User1 usr = seQueryUser.uniqueResult();
			if (usr != null) {
				if (usr.getStatus().equals("PEND")) {
					req.getSession().setAttribute("msg", "Your Accout is pending for approval");
					resp.sendRedirect("./getLoginForm");
				} else {
					req.getSession().setAttribute("loggedInUser", usr);					
					resp.sendRedirect("./successLogin");
				}
			} else {
				req.getSession().setAttribute("msg", "invalid username/passord");
				resp.sendRedirect("./getLoginForm");
			}
		} else if (endPoint.equals("/successLogin")) {

			System.out.println("in successlogin" + (User1) req.getSession(false).getAttribute("loggedInUser"));
			req.getRequestDispatcher("userView/layout.jsp").forward(req, resp);
			;
		} else if (endPoint.equals("/createUser")) {

			Query<Role> seQueryRole = session.createQuery("from Role");
			req.setAttribute("roleList", seQueryRole.list());
			RequestDispatcher rd = req.getRequestDispatcher("userView/createUser.jsp");
			rd.forward(req, resp);

		} else if (endPoint.equals("/saveUser")) {
			if (req.getSession().getAttribute("loggedInUser") != null) {
				User1 user = new User1();
				user.setUserId(req.getParameter("userid").trim());
				user.setUserName(req.getParameter("username").trim());
				user.setPassword(req.getParameter("password"));
				user.setEmail(req.getParameter("email"));
				user.setPhoneNo(req.getParameter("phoneno"));
				user.setAadharNo(req.getParameter("aadharno"));
				user.setAadharIdPath(FileUploadUtil.getFilePath(req.getPart("aadharfile")));
				user.setRole(session.get(Role.class, Integer.parseInt(req.getParameter("role"))));
				user.setCreatedOn(new Date());
				user.setOtp(null);
				user.setUpdatedOn(null);
				user.setCreatedBy((User1) req.getSession(false).getAttribute("loggedInUser"));
				user.setIsActive("YES");
				user.setStatus("APPR");

				String uId = new UserServiceImpl().saveUser(user);
				if (uId != null) {
					req.getSession(false).setAttribute("msg", "User Creted Successfully with id : " + uId);
				} else
					req.getSession(false).setAttribute("msg", "User Not Created");
				resp.sendRedirect("./createUser");
			} else {
				User1 user = new User1();
				user.setUserId(req.getParameter("userid").trim());
				user.setUserName(req.getParameter("username").trim());
				user.setPassword(req.getParameter("password"));
				user.setEmail(req.getParameter("email"));
				user.setPhoneNo(req.getParameter("phoneno"));
				user.setAadharNo(req.getParameter("aadharno"));
				user.setAadharIdPath(FileUploadUtil.getFilePath(req.getPart("aadharfile")));
				user.setRole(session.get(Role.class, Integer.parseInt(req.getParameter("role"))));
				user.setCreatedOn(new Date());
				user.setOtp(null);
				user.setUpdatedOn(null);
				user.setCreatedBy(null);
				user.setIsActive("YES");
				user.setStatus("PEND");
				String uId = new UserServiceImpl().saveUser(user);
				if (uId != null)
					pw.println("User Creted Successfully with id : " + uId + " but, pending for approval");

			}

		} else if (endPoint.equals("/logOut")) {
			req.getSession(false).removeAttribute("loggedInUser");
			req.getSession(false).invalidate();
			resp.sendRedirect("./getLoginForm");

		}else if(endPoint.equals("/approveUser")) {
			
			Query<User1> seQueryUp=session.createQuery("from User1 where status='PEND'");
			req.setAttribute("uaUserList", seQueryUp.list());
			req.getRequestDispatcher("userView/ua_user_list.jsp").forward(req, resp);
			
		}else if(endPoint.equals("/approve")) {
			
			User1 usr=session.get(User1.class, req.getParameter("uId").trim());
			usr.setStatus("APPR");
			Transaction tx = session.beginTransaction();
			session.update(usr);
			tx.commit();
			
			resp.sendRedirect("./approveUser");
			
			
		}else if(endPoint.equals("/getbirthcertificateform")) {
			
			Query<BirthCertificate> seQueryBirth=session.createQuery("from BirthCertificate where appliedBy.userId=?1");
			seQueryBirth.setParameter(1, ((User1)req.getSession(false).getAttribute("loggedInUser")).getUserId());
			req.setAttribute("appList",seQueryBirth.list());
			req.getRequestDispatcher("userView/get_birth_certificate_form.jsp").forward(req, resp);
			
		}else if(endPoint.equals("/applyBirthCertificate")) {
			BirthCertificate bc=new BirthCertificate();
			bc.setChildName(req.getParameter("childname"));		
			try {
				bc.setChildDob(new SimpleDateFormat("dd/MM/yyyy hh:mm a").parse(req.getParameter("dob")));
			} catch (ParseException e) {				
				e.printStackTrace();
			}
			bc.setBloodGroup(req.getParameter("bloodgroup"));
			bc.setChildWeight(Double.parseDouble(req.getParameter("weight")));
			bc.setChildGender(req.getParameter("gender"));
			bc.setHospitaName(req.getParameter("hospitalname"));
			bc.setHospitalDoc(FileUploadUtil.getFilePath(req.getPart("hospitaldocfile")));
			bc.setFatherName(req.getParameter("fathername"));
			bc.setMotherName(req.getParameter("mothername"));
			bc.setAddress(req.getParameter("address"));
			bc.setAddressProfDoc(FileUploadUtil.getFilePath(req.getPart("addressproof")));
			bc.setAppliedOn(new Date());
			bc.setAppliedBy((User1)req.getSession(false).getAttribute("loggedInUser"));
			bc.setApprovedBy(null);
			bc.setApprovedOn(null);
			bc.setAppStatus("PEND");
			Integer cId;
			Transaction tx = session.beginTransaction();
			cId=(int)session.save(bc);
			tx.commit();
			
			req.getSession().setAttribute("msg", "Your application id : "+cId+" applied successfully but pending for approval");
			resp.sendRedirect("./applyBirthCertificate");
			
		}else if(endPoint.equals("/approveBirthCertificate")) {
			Query<BirthCertificate> seQueryBirth=session.createQuery("from BirthCertificate where appStatus='PEND'");
			req.setAttribute("pendAppList",seQueryBirth.list());
			req.getRequestDispatcher("userView/approve_certificate.jsp").forward(req, resp);
			
			
		}else if(endPoint.equals("/approveCertificate")) {
			BirthCertificate seQueryBirth=session.get(BirthCertificate.class,Integer.parseInt(req.getParameter("cId")));
			seQueryBirth.setAppStatus("APPR");
			seQueryBirth.setApprovedBy((User1)req.getSession(false).getAttribute("loggedInUser"));
			seQueryBirth.setApprovedOn(new java.util.Date());
			Transaction tx1 = session.beginTransaction();
			session.update(seQueryBirth);
			tx1.commit();
			req.getRequestDispatcher("/approveBirthCertificate").forward(req, resp);
			
			
		}else if(endPoint.equals("/getCertificate")) {
			Integer cId=Integer.parseInt(req.getParameter("cId"));
			req.setAttribute("certificate", session.get(BirthCertificate.class, cId));
			req.getRequestDispatcher("userView/certificate.jsp").forward(req, resp);
			
			
		}
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
