class Vuelo{
	
	var asientosDisponibles = []
	var asientosReservados = []
	var menues = []
	var mailsReserva = []
	
	method cantidadAsientosDisponibles(){
		return asientosDisponibles.size()
	}
	
	method cantidadAsientosPasilloDisponible(){
		return asientosDisponibles.count({unAsiento => unAsiento.esPasillo()})
	}
	
	method cantidadAsientosVentanillaDisponible(){
		return asientosDisponibles.count({unAsiento => unAsiento.esVentanilla()})
	}
	
	method reservarAsientos(unaCantidadPasillo, unaCantidadVentanilla, condicion, unMenu, unMail){
		self.reservarPasillo(unaCantidadPasillo, condicion)
		self.reservarVentanilla(unaCantidadVentanilla, condicion)
		menues.add(unMenu)
		mailsReserva.add(unMail)
		
	}
	
	method reservarPasillo(unaCantidadPasillo, condicion){
		unaCantidadPasillo.times({unAsiento => self.removerAsientoQueCumplePasilloYCondicion(unAsiento, condicion)})
	}
	
	method removerAsientoQueCumplePasilloYCondicion(unAsiento, condicion){
		if(unAsiento.esPasillo() && unAsiento.cumpleCondicion(condicion)){
			asientosDisponibles.remove(unAsiento)
			asientosReservados.add(unAsiento)
		}	
	}
	
	method reservarVentanilla(unaCantidadVentanilla, condicion){
		unaCantidadVentanilla.times({unAsiento => self.removerAsientoQueCumpleVentanillaYCondicion(unAsiento, condicion)})
	}
	
	method removerAsientoQueCumpleVentanillaYCondicion(unAsiento, condicion){
		if(unAsiento.esVentanilla() && unAsiento.cumpleCondicion(condicion)){
			asientosDisponibles.remove(unAsiento)
			asientosReservados.add(unAsiento)
		}	
	}
	
	method puedeRealizarReserva(unaCantidadPasillo, unaCantidadVentanilla){
		return unaCantidadPasillo <= self.cantidadAsientosPasilloDisponible() && 
				unaCantidadVentanilla <= self.cantidadAsientosVentanillaDisponible()
	}
	
	method asientosReservados(){
		return asientosReservados
	}
	
	method asientosDisponibles(){
		return asientosDisponibles
	}
	
	method filaLlena(unaFila){
		return asientosDisponibles.any({unAsiento => unAsiento.numeroFila() == unaFila})
	}
	
	method filasConAlgunAsientoLibre(){
		return asientosDisponibles.map({unAsiento => unAsiento.numeroFila()}).filter({unaFila => !self.filaLlena(unaFila)})
	}
	
	method cantidadDeMenuesDeTipo(unTipo){
		menues.count({unMenu => unMenu == unTipo})
	}
	
	method mailQueReservaron(){
		return mailsReserva
	}
}