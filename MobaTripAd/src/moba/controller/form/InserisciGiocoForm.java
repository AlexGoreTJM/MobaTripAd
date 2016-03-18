package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

@SuppressWarnings("serial")
public class InserisciGiocoForm extends ActionForm {
	private String titolo;
	private String sh;
	private String players;
	private String web;
	private String etaMin;
	private String costoLancio;
	private String idCategoria;
	private String valutazioneSito;
	private String pro;
	private String contro;
	private FormFile file1;
	private FormFile file2;
	private String urlVideo;
	private String urlSh;
	private String requisiti;
	private String info;
	private String year;
	private String month;
	private String day;

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getSh() {
		return sh;
	}

	public void setSh(String sh) {
		this.sh = sh;
	}

	public String getPlayers() {
		return players;
	}

	public void setPlayers(String players) {
		this.players = players;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getEtaMin() {
		return etaMin;
	}

	public void setEtaMin(String etaMin) {
		this.etaMin = etaMin;
	}

	public String getCostoLancio() {
		return costoLancio;
	}

	public void setCostoLancio(String costoLancio) {
		this.costoLancio = costoLancio;
	}

	public String getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(String idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getValutazioneSito() {
		return valutazioneSito;
	}

	public void setValutazioneSito(String valutazioneSito) {
		this.valutazioneSito = valutazioneSito;
	}

	public String getPro() {
		return pro;
	}

	public void setPro(String pro) {
		this.pro = pro;
	}

	public String getContro() {
		return contro;
	}

	public void setContro(String contro) {
		this.contro = contro;
	}

	public FormFile getFile1() {
		return file1;
	}

	public void setFile1(FormFile file1) {
		this.file1 = file1;
	}

	public FormFile getFile2() {
		return file2;
	}

	public void setFile2(FormFile file2) {
		this.file2 = file2;
	}

	public String getUrlVideo() {
		return urlVideo;
	}

	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}

	public String getUrlSh() {
		return urlSh;
	}

	public void setUrlSh(String urlSh) {
		this.urlSh = urlSh;
	}

	public String getRequisiti() {
		return requisiti;
	}

	public void setRequisiti(String requisiti) {
		this.requisiti = requisiti;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();

		// nell'ActionMessage definiamo un 'etichetta' facilmente decifrabile
		// secondo la regola NomeClasse.campo.problema
		if (this.titolo == null || this.titolo.isEmpty())
			errori.add("titolo", new ActionMessage("obbligatorio", "titolo"));

		if (this.sh == null || this.sh.isEmpty())
			errori.add("sh", new ActionMessage("obbligatorio", "sh"));

		if (this.players == null || this.players.isEmpty())
			errori.add("players", new ActionMessage("obbligatorio", "players"));

		if (this.web == null || this.web.isEmpty())
			errori.add("web", new ActionMessage("obbligatorio", "web"));

		if (this.etaMin == null || this.etaMin.isEmpty())
			errori.add("etaMin", new ActionMessage("obbligatorio", "etaMin"));

		if (this.costoLancio == null || this.costoLancio.isEmpty())
			errori.add("costoLancio", new ActionMessage("obbligatorio", "costoLancio"));

		if (this.idCategoria == null || this.idCategoria.isEmpty())
			errori.add("idCategoria", new ActionMessage("obbligatorio", "idCategoria"));

		if (this.valutazioneSito == null || this.valutazioneSito.isEmpty())
			errori.add("valutazioneSito", new ActionMessage("obbligatorio", "valutazioneSito"));

		if (this.pro == null || this.pro.isEmpty())
			errori.add("pro", new ActionMessage("obbligatorio", "pro"));

		if (this.contro == null || this.contro.isEmpty())
			errori.add("contro", new ActionMessage("obbligatorio", "contro"));

		if (this.info == null || this.info.isEmpty())
			errori.add("info", new ActionMessage("obbligatorio", "info"));

		if (this.year == null || this.year.isEmpty())
			errori.add("year", new ActionMessage("obbligatorio", "year"));

		if (this.month == null || this.month.isEmpty())
			errori.add("month", new ActionMessage("obbligatorio", "month"));

		if (this.day == null || this.day.isEmpty())
			errori.add("day", new ActionMessage("obbligatorio", "day"));
		
		if( getFile1().getFileSize() == 0){
	 	       errori.add("common.file.err",
	 	    	new ActionMessage("error.common.file.required"));
	 	    }
		
		if( getFile2().getFileSize() == 0){
	 	       errori.add("common.file.err",
	 	    	new ActionMessage("error.common.file.required"));
	 	    }

		return errori;
	}

}
