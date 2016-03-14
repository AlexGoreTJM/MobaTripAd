package moba.model.entity;

import java.sql.Timestamp;

public class Utente {

	private int idUtente;
	private boolean admin;
	private String nickname;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private Grado grado;
	private String avatar;
	private Timestamp dataReg;
	private String info;

	//COSTRUTTORI:
	public Utente(int idUtente){
		this.idUtente = idUtente;

	}
	
	public Utente(int idUtente, boolean admin, String nickname, String email, String password, String nome,
			String cognome, Grado grado, String avatar, Timestamp dataReg, String info) {
		super();
		this.idUtente = idUtente;
		this.admin = admin;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.grado = grado;
		this.avatar = avatar;
		this.dataReg = dataReg;
		this.info = info;

	}
	
	public Utente(String nickname, String email, String password, String nome, String cognome, Grado grado,
			String avatar, String info) {
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.grado = grado;
		this.avatar = avatar;
		this.info = info;

	}

	public Utente(boolean admin, String nickname, String email, String password, String nome, String cognome, String grado,
			String avatar, String info) {
		this(0, admin, nickname, email, password, nome, cognome, new Grado(grado, 0), avatar, null, info);
	}
	
	
	//GETTER & SETTER	

	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public boolean isAdmin() {
		return admin;
	}

	public String getNickname() {
		return nickname;
	}

	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
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