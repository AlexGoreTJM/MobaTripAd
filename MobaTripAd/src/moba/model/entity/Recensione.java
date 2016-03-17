package moba.model.entity;

//Classe bean java rappresentante l'entity Recensione

import java.sql.Timestamp;

public class Recensione {

	private Utente utente;
	private int idGioco;
	private int ctrLike;
	private int ctrDislike;
	private int segnalata;
	private String info;
	private Timestamp dataRec;

	public Recensione(Utente utente, int idGioco, int ctrLike, int ctrDislike, int segnalata, String info,
			Timestamp dataRec) {
		super();
		this.utente = utente;
		this.idGioco = idGioco;
		this.ctrLike = ctrLike;
		this.ctrDislike = ctrDislike;
		this.segnalata = segnalata;
		this.info = info;
		this.dataRec = dataRec;
	}
	
	public Recensione(int idUtente, int idGioco,String info){
		this(new Utente(idUtente),idGioco,0,0,0,info,null);
	}

	public int getIdGioco() {
		return idGioco;
	}

	public void setIdGioco(int idGioco) {
		this.idGioco = idGioco;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public int getCtrLike() {
		return ctrLike;
	}

	public int getCtrDislike() {
		return ctrDislike;
	}

	public int getSegnalata() {
		return segnalata;
	}

	public String getInfo() {
		return info;
	}

	public Timestamp getDataRec() {
		return dataRec;
	}

	@Override
	public String toString() {
		return "/n Recensione [utente=" + utente + ", idGioco=" + idGioco + ", ctrLike=" + ctrLike + ", ctrDislike="
				+ ctrDislike + ", segnalata=" + segnalata + ", info=" + info + ", dataRec=" + dataRec + "]";
	}

}
