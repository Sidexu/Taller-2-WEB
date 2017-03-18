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

import defaultP.IFachada;
import Logica.valueObjects.VOExcursionDisp;

public class Servlet_Dest extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
	    // obtengo los datos del Request
	    String destino = req.getParameter("destino");
	    
	    // valido los datos ingresados
	    boolean error = false;
	    String msgError = new String("Arreglo vacio");
		VOExcursionDisp[] voex = null;
	    if ((destino == null) || destino.trim().equals(""))
	    {
			error = true;
			msgError = "El destino no puede estar vacio";
	    }
	    else{
	    	ServletContext context = super.getServletContext();
		    String ipservidor = super.getInitParameter("ipservidor");
			String puerto = super.getInitParameter("puerto"); 
				

				try {
					String ruta = "//" + ipservidor + ":" + puerto + "/obj";
					IFachada ifach = (IFachada) Naming.lookup(ruta);
					try {
						voex = ifach.excursionesXDestino(destino);
						ArrayList<VOExcursionDisp> arr= new ArrayList<VOExcursionDisp>();
						if(voex.length==0){
							error=true;
							msgError = "No hay excursiones con ese destino";
						}else{
							for(int i=0;i<voex.length;i++){
								arr.add(voex[i]);
							}
							
							context.setAttribute("arregloDest",arr);
						}						
					} catch (RemoteException e) {
						error = true;
						msgError = "Error de conexion (RMI)";
					}
				} catch (MalformedURLException | RemoteException |NotBoundException e) {
					error = true;
					msgError = "Error de conexion (RMI)";
				}
					
	    }
	    	
		
        HttpSession session = req.getSession();
	    if (!error )
	    {		    
		    synchronized (session)
		    {
		        session.setAttribute("destino",destino);    
		    }		    
	    }else{
		    synchronized (session)
		    {
		        session.setAttribute("msgError",msgError);    
		    }	
	    }

		RequestDispatcher rd;
		if (!error)
			rd = req.getRequestDispatcher("listado_dest.jsp");
		else
			rd = req.getRequestDispatcher("error.jsp");
		rd.forward(req, resp);
	}

}
