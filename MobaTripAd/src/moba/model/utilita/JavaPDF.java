package moba.model.utilita;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.Date;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class JavaPDF {
	  private static String FILE = "C:/Users/Ats/Desktop/Prova.pdf";
	  private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
	      Font.BOLD);
	  private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
	      Font.NORMAL, BaseColor.RED);
	  private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
	      Font.BOLD);
	  private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
	      Font.BOLD);
	  
	  
	  private static void addEmptyLine(Paragraph paragraph, int number) {
	    for (int i = 0; i < number; i++) {
	      paragraph.add(new Paragraph(" "));
	    }
	  }
	  
	  
	  private static void addGioco(Document document,
			  String titolo,
			  String sh,
			  int players,
			  boolean web,
			  Timestamp dataUscita,
			  int etaMin,
			  double costoLancio,
			  String categoria,
			  double valutazioneSito)
		      throws DocumentException {
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
		     preface.add(new Paragraph("Online: " + web, smallBold));
		    addEmptyLine(preface, 1);
		     preface.add(new Paragraph("Data di uscita: " + dataUscita, smallBold));
		    addEmptyLine(preface, 1);
		    preface.add(new Paragraph("Et� minima: " + etaMin, smallBold));
		    addEmptyLine(preface, 1);
		    preface.add(new Paragraph("Costo di lancio: " + costoLancio, smallBold));
		    addEmptyLine(preface, 1);
		    preface.add(new Paragraph("Valutazione sito: "+ valutazioneSito));
		    document.add(preface);
		  }
	  
	  public static String creaGiocoPDF(String titolo, 
			  String sh, 
			  int players,
			  boolean web, 
			  Timestamp dataUscita,
			  int etaMin, 
			  double costoLancio, 
			  String categoria, 
			  double valutazioneSito) throws FileNotFoundException, DocumentException{
		  Document d = new Document();
		
		  
		  PdfWriter.getInstance(d, new FileOutputStream("C:/Users/Ats/Desktop/"+titolo+".pdf"));
		  d.open();
		  addGioco(d, titolo,sh,players,web,dataUscita,etaMin,costoLancio,categoria,valutazioneSito);
		  d.close();
		  return "C:/Users/Ats/Desktop/"+titolo+".pdf";  
	  }
	  
	  
	  /*
	  public static void main(String[] args) throws FileNotFoundException, DocumentException{
		  String prova = creaGiocoPDF("Warcraft III","Blizzard",4,11,50.5,"Strategico","E' un bel stracazzo di gioco");
		  System.out.println(prova);
	  }
	  */
	  
	  /*
	  public static void main(String[] args) {
		    try {
		      Document document = new Document();
		      PdfWriter.getInstance(document, new FileOutputStream(FILE));
		      document.open();
		     
		      addMetaData(document);
		      addTitlePage(document);
		      addContent(document);
		      document.close();
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		  }
	  */
	  
	 
	  
	  
	  
	  
	  
	  
	} 