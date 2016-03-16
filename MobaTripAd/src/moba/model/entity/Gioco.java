package moba.model.entity;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Gioco {

	private int idGioco;
	private String titolo;
	private String sh;
	private int players;
	private boolean web;
	private Date dataUscita;
	private int etaMin;
	private double costoLancio;
	private double valutazioneSito;
	private double valutazione = 0.0;
	private String pro;
	private String contro;
	private String img1;
	private String img2;
	private String urlVideo;
	private String urlSh;
	private String requisiti;
	private String info;
	private Timestamp dataReg;
	
	//oggetti compositivi:
	private Categoria categoria;
	private ArrayList<Piattaforma> piattaforme;
	private ArrayList<Recensione> recensioni;
	
	
	//COSTRUTTORI:
	
	public Gioco(int idGioco){
		this.idGioco = idGioco;
	}

	public Gioco(int idGioco, String titolo, String sh, int players, boolean web, Date dataUscita, int etaMin,
			double costoLancio, Categoria categoria, double valutazioneSito, String pro, String contro, String img1,
			String img2, String urlVideo, String urlSh, String requisiti, String info, Timestamp dataReg, ArrayList<Piattaforma> piattaforme,ArrayList<Recensione> recensioni, double valutazione) {
		super();
		this.idGioco = idGioco;
		this.titolo = titolo;
		this.sh = sh;
		this.players = players;
		this.web = web;
		this.dataUscita = dataUscita;
		this.etaMin = etaMin;
		this.costoLancio = costoLancio;
		this.categoria = categoria;
		this.valutazioneSito = valutazioneSito;
		this.pro = pro;
		this.contro = contro;
		this.img1 = img1;
		this.img2 = img2;
		this.urlVideo = urlVideo;
		this.urlSh = urlSh;
		this.requisiti = requisiti;
		this.info = info;
		this.dataReg = dataReg;
		this.piattaforme = piattaforme;
		this.recensioni = recensioni;
		this.valutazione = valutazione;
	}

	public Gioco(String titolo, String sh, int players, boolean web, Date dataUscita, int etaMin, double costoLancio,
			int idCategoria, double valutazioneSito, String pro, String contro, String img1, String img2,
			String urlVideo, String urlSh, String requisiti, String info) {
		
		this(0, titolo, sh, players, web, dataUscita, etaMin, costoLancio, new Categoria(idCategoria, null, null, null), valutazioneSito, pro, contro,
				img1, img2, urlVideo, urlSh, requisiti, info, null, null,null,0.0);
	}

	
	//GETTER & SETTER:

	public int getIdGioco() {
		return idGioco;
	}
	public void setIdGioco(int idGioco) {
		this.idGioco = idGioco;
	}

	public String getTitolo() {
		return titolo;
	}

	public String getSh() {
		return sh;
	}

	public int getPlayers() {
		return players;
	}

	public boolean isWeb() {
		
		return web ;
	}

	

	public String web(){
		if(this.web){
			String result ="SI";
			return result;
		}
		else{
			String result = "NO";
			return result;
		}	
	}
	
	
	public Date getDataUscita() {
		return dataUscita;
	}

	public int getEtaMin() {
		return etaMin;
	}

	public double getCostoLancio() {
		return costoLancio;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public double getValutazioneSito() {
		return valutazioneSito;
	}

	public String getPro() {
		return pro;
	}

	public String getContro() {
		return contro;
	}

	public String getImg1() {
		return img1;
	}

	public String getImg2() {
		return img2;
	}

	public String getUrlVideo() {
		return urlVideo;
	}

	public String getUrlSh() {
		return urlSh;
	}

	public String getRequisiti() {
		return requisiti;
	}

	public String getInfo() {
		return info;
	}

	public Timestamp getDataReg() {
		return dataReg;
	}
	
	public ArrayList<Piattaforma> getPiattaforme() {
		return piattaforme;
	}

	public ArrayList<Recensione> getRecensioni() {
		return recensioni;
	}

	

	public double getValutazione() {
		return valutazione;
	}

	public void setValutazione(double valutazione) {
		this.valutazione = valutazione;
	}

	@Override
	public String toString() {
		return "\n\nGioco [idGioco=" + idGioco + ", titolo=" + titolo + ", sh=" + sh + ", players=" + players 
				+ ", web=" + web + ", dataUscita=" + dataUscita + ", etaMin=" + etaMin + ", costoLancio=" + costoLancio
				+ ", valutazioneSito=" + valutazioneSito + ", valutazione=" + valutazione
				+ ", pro=" + pro + ", contro=" + contro + ", img1=" + img1 + ", img2=" + img2 
				+ ", urlVideo=" + urlVideo + ", urlSh=" + urlSh
				+ ", requisiti=" + requisiti + ", dataReg=" + dataReg
				+ "\nINFO=" + info + "]"
				+ "\nCATEGORIA: " + categoria
				+ "\nPIATTAFORME:\n"+ piattaforme
				+ "\nRECENSIONI:\n" + recensioni;
	}

}
