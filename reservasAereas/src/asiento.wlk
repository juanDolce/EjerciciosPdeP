class Asiento{
	
	var property numeroFila
	var property numeroColumna
	var property esPasillo 
	var property esVentanilla 
	
	method cumpleCondicion(unaCondicion){
		return unaCondicion.apply(self)
	}
}