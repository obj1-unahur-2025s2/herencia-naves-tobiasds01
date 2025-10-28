class Nave {
  var velocidad = 0
  var direccionRespectoAlSol = 0

  method velocidad() = velocidad
  method direccionRespectoAlSol() = direccionRespectoAlSol

  method acelerar(cuanto) {
    velocidad = (velocidad + cuanto).min(100000)
    // velocidad += cuanto.min(100000)
  }

  method desacelerar(cuanto) {
    velocidad = (velocidad - cuanto).max(0)
  }

  method irAlSol() {
    direccionRespectoAlSol = 10
  }

  method escaparDelSol() {
    direccionRespectoAlSol = -10
  }

  method ponerseParaleloAlSol() {
    direccionRespectoAlSol = 0
  }

  method acercarseUnPocoAlSol() {
    direccionRespectoAlSol = (direccionRespectoAlSol + 1).min(10)
  }

  method alejarseUnPocoDelSol() {
    direccionRespectoAlSol = (direccionRespectoAlSol - 1).max(-10)
  }

  method prepararViaje()

  method superAcelerar(cuanto) { // extra
    if(!cuanto.between(0, 50000)) {
      throw new Exception(message="El valor debe estar entre el 0 y el 50.000")
    }
    self.acelerar(cuanto * 2)
  }
}

class NaveBaliza inherits Nave {
  var color

  method cambiarColorDeBaliza(colorNuevo) {
    color = colorNuevo
  }

  method color() = color

  override method prepararViaje() {
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
  }
}

class NavePasajeros inherits Nave {
  var property cantidadDePasajeros
  var comida
  var bebida

  method comida() = comida
  method bebida() = bebida

  method cargarComida(cantidad) {
    comida += cantidad
  }

  method descargarComida(cantidad) {
    comida = (comida - cantidad).max(0)
  }

  method cargarBebida(cantidad) {
    bebida += cantidad
  }

  method descargarBebida(cantidad) {
    bebida = (bebida - cantidad).max(0)
  }

  override method prepararViaje() {
    self.cargarComida(4 * cantidadDePasajeros)
    self.cargarBebida(6 * cantidadDePasajeros)
    self.acercarseUnPocoAlSol()
  }
}

class NaveDeCombate inherits Nave {
  var estaInvisible = false
  var misilesDesplegados = false
  const property mensajesEmitidos = []

  method ponerseVisible() {
    estaInvisible = false
  }

  method ponerseInvisible() {
    estaInvisible = true
  }

  method estaInvisible() = estaInvisible

  method desplegarMisiles() {
    misilesDesplegados = true
  }

  method replegarMisiles() {
    misilesDesplegados = false
  }

  method misilesDesplegados() = misilesDesplegados

  method emitirMensaje(mensaje) {
    mensajesEmitidos.add(mensaje)
  }

  method primerMensajeEmitido() = mensajesEmitidos.first()

  method ultimoMensajeEmitido() = mensajesEmitidos.last()

  method esEscueta() = !mensajesEmitidos.any({unMensaje => unMensaje.length() > 30}) // o también: mensajesEmitidos.all({unMensaje => unMensaje.length() <= 30})

  method emitioMensaje(mensaje) = mensajesEmitidos.contains(mensaje)

  override method prepararViaje() {
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en misión")
  }
}