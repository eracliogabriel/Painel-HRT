package MODEL;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;

public class Dados {
	
	//Atributos nomeados
	private Long id;
	private String email;
	private String senha;
	private String nomeCompleto;
	private String status;
	private String local;
	private LocalTime inicioPrev;
	private LocalTime inicioCir;
	private LocalTime fimCir;
	private LocalTime saidaPrev;
	
	//Metodo Get e Set
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public LocalTime getInicioPrev() {
		return inicioPrev;
	}
	public void setInicioPrev(LocalTime inicioPrev) {
		this.inicioPrev = inicioPrev;
	}
	public LocalTime getInicioCir() {
		return inicioCir;
	}
	public void setInicioCir(LocalTime inicioCir) {
		this.inicioCir = inicioCir;
	}
	public LocalTime getFimCir() {
		return fimCir;
	}
	public void setFimCir(LocalTime fimCir) {
		this.fimCir = fimCir;
	}
	public LocalTime getSaidaPrev() {
		return saidaPrev;
	}
	public void setSaidaPrev(LocalTime saidaPrev) {
		this.saidaPrev = saidaPrev;
	}

}

