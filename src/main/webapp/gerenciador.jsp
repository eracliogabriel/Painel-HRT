<%@page import="MODEL.Dados"%>
<%@page import="DAO.DadosDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.Conexao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap.min.css">
<title>GERENCIADOR</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
				<%
			DadosDAO dao = new DadosDAO();
			Dados dados = new Dados();
			List<Dados> ls = dao.listarDados();
				if (ls.size() > 0) {
			%>
	<script>
		var pacientes = localStorage.getItem('ls-tabela');
		
		if(pacientes == null){
			pacientes = [];
		}else{
			pacientes = JSON.parse(pacientes);
		}

		function gravar() {

			var vId = document.getElementById("id").value;
			var vNome = document.getElementById("nome_paciente").value.toUpperCase();	
			if (vNome == '') {
				alert('O Nome do Paciente é obrigatório.');
				return false;
			}

			var vStatus = document.getElementById("status").value;
			var vLocal = document.getElementById("local").value;
			var vIniPrevisto = document.getElementById("inicio_previsto").value;
			var vIniCirurgia = document.getElementById("inicio_cirurgia").value;
			var vFimCirurgia = document.getElementById("fim_cirurgia").value;
			var vSaidaPrev = document.getElementById("saida_prevista").value;

			
			var save = confirm("Deseja Salvar as alterações?");
			if (save) {

				var paciente = {
					nome : vNome,
					status : vStatus,
					local : vLocal,
					iniPrevisto : vIniPrevisto,
					iniCirurgia : vIniCirurgia,
					fimCirurgia : vFimCirurgia,
					saidaPrev : vSaidaPrev,
				};

				if (vId == '') {
					pacientes.splice(pacientes.length, 0, paciente);
				} else {
					pacientes[vId] = paciente;
				}
				document.getElementById('form-paciente').submit();
			}
			return paciente;
		}

		function preparaEdicao(id, nome_paciente, status, local, inicio_previsto, inicio_cirurgia, fim_cirurgia, saida_prevista) {

			document.getElementById("id").value;
			document.getElementById("nome_paciente").value;
			document.getElementById("status").value;
			document.getElementById("local").value;
			document.getElementById("inicio_previsto").value;
			document.getElementById("inicio_cirurgia").value;
			document.getElementById("fim_cirurgia").value;
			document.getElementById("saida_prevista").value;
		

		}
		


		function status(status) {
			switch (status) {
			case 'Pré-Operatório':
				return {
					label : 'Pré-Operatório',
					cor : '#fbd972'
				};
			case 'Em sala cirúrgica':
				return {
					label : 'Em sala cirúrgica',
					cor : '#fd5766'
				};
			case 'Em recuperação':
				return {
					label : 'Em recuperação',
					cor : '#89e89f'
				};
			case 'Transferído':
				return {
					label : 'Transferído',
					cor : '#b8daff'
				};
			}
		}

		function limpaForm() {
			document.getElementById("id").value = '';
			document.getElementById('form-paciente').reset();
		}

		function apagar() {
			var vId = document.getElementById("id").value='';
			if (vId != '') {
				vId
				var save = confirm("Tem certeza que quer apagar esse registro?");
				if (save) {
					window.location = "painelServlet?id="+vId+"&acao=apagar";
				}
			}
		}
	</script>
<%
	Dados d1 = new Dados();
	try {
		long id = Long.parseLong(request.getParameter("id"));
		//DadosDao dao = new PessoaDao();
		d1 = dao.getPessoa(id);

	} catch (Exception e) {
	}
	//out.print(id);
	%>
	<div class="container">
		<br>
		<h2>Gerenciar Painel dos Paciente no Centro Cirúrgico</h2>
		<form action="painelServlet" name="form-paciente" id="form-paciente">
			<input type="hidden" id="id" name="id">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Paciente:</label> <input type="text"
						class="form-control" id="nome_paciente" placeholder="Nome do Paciente" value="<%=d1.getNomeCompleto()%>"
						name="nome_paciente">
				</div>
				<div class="form-group col-md-3">
					<label for="status">Status:</label> <select name="status" id="status"
						class="form-control">
						<option value="Pré-Operatório">Pré-Operatório</option>
						<option value="Em sala cirúrgica">Em sala cirúrgica</option>
						<option value="Em recuperação">Em recuperação</option>
						<option value="Transferído">Transferído</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="local">Local:</label> <input type="text"
						class="form-control" value="<%=d1.getLocal()%>" id="local" placeholder="Sala/Quarto"
						name="local">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group  col-md-3">
					<label for="inicio_previsto">Início Prevísto:</label> <input
						type="time" class="form-control" id="inicio_previsto"
						name="inicio_previsto" size="20" value="<%=d1.getInicioPrev()%>">
				</div>
				<div class="form-group  col-md-3">
					<label for="inicio_cirurgia">Início Cirurgia:</label> <input
						type="time" class="form-control" id="inicio_cirurgia"
						name="inicio_cirurgia" size="20" value="<%=d1.getInicioCir()%>">
				</div>
				<div class="form-group  col-md-3">
					<label for="fim_cirurgia">Fim da Cirurgia:</label> <input
						type="time" class="form-control" id="fim_cirurgia"
						name="fim_cirurgia" size="20" value="<%=d1.getFimCir()%>">
				</div>
				<div class="form-group  col-md-3">
					<label for="saida_prevista">Saída Prevísto:</label> <input
						type="time" class="form-control" id="saida_prevista"
						name="saida_prevista" size="20" value="<%=d1.getSaidaPrev()%>">
				</div>
			</div>
			<button type="reset" class="btn btn-secondary" onclick="limpaForm()">Novo</button>
			<button type="submit" class="btn btn-primary" onclick="gravar(this)">Gravar</button>
			<button type="button" class="btn btn-danger" onclick="apagar()">Apagar</button>
			</form>
<script type="text/javascript">
 		document.getElementById("status").value='<%=d1.getStatus()%>';
</script>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="20%">ID</th>
					<th width="40%">Nome do Paciente</th>
					<th width="30%">Status</th>
					<th width="20%">Local</th>
					<th width="10%">Início Prevísto</th>
					<th width="10%">Início da Cirurgia</th>
					<th width="10%">Fim da Cirurgia</th>
					<th width="10%">Saída Prevista</th>
				</tr>
<%
for (Dados d : ls) {
%>
					<tr onclick="window.location.href = 'gerenciador.jsp?id=<%=d.getId()%>'">
						<td><%=d.getId() %></td>
						<td><%=d.getNomeCompleto() %></td>
 						<td style="background-color: <%=d.Cor()%>"> <%=d.getStatus()%></td>
 						<td><%=d.getLocal() %></td>
						<td><%=d.getInicioPrev()%></td>
						<td><%=d.getInicioCir()%></td>
						<td><%=d.getFimCir()%></td>
						<td><%=d.getSaidaPrev()%></td>			
					</tr>
					<%
					}
					%>
				
			</thead>
			<tbody id="corpo-tabela" style="cursor: pointer;">
			
			</tbody>
		</table>
		<%
				}
		%>
		<script type="text/javascript">
<%-- 		document.getElementById("status").value='<%=d1.getStatus()%>'; --%>
			var tabela = localStorage.getItem('corpo-tabela');
			document.getElementById("corpo-tabela").innerHTML = tabela;
	
		</script>

	</div>
</body>
</html>