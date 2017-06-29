<%--
  Created by IntelliJ IDEA.
  User: danfox
  Date: 26.06.17
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Traineeshiptask: список пользователей</title>
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
        th {
            background-color: #006666;
            color: white;
        }
        td {
            background-color: #fff;
            font-weight: bold;
        }
        .table-striped>tbody>tr:nth-child(odd)>td {
            background-color: #d3d3d3;
        }
        .table-hover tbody tr:hover td {
            background: #bebebe;
        }
        a:link {
            color: #663366;
            font-weight: bold;
        }
        a:visited {
            color: #663366;
        }
        td a:link {
            text-decoration: underline;
        }
        td a:hover {
            color: #fff;
            text-decoration: none;
        }
        body {
            background-color: #f5f5f5;
        }
        .bottom-link {
            text-align: center;
            font-size: 16px;
        }
        .upbutton {
            margin-bottom: 3px;
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
        <c:if test="${empty userList}">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8 text-center">
                    <c:choose>
                        <c:when test="${fn:contains(pageContext.request.queryString, 'searchName')}">
                            <h3>Traineeshiptask: по вашему запросу ничего не найдено</h3><br><br>
                            <button class="btn btn-sm upbutton" onclick="location.href='/'" type="button">Вернуться на главную</button>
                        </c:when>
                        <c:otherwise>
                            <h3>Traineeshiptask: в таблице User нет пользователей</h3><br><br>
                            <button class="btn btn-sm upbutton" onclick="location.href='/createUser'" type="button">Создать пользователя</button>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="col-md-2"></div>
            </div>
        </c:if>
        <c:if test="${not empty userList}">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8 text-center"><h3>Traineeshiptask: список пользователей</h3></div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">&nbsp;</div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4">
                    <button class="btn btn-sm upbutton" onclick="location.href='/'" type="button">На главную</button>
                    <button class="btn btn-sm upbutton" onclick="location.href='/createUser'" type="button">Создать пользователя</button>
                </div>
                <div class="col-md-4 text-right">
                    <form action="searchUser">
                        <input type="text" name="searchName" id="searchName" placeholder="&nbsp;Введите имя...">
                        <input class="btn btn-sm upbutton" type='submit' value='Поиск'/>
                    </form>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">&nbsp;</div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <table class="table table-striped table-hover table-condensed table-responsive">
                        <tr>
                            <th>Id</th>
                            <th>Имя</th>
                            <th>Возраст</th>
                            <th>Админ</th>
                            <th>Дата создания</th>
                            <th>Править</th>
                            <th>Удалить</th>
                        </tr>
                        <c:forEach items="${userList}" var="user">
                        <tr>
                            <td><c:out value="${user.id}"/></td>
                            <td><c:out value="${user.name}"/></td>
                            <td><c:out value="${user.age}"/></td>
                            <td><c:out value="${user.isAdmin}"/></td>
                            <td><c:out value="${user.createdDate}"/></td>
                            <td><a href="editUser?id=<c:out value='${user.id}'/>">Править</a></td>
                            <td><a href="deleteUser?id=<c:out value='${user.id}'/>">Удалить</a></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8 bottom-link">
                    <c:url value="/" var="prev">
                        <c:param name="page" value="${page-1}"/>
                    </c:url>
                    <c:if test="${page > 1}">
                        <a href="<c:out value="${prev}" />">&lt;&lt;</a>
                    </c:if>
                    <c:forEach begin="1" end="${maxPage}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${page == i.index}">
                                <span>${i.index}</span>
                            </c:when>
                            <c:otherwise>
                                <c:url value="/" var="url">
                                    <c:param name="page" value="${i.index}"/>
                                </c:url>
                                <a href='<c:out value="${url}" />'>${i.index}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:url value="/" var="next">
                        <c:param name="page" value="${page + 1}"/>
                    </c:url>
                    <c:if test="${page + 1 <= maxPage}">
                        <a href='<c:out value="${next}" />'>&gt;&gt;</a>
                    </c:if>
                </div>
                <div class="col-md-2"></div>
            </div>
        </c:if>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</body>
</html>