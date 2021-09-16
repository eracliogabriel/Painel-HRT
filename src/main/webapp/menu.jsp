<%@page import="MODEL.Dados"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
ul {
	background-color: #eee;
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	width: 53%;
	margin: auto;
}
li {
	float: left;
}
li a {
	color: black;
	padding: 16px;
	display: block;
	text-align: center;
	text-decoration: none;
}
li a:hover {
	background-color: #ddd;
}
#dadosUsuario {
	color: black;
	padding: 16px;
	display: block;
	text-align: center;
	text-decoration: none;
	float: right;
}
#dadosUsuario a:hover {
	color: black;
	text-decoration: underline;
}

</style>
<ul>
	<li><a href="painel.jsp">Visualizar Pacientes</a></li>

	<span id="dadosUsuario"><a href="login.jsp">Sair</a></span>
	<span id="dadosUsuario">Logado como: Administrador</span>



</ul>