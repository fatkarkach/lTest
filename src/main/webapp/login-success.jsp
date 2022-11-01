<%@ page import="com.Dao.AdminDao" %>
<%@ page import="com.model.Users" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yc
  Date: 27/10/2022
  Time: 10:07
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
<nav class="navbar bg-light">
    <div class="container-fluid">
        <a class="navbar-brand"><img src="iconmarjan.png"> <span><strong> M</strong>arjan<strong>P</strong>romo</span></a>
            <button class="btn btn-dark" type="submit">Déconnecter</button>
    </div>
</nav>
<!-- Button trigger modal -->
<div class="row" style="margin-right:0!important;margin-left: 0 !important;">
    <div class="col text-center">
        <button type="button" class="btn btn-dark mb-4 mt-4" data-toggle="modal" data-target="#addexampleModal">
            Ajouter Un admin
        </button>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="addexampleModal" tabindex="-1" role="dialog" aria-labelledby="addexampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addexampleModalLabel">Administation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form  action="AdminController" method="post">
                <div class="modal-body">
                    <input class="form-control" type="text" placeholder="Entrez Nom" name="nom"><br>
                    <input class="form-control" type="text" placeholder="Entrez Prénom" name="prenom"><br>
                    <%--        <button type="button" class="btn btn-primary" id="btn">Tanger</button>--%>
                    <select class="custom-select" name="ville" id="btn">
                        <option selected>Choisir Une ville</option>
                        <option value="Tanger">Tanger</option>
                        <option value="Zagora">Zagora</option>

                    </select>
                    <br>
                    <select class="custom-select mt-3" id="box" style="display: none" name="centre">
                        <option selected>Choisir un Centre tanger</option>
                        <option value="Tmarjan1">Tmarjan1</option>
                        <option value="Tmarjan2">Tmarjan2</option>
                        <option value="Tmarjan3">Tmarjan3</option>
                    </select>
                    <select class="custom-select mt-3" id="boxz" style="display: none" name="centre">
                        <option selected>Choisir Centre Zagora</option>
                        <option value="Zmarjan1">Zmarjan1</option>
                        <option value="Zmarjan2">Zmarjan2</option>
                        <option value="Zmarjan3">Zmarjan3</option>
                    </select>
                    <br>
                    <script>
                        const box = document.getElementById('box');

                        const btn = document.getElementById('btn');
                        //zagora
                        const boxz = document.getElementById('boxz');

                        btn.onchange = () => {
                            if (btn.value == "Tanger"){
                                if (box.style.display === 'none') {
                                    box.style.display = 'block';
                                    boxz.style.display = 'none'
                                }
                                else {
                                    box.style.display = 'none';
                                }
                            }else if (btn.value == "Zagora"){
                                if (boxz.style.display === 'none') {
                                    boxz.style.display = 'block';
                                    box.style.display = 'none';
                                } else {
                                    boxz.style.display = 'none';
                                }

                            }
                        };
                    </script>
                    <input class="form-control" type="email" placeholder="Entrez Adresse Email" name="email"><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
                    <button type="submit" class="btn btn-primary">Ajouter</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="table-responsive">
<table class="table table-bordered text-center bg-white mx-auto w-auto">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Centre</th>
        <th>Ville</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        AdminDao dao = new AdminDao();
        List<Users> list = dao.getAllUser();
        for(Users v : list) {
    %>

    <tr>
        <td><%=v.getNom() %></td>
        <td><%=v.getPrenom() %></td>
        <td><%=v.getEmail() %></td>
        <td><%=v.getVille() %></td>
        <td><%=v.getCentre() %></td>
        <td><!-- Button trigger modal -->
            <button type="button" class="btn" data-toggle="modal" data-target="#delexampleModal<%=v.getIdUsers()%>">
                <img src="delete.png">
            </button>
            <button type="button" class="btn" data-toggle="modal" data-target="#upexampleModal<%=v.getIdUsers()%>">
                <img src="editing.png">
            </button>
            <!-- Modal  delet-->
            <div class="modal fade" id="delexampleModal<%=v.getIdUsers()%>" tabindex="-1" role="dialog" aria-labelledby="delexampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="delexampleModalLabel">Suppression</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="DeleteAdmin" method="post">
                            <div class="modal-body">
                                Supprimer l'admin
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
                                <input type="hidden" name="id" value="<%=v.getIdUsers()%>" />
                                <button type="submit" class="btn btn-primary">Supprimer</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="upexampleModal<%=v.getIdUsers()%>" tabindex="-1" role="dialog" aria-labelledby="upexampleModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="upexampleModal">Modification</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form  action="UpdateAdmin" method="post">
                            <div class="modal-body">
                                <input class="form-control" type="text" placeholder="Entrez Nom" name="nom" value="<%=v.getNom()%>"><br>
                                <input class="form-control" type="text" placeholder="Entrez Prénom" name="prenom" value="<%=v.getPrenom()%>"><br>
                                <%--        <button type="button" class="btn btn-primary" id="btn">Tanger</button>--%>
                                <br>
                                <input class="form-control" type="email" placeholder="Entrez Adresse Email" name="email" value="<%=v.getEmail()%>"><br>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
                                <input type="hidden" name="id" value="<%=v.getIdUsers()%>" />
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
