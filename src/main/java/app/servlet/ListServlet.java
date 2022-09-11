package app.servlet;

import app.model.Model;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListServlet extends HttpServlet {
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        System.out.println("initListUsers");
    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }





    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("listDoGEt");
        Model model = Model.getInstance();
        req.setAttribute("userList",model.list());
        model.list().stream().forEach(System.out::println);

        RequestDispatcher dispatcher = req.getRequestDispatcher("view/list.jsp");
        ((List<String>) req.getAttribute("userList")).stream().forEach(System.out::println);

        dispatcher.forward(req,resp);


    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {
        System.out.println("destroyListServlet");
    }
}
