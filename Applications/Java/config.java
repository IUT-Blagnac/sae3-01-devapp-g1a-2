package Application;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class config {
	
	public static void reader(String key) {
		
		Properties fich = new Properties();
		try (InputStream config = new FileInputStream("config.ini")) {
			fich.load(config);
			String v = fich.getProperty(key);
			System.out.println(v);
			
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
	}
	


	public static void writer(String key, String value) {
		Properties fich = new Properties();
		fich.setProperty(key, value);
		try (OutputStream newconfig = new FileOutputStream("config.ini")) {
		    fich.store(newconfig, null);
		} catch (IOException ex) {
		    ex.printStackTrace();
		}
	}

	public static void main(String args[]) {
		reader("server-1");
	}
}
