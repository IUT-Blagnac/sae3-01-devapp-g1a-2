package Application;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class config {
	
	/*
	 * Méthode permettant de retourner une valeur à partir de sa clé donnée
	 * en paramètre en utilisant la méthode load() qui lit l'InputStream "config.ini" 
	 * et le sépare en couples clé valeurs pour pouvoir obtenir la valeur correspondante à la clé
	 * 
	 */
	public static String getValue(String key) {
		
		String v = "";
		Properties fich = new Properties();
		try (InputStream config = new FileInputStream("config.ini")) {
			fich.load(config);
			v = fich.getProperty(key);
			
			/*lit tout les couples clés valeurs
			 * 
			 * for (String k : fich.stringPropertyNames()) {
			 *  String value1 = fich.getProperty(k);
			 *  System.out.println(k + "=" + value1);
			 *  }
			 */
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return v;
	}
	

	/*
	 * Méthode permettant de réécrire une valeur à partir de sa clé donnée
	 * par celle en paramètre (value) en utilisant la méthode store() 
	 * qui écrit le contenu de l'objet fich dans l'OutputStream "config.ini"
	 * 
	 */
	public static void setValue(String key, String value) {
		Properties fich = new Properties();
		fich.setProperty(key, value);
		try (OutputStream newconfig = new FileOutputStream("config.ini")) {
		    fich.store(newconfig, null);
		} catch (IOException ex) {
		    ex.printStackTrace();
		}
	}

	public static void main(String args[]) {
		System.out.println(getValue("server-1"));
	}
}
