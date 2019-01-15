package es.egc;
import org.apache.log4j.*; 

/**
 * MULTIPLICACIÓN
 *
 */
public class App2 
{
	static Logger log=Logger.getLogger(App2.class); 
	
	public static int multiplica(int a, int b){
		int result= a*b;
		log.info("Returning "+a+"*"+b+"="+result);
		return result;
	}
}
