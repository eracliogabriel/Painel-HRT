package MODEL;


public class Dados {
	
	//Atributos nomeados
	private Long id;
	private String email;
	private String senha;
	private String nomeCompleto;
	private String status;
	private String local;
	private String inicioPrev;
	private String inicioCir;
	private String fimCir;
	private String saidaPrev;
	
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
	public String getInicioPrev() {
		return inicioPrev;
	}
	public void setInicioPrev(String inicioPrev) {
		this.inicioPrev = inicioPrev;
	}
	public String getInicioCir() {
		return inicioCir;
	}
	public void setInicioCir(String inicioCir) {
		this.inicioCir = inicioCir;
	}
	public String getFimCir() {
		return fimCir;
	}
	public void setFimCir(String fimCir) {
		this.fimCir = fimCir;
	}
	public String getSaidaPrev() {
		return saidaPrev;
	}
	public void setSaidaPrev(String saidaPrev) {
		this.saidaPrev = saidaPrev;
	}

}

