package servlets;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.ws.transport.http.HttpAdapter;

import Logica.valueObjects.VOExcursionDisp;
import defaultP.IFachada;

public class Servlet_Precio extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	    // obtengo los datos del Request
	    String precio1 = req.getParameter("precio1");
	    String precio2 = req.getParameter("precio2");
	    
	    // valido los datos ingresados
	    boolean error = false;
	    String msgError = new String("Arreglo vacio");
		VOExcursionDisp[] voex = null;
	    if ((precio1 == null) || precio1.trim().equals(""))
	    {
			error = true;
			msgError = "El primer precio no puede estar vacio";
	    }
	    
	    if (!error && ((precio2 == null) || precio2.trim().equals("")))
	    {
			error = true;
			msgError = "El segundo precio no puede estar vacio";
	    }
	    
	    else{
	    	try{
	    		Float p1=Float.parseFloat(precio1);
	    		Float p2=Float.parseFloat(precio2);
	    		ServletContext context = super.getServletContext();
			    String ipservidor = super.getInitParameter("ipservidor");
				String puerto = super.getInitParameter("puerto"); 	

					try {
						String ruta = "//" + ipservidor + ":" + puerto + "/obj";
						IFachada ifach = (IFachada) Naming.lookup(ruta);
						try {
							voex = ifach.excursionesXPrecio(p1, p2);
							ArrayList<VOExcursionDisp> arr= new ArrayList<VOExcursionDisp>();
							if(voex.length==0){
								error=true;
								msgError = "No hay excursiones en ese rango de precios";
							}else{
								for(int i=0;i<voex.length;i++){
									arr.add(voex[i]);
								}
								
								context.setAttribute("arregloPrec",arr);
							}						
						} catch (RemoteException e) {
							error = true;
							msgError = "Error en la conexión (RMI)";
						}
					} catch (RemoteException | MalformedURLException  | NotBoundException e) {
						error = true;
						msgError = "Error en la conexión (RMI)";
					}
	    	}catch (NumberFormatException e){
	    		error = true;
				msgError = "El precio debe ser numérico";
			}
	    	
					
	    }
	    	
		
        HttpSession session = req.getSession();
	    String  datosPrec= "desde "+precio1+" hasta "+precio2;
	    if (!error )
	    {		    
		    synchronized (session)
		    {
		        session.setAttribute("datosPrec",datosPrec);    
		    }		    
	    }else{
		    synchronized (session)
		    {
		        session.setAttribute("msgError",msgError);    
		    }	
	    }

		RequestDispatcher rd;
		if (!error)
			rd = req.getRequestDispatcher("listado_precio.jsp");
		else
			rd = req.getRequestDispatcher("error.jsp");
		rd.forward(req, resp);
	}

}