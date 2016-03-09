package moba.model.entity;

import java.sql.Timestamp;

public class Recensione {
	
	private Utente utente;
	private Gioco gioco;
	private Integer ctrLike;
	private Integer ctrDislike;
	private Integer segnalata;
	private String info;
	private Timestamp dataRec;
	
	public Recensione(Utente utente, Gioco gioco, Integer ctrLike, Integer ctrDislike, Integer segnalata, String info,
			Timestamp dataRec) {
		super();
		this.utente = utente;
		this.gioco = gioco;
		this.ctrLike = ctrLike;
		this.ctrDislike = ctrDislike;
		this.segnalata = segnalata;
		this.info = info;
		this.dataRec = dataRec;
	}

	public Utente getUtente() {
		return utente;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public Integer getCtrLike() {
		return ctrLike;
	}

	public Integer getCtrDislike() {
		return ctrDislike;
	}

	public Integer getSegnalata() {
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
		return "/n Recensione [utente=" + utente + ", gioco=" + gioco + ", ctrLike=" + ctrLike + ", ctrDislike="
				+ ctrDislike + ", segnalata=" + segnalata + ", info=" + info + ", dataRec=" + dataRec + "]";
	}
	
	

}
