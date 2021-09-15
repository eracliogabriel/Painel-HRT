<%@page import="MODEL.Dados"%>
<%@page import="DAO.DadosDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAINEL</title>
<link rel="stylesheet"
	href="bootstrap.min.css">
</head>
<body>
<%
DadosDAO dao = new DadosDAO();
List<Dados> ls = dao.listarDados();
if (ls.size() > 0) {
%>
	<p>
		<img
			src="Bandeira_do_Distrito_Federal_Brasil.png"
			height="100px">
		<script>
			var myVar = setInterval(myTimer, 1000);
			function myTimer() {
				var d = new Date();
				document.getElementById("dt-hora").innerHTML = d.getDate()+'/'+(d.getMonth()+1)+'/'+d.getFullYear()+' '+ d
						.toLocaleTimeString();

				var tabela = localStorage.getItem('corpo-tabela');

				document.getElementById("corpo-tabela").innerHTML = tabela;
			}
			documento.myTimer();
		</script>
		Hospital Regional de Taguatinga|Secretaria de Estado de Saúde do
		Distrito Federal| Pacientes no Centro Cirúgico - <span id="dt-hora"></span>
	</p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th width="40%">Nome do paciente</th>
				<th width="20%">Status</th>
				<th width="20%">Local</th>
				<th width="10%">Início Prevísto</th>
				<th width="10%">Início da Cirurgia</th>
				<th width="10%">Fim da Cirurgia</th>
				<th width="10%">Saída Prevista</th>
			</tr>
			<%
				for (Dados d : ls) {
				%>
				<tr>
				<td><%=d.getNomeCompleto()%></td>
				<td style="background-color: <%=d.Cor()%>"> <%=d.getStatus()%></td>
				<td><%=d.getLocal() %></td>
				<td><%=d.getInicioPrev() %></td>
				<td><%=d.getInicioCir() %></td>
				<td><%=d.getFimCir() %></td>
				<td><%=d.getSaidaPrev() %></td>
				</tr>
				<%
				}
				%>
		</thead>
		<tbody id="corpo-tabela" class="font-weight-bold text-monospace">

		</tbody>
	</table>
<%
}
%>
</body>
</html>