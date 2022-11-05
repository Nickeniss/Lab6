<%-- 
    Document   : Users
    Created on : 31-Oct-2022, 1:26:51 PM
    Author     : Nico
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

        <title>Users</title>
    </head>
    <body>

        <div  class="container">
            <div class="row">
                <div class="col">
                    <h1>Nick's User Management System</h1>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>E-mail</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Active</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}" >
                                <tr>
                                    <td>
                                        ${user.email}
                                    </td>

                                    <td>
                                        ${user.firstName} 
                                    </td>
                                    <td>
                                        ${user.lastName} 
                                    </td>
                                    <td>
                                        ${user.active ? "Y" : "N"} 
                                    </td>                   
                                    <td>
                                        <form action="users" method="post">
                                            <input type="hidden" name="action" value="delete">
                                            <button type="submit" class="btn btn-primary" id="email" name="email" value="${user.email}">Delete</button>
                                        </form>
                                        <form action="users" method="get">
                                            <button type="submit" class="btn btn-primary" id="email" name="email" value="${user.email}">Edit</button>
                                        </form>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <h2>Add user</h2>
                                <form action="users" method="post">
                                    <div class="mb-3">
                                        <input type="hidden" name="action" value="add">
                                        <label for="email" class="form-label">Email address</label>
                                        <input type="email" class="form-control" name="editEmail"  id="email" placeholder="name@example.com" required>
                                        <label for="firstName" class="form-label">First Name</label>
                                        <input type="text" class="form-control" name="firstName" id="firstName" placeholder="first name" required>
                                        <label for="lastName" class="form-label">Last Name</label>
                                        <input type="text" class="form-control" name="lastName" id="lastName" placeholder="last name" required>
                                        <label for="userPassword" class="form-label">Password</label>
                                        <input type="text" class="form-control" name="userPassword"  id="userPassword" required>
                                        <label class="input-group-text" for="roles">Roles</label>
                                        <select class="form-select" name="roles" id="roles">
                                            <option selected> Choose..</option>
                                            <c:forEach var="role" items="${roles}">
                                                <option value="${role.id}"> ${role.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div> 
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </form>
                            </div>
                            <div class="col">
                                <h2>Update User</h2>
                                <form action="users" method="post">
                                    <div class="mb-3">
                                        <label for="editEmail" class="form-label">Email address</label>
                                        <input type="email" class="form-control" name="editEmail" id="editEmail">
                                        <label for="editFirstName" class="form-label">First Name</label>
                                        <input type="text" class="form-control" name="editFirstName" id="editFirstName" placeholder="first name">
                                        <label for="editLastName" class="form-label">Last Name</label>
                                        <input type="text" class="form-control" name="editLastName"  id="editLastName" placeholder="last name">
                                        <label class="input-group-text" for="roles">Roles</label>
                                        <select class="form-select" name="roles" id="roles">
                                            <option selected> Choose..</option>
                                            <c:forEach var="role" items="${roles}">
                                                <option value="${role.id}"> ${role.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div> 
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
