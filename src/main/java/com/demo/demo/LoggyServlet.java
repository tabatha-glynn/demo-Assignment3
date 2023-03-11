package com.demo.demo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "LoggyServlet", value = "")
public class LoggyServlet extends HttpServlet {
    public Log log;
    public List<Log> logs = new ArrayList<Log>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("message", "");
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("/loggy.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Log log = new Log(UUID.randomUUID(),title, content, LocalDateTime.now());
        logs.add(0, log);

        String message;
        if(log != null) {
            message = "You successfully created a log.";
        } else {
            message = "Log creation failed.";
        }
        request.setAttribute("message", message);
        request.setAttribute("logs", logs);

        request.getRequestDispatcher("/loggy.jsp").forward(request, response);
    }
}
