package moba.model.entity;

public class Shop {

	private int idgioco;
	private int idPiattaforma;
	private String link;
	
	public Shop(){};
	
	public Shop(int idgioco, int idPiattaforma, String link) {
		super();
		this.idgioco = idgioco;
		this.idPiattaforma = idPiattaforma;
		this.link = link;
	}

	public int getIdgioco() {
		return idgioco;
	}

	public int getIdPiattaforma() {
		return idPiattaforma;
	}

	public String getLink() {
		return link;
	}

	@Override
	public String toString() {
		return "Shop [idgioco=" + idgioco + ", idPiattaforma=" + idPiattaforma + ", link=" + link + "]";
	}
	
	
	
	
}
