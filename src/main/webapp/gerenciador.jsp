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
			var vNome = document.getElementById("nome").value.toUpperCase();	
			if (vNome == '') {
				alert('O Nome do Paciente é obrigatório.');
				return false;
			}

			var vStatus = document.getElementById("status").value;
			var vLocal = document.getElementById("local").value;
			var vIniPrevisto = document.getElementById("inicio_previsto").value;
			var vIniCirurgia = document.getElementById("inicio_cirurgia").value;
			var vFimCirurgia = document.getElementById("fim_cirurgia").value;
			var vSaidaPrev = document.getElementById("saida_previsto").value;

			if (vLocal != '') {
				vLocal = '(' + vLocal + ')';
			}

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
				atualizarTabela();
				limpaForm();
			}
		}

		function preparaEdicao(id) {
			var p = pacientes[id];
			document.getElementById("id").value = '<%=dados.getId()%>';
			document.getElementById("nome").value = '<%=dados.getNomeCompleto()%>';
			document.getElementById("status").value = '<%=dados.getStatus()%>';
			document.getElementById("local").value = '<%=dados.getLocal()%>.replace("(","").replace(")","")';
			document.getElementById("inicio-previsto").value = '<%=dados.getInicioPrev()%>';
			document.getElementById("inicio-cirurgia").value = '<%=dados.getInicioCir()%>';
			document.getElementById("fim-cirurgia").value = '<%=dados.getFimCir()%>';
			document.getElementById("saida-previsto").value = '<%=dados.getSaidaPrev()%>';

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

		function atualizarTabela() {
			var tabela = "";

			for (i in pacientes) {
				var stts = status(pacientes[i].status);
				tabela += '<tr onclick="preparaEdicao(' + i + ')">' + '<td>'
						+ pacientes[i].nome + '</td>'
						+ '<td style="background-color: '+stts.cor+';">'
						+ stts.label + pacientes[i].local + '</td>' + '<td>'
						+ pacientes[i].iniPrevisto + '</td>' + '<td>'
						+ pacientes[i].iniCirurgia + '</td>' + '<td>'
						+ pacientes[i].fimCirurgia + '</td>' + '<td>'
						+ pacientes[i].saidaPrev + '</td>' + '</tr>';
			}

			document.getElementById("corpo-tabela").innerHTML = tabela;
			localStorage.setItem('corpo-tabela', tabela);
			localStorage.setItem('ls-tabela', JSON.stringify(pacientes));
		}

		function limpaForm() {
			document.getElementById("id").value = '';
			document.getElementById('form-paciente').reset();
		}

		function apagar() {
			var vId = document.getElementById("id").value='<%=dados.getId()%>';
			if (vId != '') {
				var save = confirm("Tem certeza que quer apagar esse registro?");
				if (save) {
					pacientes.splice(vId, 1);
					atualizarTabela();
					limpaForm();
				}
			}
		}
	</script>

	<div class="container">
		<br>
		<h2>Gerenciar Painel dos Paciente no Centro Cirúrgico</h2>
		<form action="painelServlet" name="form-paciente" id="form-paciente">
			<input type="hidden" id="id" name="id">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Paciente:</label> <input type="text"
						class="form-control" id="nome_paciente" placeholder="Nome do Paciente"
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
						class="form-control" id="local" placeholder="Sala/Quarto"
						name="local">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group  col-md-3">
					<label for="inicio_previsto">Início Prevísto:</label> <input
						type="time" class="form-control" id="inicio_previsto"
						name="inicio_previsto" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="inicio_cirurgia">Início Cirurgia:</label> <input
						type="time" class="form-control" id="inicio_cirurgia"
						name="inicio_cirurgia" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="fim_cirurgia">Fim daCirurgia:</label> <input
						type="time" class="form-control" id="fim_cirurgia"
						name="fim_cirurgia" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="saida_prevista">Saída Prevísto:</label> <input
						type="time" class="form-control" id="saida_prevista"
						name="saida_prevista" size="20">
				</div>
			</div>
			<button type="reset" class="btn btn-secondary" onclick="limpaForm()">Novo</button>
			<button type="submit" class="btn btn-primary" onclick="gravar(this)">Gravar</button>
			<button type="button" class="btn btn-danger" onclick="return confirm('Você realmente quer apagar esse registro?');" href="painelServlet?id=<%=dados.getId()%>&acao=apagar">Apagar</button>
		</form>

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
				<tr>
				<td><%=d.getId() %></td>
				<td><%=d.getNomeCompleto()%></td>
				<td><%=d.getStatus() %></td>
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
			<tbody id="corpo-tabela" style="cursor: pointer;">

			</tbody>
		</table>
<%
}
%>
		<script type="text/javascript">
			var tabela = localStorage.getItem('corpo-tabela');
			document.getElementById("corpo-tabela").innerHTML = tabela;
			
		</script>

	</div>
</body>
</html>