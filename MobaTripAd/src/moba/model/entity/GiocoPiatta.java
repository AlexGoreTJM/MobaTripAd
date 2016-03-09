package moba.model.entity;

public class GiocoPiatta {

	private Gioco gioco;
	private Piattaforma piattaforma;
	
	public GiocoPiatta(Gioco gioco, Piattaforma piattaforma) {
		super();
		this.gioco = gioco;
		this.piattaforma = piattaforma;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public Piattaforma getPiattaforma() {
		return piattaforma;
	}

	@Override
	public String toString() {
		return "GiocoPiatta [gioco=" + gioco + ", piattaforma=" + piattaforma + "]";
	}
	
	
	
	
}
