package valueObjects;

public class MensajeDest {
	private String destino;
	
	public MensajeDest(){
		
	}

	public MensajeDest(String destino) {
		super();
		this.destino = destino;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}
}
