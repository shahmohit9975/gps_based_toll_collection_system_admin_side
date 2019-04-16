package bean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class toll_collector_logout_servlet
 */
public class toll_collector_logout_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public toll_collector_logout_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		
		session.removeAttribute("vehicle_unique_id_matched");
		session.removeAttribute("vehicle_unique_id_not_matched");
		session.removeAttribute("toll_collector");
		session.invalidate();
		
	//	System.out.println("\nvehicle_unique_id_matched : "+session.getAttribute("vehicle_unique_id_matched")+"\nvehicle_unique_id_not_matched : "+session.getAttribute("vehicle_unique_id_not_matched")+"\ntoll_collector : "+session.getAttribute("toll_collector"));

		
		response.sendRedirect("toll_logout.jsp");
		
		
	}

}
