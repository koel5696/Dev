package ch11;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/guestbook", "/guestbook/newguest"})
public class GuestbookController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String START_PAGE = "/ch11/guestbook.jsp";
    private final String EDIT_PAGE = "/ch11/editguest.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 데이터 초기화
        initializeData(request);
        
        response.setCharacterEncoding("UTF-8");

        List<GuestbookEntry> guestbookEntries = getAllGuestbookEntries();

        request.setAttribute("guestbookList", guestbookEntries);

        request.getRequestDispatcher(START_PAGE).forward(request, response);
    }

    private void initializeData(HttpServletRequest request) {
        // 세션 초기화
        HttpSession session = request.getSession();
        session.removeAttribute("userEntries");
    }

    private List<GuestbookEntry> getAllGuestbookEntries() {
        GuestbookDAO dao = new GuestbookDAO();
        return dao.getAllGuestbookEntries();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        if (requestURI.endsWith("/newguest")) {
        	 response.setCharacterEncoding("UTF-8");
            GuestbookEntry entry = createGuestbookEntry(request);

            saveGuestbookEntry(entry);

            response.sendRedirect(request.getContextPath() + "/guestbook");
        } else {
            doGet(request, response);
        }
    }

    private GuestbookEntry createGuestbookEntry(HttpServletRequest request) {
        GuestbookEntry entry = new GuestbookEntry();
        entry.setAuthor(request.getParameter("author"));
        entry.setEmail(request.getParameter("email"));
        entry.setTitle(request.getParameter("title"));
        entry.setContent(request.getParameter("content"));

        // Date 변환
        String dateString = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        try {
            java.sql.Date date = java.sql.Date.valueOf(dateString);
            entry.setDate(date);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }

        return entry;
    }

    private void saveGuestbookEntry(GuestbookEntry entry) {
        GuestbookDAO dao = new GuestbookDAO();
        dao.addGuestbookEntry(entry);
    }
}
