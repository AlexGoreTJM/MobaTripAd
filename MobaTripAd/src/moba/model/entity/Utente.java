package moba.model.entity;

import java.sql.Timestamp;

public class Utente {
	
	private Integer idUtente;
	private Boolean admin;
	private String nickname;
	private String email;
	private String nome;
	private String cognome;
	private Grado grado;
	private String avatar;
	private Timestamp dataReg;
	private String info;
	
	public Utente(Integer idUtente, Boolean admin, String nickname, String email, String nome, String cognome,
			Grado grado, String avatar, Timestamp dataReg, String info) {
		super();
		
		this.idUtente = idUtente;
		this.admin = admin;
		this.nickname = nickname;
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.grado = grado;
		this.avatar = avatar;
		this.dataReg = dataReg;
		this.info = info;
	}
	public Integer getIdUtente() {
		return idUtente;
	}
	public Boolean getAdmin() {
		return admin;
	}
	public String getNickname() {
		return nickname;
	}
	public String getEmail() {
		return email;
	}
	public String getNome() {
		return nome;
	}
	public String getCognome() {
		return cognome;
	}
	public Grado getGrado() {
		return grado;
	}
	public String getAvatar() {
		return avatar;
	}
	public Timestamp getDataReg() {
		return dataReg;
	}
	public String getInfo() {
		return info;
	}
	
	
	@Override
	public String toString() {
		return 
				
				" /n Utente [idUtente=" + idUtente + ", admin=" + admin + ", nickname=" + nickname + ", email=" + email
				+ ", nome=" + nome + ", cognome=" + cognome + ", grado=" + grado + ", avatar=" + avatar + ", dataReg="
				+ dataReg + ", info=" + info + "]";
	}
	
	

}
