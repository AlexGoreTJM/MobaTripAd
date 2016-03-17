package moba.model.entity;

//Classe bean java rappresentante l'entity Valutazione

public class Valutazione {

	private Utente utente;
	private Gioco gioco;
	private int voto;

	public Valutazione(Utente utente, Gioco gioco, int voto) {
		super();
		this.utente = utente;
		this.gioco = gioco;
		this.voto = voto;
	}

	public Valutazione(int idUtente, int idGioco, int voto) {
		this.utente = new Utente(idUtente);
		this.gioco = new Gioco(idGioco);
		this.voto = voto;
	}

	public Utente getUtente() {
		return utente;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public int getVoto() {
		return voto;
	}

	public void setVoto(int voto) {
		this.voto = voto;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public void setGioco(Gioco gioco) {
		this.gioco = gioco;
	}

	@Override
	public String toString() {
		return "/n Valutazione [utente=" + utente + ", gioco=" + gioco + ", voto=" + voto + "]";
	}

}
