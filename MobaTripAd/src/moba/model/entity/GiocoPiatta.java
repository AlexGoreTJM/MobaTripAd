package moba.model.entity;

public class GiocoPiatta {

	private int idGioco;
	private int idPiattaforma;

	public GiocoPiatta(int idGioco, int idPiattaforma) {
		this.idGioco = idGioco;
		this.idPiattaforma = idPiattaforma;
	}

	public int getIdGioco() {
		return idGioco;
	}

	public int getIdPiattaforma() {
		return idPiattaforma;
	}

	@Override
	public String toString() {
		return "GiocoPiatta [idGioco=" + idGioco + ", idPiattaforma=" + idPiattaforma + "]";
	}

}
