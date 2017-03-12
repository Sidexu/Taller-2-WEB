package valueObjects;

public class MensajePrecio {
	private String precio1;
	private String precio2;
	
	public MensajePrecio() {
	}
	public MensajePrecio(String precio1, String precio2) {
		super();
		this.precio1 = precio1;
		this.precio2 = precio2;
	}
	public String getPrecio1() {
		return precio1;
	}
	public void setPrecio1(String precio1) {
		this.precio1 = precio1;
	}
	public String getPrecio2() {
		return precio2;
	}
	public void setPrecio2(String precio2) {
		this.precio2 = precio2;
	}
	
	
}
