<%@ page import="com.Dao.PromoDao" %>
<%@ page import="com.model.Stock" %>
<%@ page import="com.model.Promotion" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 31/10/2022
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Promotion</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        .table td, .table th {
            padding: 1rem !important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="iconmarjan.png"> <span><strong> M</strong>arjan<strong>P</strong>romo</span></a>
        <button class="btn btn-dark" type="submit">Déconnecter</button>
    </div>
</nav>
<div class="table-responsive mt-3">
    <table class="table table-bordered text-center bg-white mx-auto w-auto">
        <thead>
        <tr>
            <th>Catégorie</th>
            <th>Produit</th>
            <th>promotion</th>
            <th>Application</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tbody>
        <%
            PromoDao promoDao=new PromoDao();
            List<Stock> stocks = promoDao.getAllStockPromo();
            for(Stock stock: stocks){
                for(Promotion promotion: stock.getPromotionsByIdStock()){
        %>

        <tr>
            <td><%=stock.getCategorie()%></td>
            <td><%=stock.getProduit()%></td>
            <td><%=promotion.getPromo()%></td>
            <td><!-- Button trigger modal -->
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Vérification
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Vérification</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                la Quantité de produit : <%=stock.getProduit()%> est <%=stock.getQuantites()%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div></td>
            <td>
                <button type="button" class="btn" data-toggle="modal" data-target="#delexampleModal<%=promotion.getIdPromo()%>">
                    <img src="delete.png">
                </button>
                <button type="button" class="btn" data-toggle="modal" data-target="#upexampleModal<%=promotion.getIdPromo()%>">
                    <img src="editing.png">
                </button>
        </tbody>
        <%
            }
        %>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
