import java.io.FileWriter;
import java.util.Calendar;
    
public aspect Logger {
	//File file = new File("log.txt");
    
    pointcut successTransaction() : call(* moneyMake*(..) );
    after() : successTransaction() {
    	Calendar cal = Calendar.getInstance();
    	String linea = "transaction;" + cal.getTime().getHours() +"h:" +cal.getTime().getMinutes() +"m:"+cal.getTime().getSeconds() +"s";
    	System.out.println("\nTransaccion realizada con exito a las: " + cal.getTime().getHours() +"h:" +cal.getTime().getMinutes() +"m:"+cal.getTime().getSeconds() +"s\n");
        FileWriter fichero = null;
    	try {
    		fichero = new FileWriter("log.txt",true);
    		fichero.write(linea + "\n");
    		fichero.close();
    	} catch (Exception ex) {
    		System.out.println("Mensaje de la excepción: " + ex.getMessage());
    	}	
    }    
    pointcut successWithdrawal() : call(* moneyWith*(..) );
    after() : successWithdrawal() {
    	Calendar cal = Calendar.getInstance();
    	String linea = "withdrawal;" + cal.getTime().getHours() +"h:" +cal.getTime().getMinutes() +"m:"+cal.getTime().getSeconds() +"s";
    	System.out.println("\nWithdrawal realizada con exito a las: " + cal.getTime().getHours() +"h:" +cal.getTime().getMinutes() +"m:"+cal.getTime().getSeconds() +"s\n");
        FileWriter fichero = null;
    	try {
    		fichero = new FileWriter("log.txt",true);
    		fichero.write(linea + "\n");
    		fichero.close();
    	} catch (Exception ex) {
    		System.out.println("Mensaje de la excepción: " + ex.getMessage());
    	}
    }
}