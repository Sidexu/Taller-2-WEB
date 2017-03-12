package auxiliares;
import java.rmi.Remote;
import java.rmi.RemoteException;

import valueObjects.VOExcursionDisp;

public interface IFachada extends Remote{

	//REQUERIMIENTO 10
	public VOExcursionDisp[] excursionesXDestino(String destino) throws RemoteException;
	//REQUERIMIENTO 11
	public VOExcursionDisp[] excursionesXPrecio(float precio1, float precio2) throws RemoteException;
}
