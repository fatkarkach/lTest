<%@ page import="com.Dao.AdmincDao" %>
<%@ page import="com.model.Stock" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 28/10/2022
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Administration</title>
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
                    <a class="nav-link active text-dark" aria-current="page" href="#">Stock</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="promotion.jsp">Promotion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="addpesp.jsp">Resposables</a>
                </li>
            </ul>
        </div>
        <button class="btn btn-dark" type="submit">Déconnecter</button>
    </div>
</nav>
<!-- Button trigger modal -->
<div class="row" style="margin-right:0!important;margin-left: 0 !important;">
    <div class="col text-center">
        <button type="button" class="btn btn-dark mb-4 mt-4" data-toggle="modal" data-target="#addexampleModal">
            Ajouter Un produit
        </button>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="addexampleModal" tabindex="-1" role="dialog" aria-labelledby="addexampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addexampleModalLabel">Ajouter un produit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form  action="Addpro" method="post">
                <div class="modal-body">
                    <select class="custom-select" name="categorie">
                        <option selected>Choisir Une Catégorie</option>
                        <option value="multimédia">multimédia</option>
                        <option value="Bio & Santé">Bio & Santé</option>
                    </select>
                    <br>
                    <br>
                    <input class="form-control" type="text" placeholder="Entrez Nom produit" name="produit">
                    <br>
                    <input class="form-control" type="number" placeholder="Entrez Prix de produit" name="prix">
                    <br>
                    <input class="form-control" type="number" placeholder="Entrez Prix quantités" name="quantites">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
                    <button type="submit" class="btn btn-primary">Ajouter</button>
                </div>
            </form>
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
            <th>Prix</th>
            <th>Quantités</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            AdmincDao dao = new AdmincDao();
            List<Stock> list = dao.getAllStock();
            for(Stock v : list) {
        %>
        <tr>
            <td><%=v.getCategorie()%></td>
            <td><%=v.getProduit()%></td>
            <td><%=v.getPrix()%>DH</td>
            <td><%=v.getQuantites()%></td>
            <td>
            <button type="button" class="btn" data-toggle="modal" data-target="#delexampleModal<%=v.getIdStock()%>">
                <img src="delete.png">
            </button>
            <button type="button" class="btn" data-toggle="modal" data-target="#upexampleModal<%=v.getIdStock()%>">
                <img src="editing.png">
            </button>
                <div class="modal fade" id="delexampleModal<%=v.getIdStock()%>" tabindex="-1" role="dialog" aria-labelledby="delexampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="delexampleModalLabel">Suppression</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="DeletStock" method="post">
                                <div class="modal-body">
                                    Supprimer  le stock
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
                                    <input type="hidden" name="id" value="<%=v.getIdStock()%>" />
                                    <button type="submit" class="btn btn-primary">Supprimer</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="upexampleModal<%=v.getIdStock()%>" tabindex="-1" role="dialog" aria-labelledby="upexampleModal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="upexampleModal">Modification</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form  action="UpdateStock" method="post">
                                    <div class="modal-body">
                                        <select class="custom-select" name="categorie">
                                            <option selected><%=v.getCategorie()%></option>
                                            <option value="multimédia">multimédia</option>
                                            <option value="Bio & Santé">Bio & Santé</option>
                                        </select>
                                        <br>
                                        <br>
                                        <input class="form-control" type="text" placeholder="Entrez Nom produit" name="produit" value="<%=v.getProduit()%>">
                                        <br>
                                        <input class="form-control" type="number" placeholder="Entrez Prix de produit" name="prix" value="<%=v.getPrix()%>">
                                        <br>
                                        <input class="form-control" type="number" placeholder="Entrez la quantités" name="quantites" value="<%=v.getQuantites()%>">
                                        <br>

                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
                                    <input type="hidden" name="id" value="<%=v.getIdStock()%>" />
                                    <button type="submit" class="btn btn-primary">Modifier</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
