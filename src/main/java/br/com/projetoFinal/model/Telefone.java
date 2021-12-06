package br.com.projetoFinal.model;


public class Telefone {

	private Integer idUsuario;
	private Integer id;
	private Integer ddd;
	private String numero;
	private String tipo;
	private String nomeUsuario;
	
	
	public Telefone() {
	}

	public Telefone(Integer ddd, String numero, String tipo, Integer idUsuario) {
		super();
		this.ddd = ddd;
		this.numero = numero;
		this.tipo = tipo;
		this.idUsuario = idUsuario;
	}
	
	public Telefone(Integer id, Integer ddd, String numero, String tipo) {
		super();
		this.id = id;
		this.ddd = ddd;
		this.numero = numero;
		this.tipo = tipo;
	}
	

	public Integer getDdd() {
		return ddd;
	}

	public Integer setDdd(Integer ddd) {
		this.ddd = ddd;
		return ddd;
	}

	public String getNumero() {
		return numero;
	}

	public String setNumero(String numero) {
		this.numero = numero;
		return numero;
	}

	public String getTipo() {
		return tipo;
	}

	public String setTipo(String tipo) {
		this.tipo = tipo;
		return tipo;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public Integer setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
		return idUsuario;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public String setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
		return nomeUsuario;
	}
	

	@Override
	public String toString() {
		
		return "(" + ddd + ")" + " " + numero;
	}

}
