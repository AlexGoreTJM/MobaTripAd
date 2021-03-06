package moba.model.utilita;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.Timestamp;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

//Classe Java contenente i metodi per la realizzazione di file pdf.

public class JavaPDF {
//	private static String FILE = "C:/Users/Ats/Desktop/Prova.pdf";
	private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
//	private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
//	private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
	private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	private static void addEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}

	private static void addGioco(Document document, String immagine, String titolo, String sh, int players, boolean web,
			Timestamp dataUscita, int etaMin, double costoLancio, String categoria, double valutazioneSito, String info)
					throws DocumentException, MalformedURLException, IOException {
		Image image1 = Image.getInstance(immagine);
		image1.scaleAbsolute(300, 300);
		image1.setAlignment(Element.ALIGN_CENTER);
		document.add(image1);
		Paragraph preface = new Paragraph();
		addEmptyLine(preface, 1);
		preface.add(new Paragraph(titolo, catFont));
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Software House: " + sh, smallBold));
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Categoria: " + categoria, smallBold));
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Numero Giocatori: " + players, smallBold));
		addEmptyLine(preface, 1);
		if (web) {
			preface.add(new Paragraph("Online: si", smallBold));
		} else {
			preface.add(new Paragraph("Online: no", smallBold));
		}
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Data di uscita: " + dataUscita, smallBold));
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Et� minima: " + etaMin, smallBold));
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Costo di lancio: " + costoLancio, smallBold));
		addEmptyLine(preface, 1);
		preface.add(new Paragraph("Valutazione sito: " + valutazioneSito, smallBold));
		addEmptyLine(preface, 3);
		document.add(preface);
		document.newPage();
		Paragraph postface = new Paragraph();
		postface.add(new Paragraph(info));
		document.add(postface);

	}

	public static String creaGiocoPDF(String titolo, String immagine, String sh, int players, boolean web,
			Timestamp dataUscita, int etaMin, double costoLancio, String categoria, double valutazioneSito, String info)
					throws DocumentException, MalformedURLException, IOException {

		Document d = new Document();

		PdfWriter.getInstance(d, new FileOutputStream("C:/Users/"+System.getProperty("user.name")+"/Desktop/" + titolo + ".pdf"));
		d.open();
		addGioco(d, immagine, titolo, sh, players, web, dataUscita, etaMin, costoLancio, categoria, valutazioneSito,
				info);
		d.close();
		return "C:/Users/Ats/Desktop/" + titolo + ".pdf";
	}

}