package moba.model.entity;

public class Valutazione {
	
	private Utente utente;
	private Gioco gioco;
	private Boolean voto;
	
	public Valutazione(Utente utente, Gioco gioco, Boolean voto) {
		super();
		this.utente = utente;
		this.gioco = gioco;
		this.voto = voto;
	}

	public Utente getUtente() {
		return utente;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public Boolean getVoto() {
		return voto;
	}

	@Override
	public String toString() {
		return "/n Valutazione [utente=" + utente + ", gioco=" + gioco + ", voto=" + voto + "]";
	}
	
	
	
	

}
