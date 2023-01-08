package Application;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class config {
	
	public static void reader() {
		
		Properties fich = new Properties();
		try (InputStream input = new FileInputStream("config.ini")) {
			fich.load(input);
			for (String key : fich.stringPropertyNames()) {
			    String value = fich.getProperty(key);
			    System.out.println(key + "=" + value);
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	
	public static void writer() {
		Properties fich = new Properties();
		fich.setProperty("clé", "valeur");
		//exemple: fich.setProperty("temp-1", "15");
		try (OutputStream output = new FileOutputStream("config.ini")) {
		    fich.store(output, null);
		} catch (IOException ex) {
		    ex.printStackTrace();
		}
	}

	public static void main(String args[]) {
		reader();
	}
}
