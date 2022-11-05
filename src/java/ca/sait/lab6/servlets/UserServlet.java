/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ca.sait.lab6.servlets;

import ca.sait.lab6.models.Role;
import ca.sait.lab6.models.User;
import ca.sait.lab6.services.RoleService;
import ca.sait.lab6.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nico
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();
        RoleService roleService = new RoleService();

        try {
            String action = request.getParameter("action");
            if (action != null){
               String email = request.getParameter("email");
               User user = service.get(email);
               request.setAttribute("editEmail", email);
            }
            List<User> users = service.getAll();
            List<Role> roles = roleService.getAll();
            request.setAttribute("users", users);
            request.setAttribute("roles", roles);
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoleService roleService = new RoleService();
        UserService service = new UserService();
        String action = request.getParameter("action");

        try {

            if (action.equals("delete")) {
                String email = request.getParameter("email");
                service.delete(email);
                
            } else if (action.equals("add")) {
                String email = request.getParameter("email");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String password = request.getParameter("userPassword");
                String roleIndex = request.getParameter("roles");
                List<Role> roles = roleService.getAll();
                Role role = roles.get(Integer.parseInt(roleIndex) - 1);
                service.insert(email, true, firstName, lastName, password, role);

            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("users");
    }

}
