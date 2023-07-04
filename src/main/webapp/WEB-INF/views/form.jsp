<%@page language="java" pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml" xmlns:c="http://www.w3.org/1999/XSL/Transform">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
              crossorigin="anonymous">
        <title>Forms</title>
    </head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous"></script>
        <script src="<c:url value="/resources/js/form.js" /> "></script>
        
        <!-- As a heading -->
        <nav class="navbar navbar-light bg-light">
            <span class="navbar-brand mb-0 h1" style="padding-left:16px;">Note App</span>
        </nav>
        
        <div style="display:flex;flex-direction:column;align-items:center;padding-top:72px;background-color:#c09ede;height:100%">
            <div class="card" style="width:30rem;">
                <form:form method="post" action="/CgiWebApp/addNote"
                           style="display:flex;flex-direction:column;gap:16px;padding:16px" modelattribute="note">
                    <label style="align-self:center">Add Note to DataBase</label>
                    <div class="form-group">
                        <label for="inputTitle">Title</label>
                        <form:input type="text" class="form-control" id="inputTitle"
                                    placeholder="Enter Note title" path="title" oninput="onChange()"/>
                    </div>
                    <div class="form-group">
                        <label for="inputDescription">Description</label>
                        <form:textarea rows="5" aria-multiline="true" class="form-control" id="inputDescription"
                                       placeholder="Enter note description" path="description" oninput="onChange()"/>
                    </div>
                    <label style="visibility:hidden;align-self:center;color:red;" id="customError">One or more fields
                        are Empty</label>
                    <button type="submit" class="btn btn-success" style="align-self:center" value="Add" id="submitBtn"
                            disabled>Add
                    </button>
                </form:form>
            </div>
        </div>
    </body>
</html>