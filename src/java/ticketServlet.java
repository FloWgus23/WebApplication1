import controller.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;
import model.Person;

/**
 * Servlet implementation class ticketServlet
 */
@WebServlet(urlPatterns = {"/ticketServlet"})
public class ticketServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Person person = (Person) session.getAttribute("person");

            if (person == null) {
                // Create new Person and set values
                person = new Person();
                person.setTicketName(request.getParameter("ticketname"));
                person.setTicketType(request.getParameter("tickettype"));
                person.setSingers(request.getParameterValues("singer"));
                person.setQuantity(request.getParameter("quantityname"));
                person.setPrice(request.getParameter("pricename"));
                
                // Save the Person object in session
                session.setAttribute("person", person);
                // Redirect to addticket.jsp after saving
                response.sendRedirect("addticket.jsp");
                
                // insert into MySQL: table food
               DBConnection dbConnection = new DBConnection();
               if(!dbConnection.insertNewPerson(person)){
                   System.out.println(">>> AddNewFoodMySQL ERROR");
        }
            } else {
                // Display existing person data
                out.println("<html><body>");
                out.println("<b>ข้อมูลเดิม:</b> " + person.getTicketName() + ", "
                        + person.getTicketType() + ", "
                        + Arrays.toString(person.getSingers()) + ", "
                        + person.getQuantity() + ", "
                        + person.getPrice());
                out.println("<br/><br/><br/>");
                out.println("</body></html>");

                // Form for editing existing data
                request.setAttribute("person", person); // Pass person to JSP
                request.getRequestDispatcher("/addticket.jsp").forward(request, response);
                // Do not remove person from session here; it should be handled as needed
            }
        } catch (ServletException | IOException | NullPointerException e) {
            out.print("เกิดข้อผิดพลาด: " + e.getMessage());
        }
    }

        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
