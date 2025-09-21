package entidades;

public class Seguros {
	
	private int idSeguros;
	private String descripcion;
	private int idTipo;
	private double costoContratacion;
	private double costoAsegurado;
	
	public Seguros() {
		
	}

	public int getIdSeguros() {
		return idSeguros;
	}

	public void setIdSeguros(int idSeguros) {
		this.idSeguros = idSeguros;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
		
	}

	public int getIdTipo() {
		return idTipo;
	}

	public void setIdTipo(int idTipo) {
		this.idTipo = idTipo;
	}

	public double getCostoContratacion() {
		return costoContratacion;
	}

	public void setCostoContratacion(double costoContratacion) {
		this.costoContratacion = costoContratacion;
	}
	
	public double getCostoAsegurado() {
		return costoAsegurado;
	}

	public void setCostoAsegurado(double costoAsegurado) {
		this.costoAsegurado = costoAsegurado;
	}

	@Override
	public String toString() {
		return "Seguros [idSeguros=" + idSeguros + ", descripcion=" + descripcion + ", idTipo=" + idTipo
				+ ", costoContratacion=" + costoContratacion + "]";
	}
	

}