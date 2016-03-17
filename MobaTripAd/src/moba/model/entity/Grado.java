package moba.model.entity;

//Classe bean java rappresentante l'entity Grado.

public class Grado {
	
	private String nome;
	private double peso;
	
	public Grado(String nome, double peso) {
		super();
		this.nome = nome;
		this.peso = peso;
	}

	public String getNome() {
		return nome;
	}
	

	public double getPeso() {
		return peso;
	}

	@Override
	public String toString() {
		return "Grado:\n [nome=" + nome + ", peso=" + peso + "]";
	}
	
	
	
	

}
