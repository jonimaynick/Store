

<%@page import="phu.DTO.UserDTO"%>
<%@page import="phu.DAO.BookDAO"%>
<%@page import="phu.DTO.BookDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="2.css" rel="stylesheet" type="text/css"/>
        <link href="header.css" rel="stylesheet" type="text/css"/>
        <script src="main.js"></script>
        <title>Piki - Mua sách online</title>   
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="mainMenu">
                    <ul class="menu">
                        <a href="home.jsp" >
                            <img id="logo" src="data:image/png;base64,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"
                                 width="80" height="80" />                                
                        </a>
                        <li>
                            <form action="MainController" method="POST">
                                <input type="submit" name="action" value="Home"/>
                            </form>
                        </li>
                        <li>
                            <form action="MainController" method="POST">
                                <a href="aboutUs.jsp"  style="text-decoration: none; color: white; font-weight: bold; font-size: 23px;">About Us</a>
                            </form>
                        </li>
                        <%
                            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (user == null || user.getRoleName().equals("USER")) {
                        %>
                        <li>

                            <form action="MainController" method="POST">
                                <a href="cart.jsp"  style="text-decoration: none; color: white; font-weight: bold; font-size: 23px;">Cart</a>
                            </form>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                    <div class="user">
                        <ul class="menu-user">

                            <%
                                if (user == null) {
                            %>
                            <li>
                                <a>Guest</a>
                            </li>
                            <li>
                                <form action="MainController" method="POST">
                                    <input type="submit" name="action" value="Login"/>
                                </form>
                            </li>
                            <%
                            } else {
                                if (user.getRoleName().equals("ADMIN")) {
                            %>
                            <li>
                                <a href="admin.jsp" style="text-decoration: none">Book Manager</a> 
                            </li>
                            <%
                                }
                            %>
                            <li>
                                <a><%=user.getUserName()%></a>
                            </li>
                            <li>
                                <a href="history.jsp" style="text-decoration: none;">History</a>
                            </li>
                            <li>
                                <form action="MainController" method="POST">                                    
                                    <input type="submit" name="action" value="Logout"/>
                                </form>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="headerLine"></div>
            <div class="mainPage">
                <div id="search" style="text-align: center; margin: 10px;">
                    <form action="MainController" method="GET">
                        <input type="text" name="search" value=""/>
                        <input type="submit" name="action" value="Search"/>
                    </form>    
                </div>
                <%
                    List<BookDTO> bookList = (List<BookDTO>) request.getAttribute("ListSearch");
                    BookDAO daoBook = new BookDAO();
                    if (bookList == null) {
                        bookList = daoBook.searchBooks("");
                    }
                    int stack = 0;
                    for (BookDTO book : bookList) {
                        if (stack == 0) {
                %>
                <div class="product-line">
                    <%
                        }
                    %>
                    <div class="product">
                        <img src="<%=book.getImage()%>" width="210" height="260"/><br>
                        <a class="titleBook" ><%=book.getTitle()%></a>
                        <form action="MainController" method="GET">
                            <input type="submit" name="action" value="View Product"/>
                            <input type="hidden" name="BOOKID" value="<%=book.getBookID()%>"/>
                        </form>
                    </div>
                    <%
                        stack++;
                        if (stack == 4) {
                    %>
                </div>
                <%
                            stack = 0;
                        }
                    }
                %>
            </div>
            <div class="end">
            </div>
        </div>
    </body>
</html>
