package servlets;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import valueObjects.MensajeDest;
import valueObjects.VOExcursionDisp;
import Excepciones.ExcepcionRMI;
import auxiliares.IFachada;

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
	    }else{
	    	ServletContext context = super.getServletContext();
		    String ipservidor = super.getInitParameter("ipservidor");
			String puerto = super.getInitParameter("puerto"); 

			IFachada ifach = null;		


				try {
					ifach = (IFachada) Naming.lookup("//" + ipservidor + ":" + puerto + "/obj");
					try {
						voex = ifach.excursionesXDestino(destino);
						context.setAttribute("arregloDest",voex);
					} catch (RemoteException e) {
						msgError = "Error RMI";
					}
				} catch (MalformedURLException | RemoteException | NotBoundException e) {
					msgError = "Error RMI";
				}
					
	    }
	    	
		
        HttpSession session = req.getSession();
	    MensajeDest datosDest = new MensajeDest(destino);
	    if (!error || voex.length!=0)
	    {		    
		    synchronized (session)
		    {
		        session.setAttribute("datosDest",datosDest);    
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
