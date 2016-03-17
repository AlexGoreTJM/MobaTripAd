package moba.model.entity;

//Classe bean java rappresentante l'entity Piattaforma

public class Piattaforma {

	private int idpiattaforma;
	private String nome;
	private String brand;
	private String logo;
	private String info;
	
	public Piattaforma(int idpiattaforma){
		this.idpiattaforma = idpiattaforma;
	}
	
	public Piattaforma(Integer idpiattaforma, String nome, String brand, String logo, String info) {
		this.idpiattaforma = idpiattaforma;
		this.nome = nome;
		this.brand = brand;
		this.logo = logo;
		this.info = info;
	}

	public int getIdpiattaforma() {
		return idpiattaforma;
	}

	public String getNome() {
		return nome;
	}

	public String getBrand() {
		return brand;
	}

	public String getLogo() {
		return logo;
	}

	public String getInfo() {
		return info;
	}

	@Override
	public String toString() {
		return "Piattaforma [idpiattaforma=" + idpiattaforma + ", nome=" + nome + ", brand=" + brand + ", logo=" + logo
				+ ", info=" + info + "]";
	}
}
