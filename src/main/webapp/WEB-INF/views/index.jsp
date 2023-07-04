<%@page language="java" pageEncoding="ISO-8859-1" contentType="text/html; ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns:c="http://www.w3.org/1999/XSL/Transform" xmlns:form="http://www.w3.org/1999/xhtml">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
              crossorigin="anonymous">
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous"></script>
        <script src="<c:url value="/resources/js/delete.js" /> "></script>
        <nav class="navbar navbar-light bg-light" style="display:flex;flex-direction:row;align-content:space-between;">
            <span class="navbar-brand mb-0 h1" style="padding-left:16px;">Note App</span>
            <a href="form" style="margin-right:16px;" class="btn btn-primary">Add Note</a>
        </nav>
        <div style="display:grid;grid-template-columns: repeat(3, minmax(100px, 1fr));
  grid-gap: 0.5rem;padding-top:32px;padding-left:32px">
            <c:forEach var="note" items="${notes}">
                <div class="card mb-3" style="width: 30rem;">
                    <div class="card-body">
                        <h5 class="card-title">${note.title}</h5>
                        <p class="card-text">${note.description}</p>
                        <div style="display:flex;flex-direction:column;">
                            <form:form method="post" action="/CgiWebApp/deleteNote" modelattribute="delete">
                                <form:input type="hidden" value="${note.id}" path="id"/>
                                <form:input type="hidden" value="${note.title}" path="title"/>
                                <form:input type="hidden" value="${note.description}" path="description"/>
                                <input type="submit" style="visibility:hidden" id="${note.id}"/>
                            </form:form>
                            <button class="btn btn-danger" style="align-self:flex-end"
                                    onclick="onDelete('${note.id}','${note.title}')">Delete
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Are you sure?</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="confirmMessage">
                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" onclick="onConfirmDelete()">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
