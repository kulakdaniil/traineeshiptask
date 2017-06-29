<%--
  Created by IntelliJ IDEA.
  User: danfox
  Date: 26.06.17
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Traineeshiptask: информация о пользователе</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .container-fluid.wrapper {
            margin: 20px 0;
        }
        body {
            background-color: #f5f5f5;
        }
        .upbutton {
            margin-bottom: 3px;
            width: 120px;
            font-weight: bold;
            background-color: #d3d3d3;
            color: black;
        }
        h3 {
            margin: 0;
            padding: 0;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container-fluid wrapper">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 text-center"><h3>Traineeshiptask: информация о пользователе</h3></div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">&nbsp;</div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">&nbsp;</div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">&nbsp;</div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form:form  id="UserRegisterForm" cssClass="form-horizontal" modelAttribute="user" method="post" action="saveUser">
                    <div class="form-group">
                        <form:label path="name" >Имя:</form:label>
                        <form:hidden path="id" value="${user.id}"/>
                        <form:input cssClass="form-control" path="name" value="${user.name}" maxlength="25"/>
                    </div>
                    <div class="form-group">
                        <form:label path="age">Возраст:</form:label>
                        <form:input cssClass="form-control" path="age" value="${user.age}" type="number" min="0" step="1"/>
                    </div>
                    <div class="form-group">
                        <form:label path="isAdmin">Права администратора:</form:label>
                        <form:input cssClass="form-control" path="isAdmin" value="${user.isAdmin}"/>
                    </div>
                    <div class="form-group text-center">
                        &nbsp;<br>
                        <input type="submit" id="saveUser" class="btn btn-sm upbutton" value="Сохранить" onclick="return submitUserData();"/>
                        <button class="btn btn-sm upbutton" onclick="location.href='/'" type="button">Отмена</button>
                    </div>
                </form:form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        function submitUserData() {
            var name = $('#name').val().trim();
            var age = $('#age').val();
            var isAdmin = $('#isAdmin').val();
            if(name.length ==0 || name.length > 25) {
                alert("Введите корректное имя (от 1 до 25 символов )");
                $('#name').focus();
                return false;
            }

            if (age < 0 || age > 100) {
                alert("Введите корректный возраст (не более 100 лет)");
                $('#age').focus();
                return false;
            }

            if(isAdmin != "true" && isAdmin != "false") {
                alert("Введите \"true\" или \"false\" в поле \"Права администратора\"");
                $('#isAdmin').focus();
                return false;
            }
            return true;
        };
    </script>
</body>
</html>