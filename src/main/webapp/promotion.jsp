<%@ page import="com.Dao.AdmincDao" %>
<%@ page import="com.model.Stock" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Dao.PromoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.Promotion" %>
<%@ page import="java.util.stream.Stream" %><%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 30/10/2022
  Time: 12:51
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
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav mx-auto" style="font-weight: bold">
        <li class="nav-item">
          <a class="nav-link text-dark" aria-current="page" href="Adminc.jsp">Stock</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" href="#">Promotion</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" href="addpesp.jsp">Resposables</a>
        </li>
      </ul>
    </div>
    <button class="btn btn-dark" type="submit">Déconnecter</button>
  </div>
</nav>
<%--button--%>
<div class="row" style="margin-right:0!important;margin-left: 0 !important;">
  <div class="col text-center">
    <button type="button" class="btn btn-dark mb-4 mt-4" data-toggle="modal" data-target="#addexampleModal">
      Ajouter Une Promotion
    </button>
  </div>
  <div class="modal fade" id="addexampleModal" tabindex="-1" role="dialog" aria-labelledby="addexampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addexampleModalLabel">Ajouter une Promotion</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <form  action="PromoServlet" method="post">
          <div class="modal-body">
            <select class="custom-select" name="categorie">
              <option value="multimédia">multimédia</option>
              <option value="Bio&Santé">Bio & Santé</option>
            </select>
            <br>
            <br>
            <select class="custom-select" name="produit">
              <%
                AdmincDao dao = new AdmincDao();
                List<Stock> list = dao.getAllStock();
                for(Stock v : list) {

              %>
              <option value="<%=v.getProduit()%>"><%=v.getProduit()%></option>

              <%
                }
              %>
            </select>
            <br>
            <br>
            <input class="form-control" type="number" placeholder="Entrez Promotion" name="promo">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
            <button type="submit" class="btn btn-primary">Ajouter</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%--tableau--%>
<div class="table-responsive">
  <table class="table table-bordered text-center bg-white mx-auto w-auto">
    <thead>
    <tr>
      <th>Catégorie</th>
      <th>Produit</th>
      <th>promotion</th>
      <th>point-fidilités</th>
      <th>Application</th>
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
      <td><%=promotion.getPromo()%>%</td>
      <td><%=promotion.getPoints()%>points</td>
      <td><%=promotion.getDisponible()%></td>
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
