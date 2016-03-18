package moba.model.entity;

public class Shop {

	private int idgioco;
	private String piattaforma;
	private String link;
	
	public Shop(){};
	
	public Shop(int idgioco, String piattaforma, String link) {
		super();
		this.idgioco = idgioco;
		this.piattaforma = piattaforma;
		this.link = link;
	}

	public int getIdgioco() {
		return idgioco;
	}

	public String getPiattaforma() {
		return piattaforma;
	}

	public String getLink() {
		return link;
	}

	@Override
	public String toString() {
		return "Shop [idgioco=" + idgioco + ", piattaforma=" + piattaforma + ", link=" + link + "]";
	}
	
	
	
	
}
