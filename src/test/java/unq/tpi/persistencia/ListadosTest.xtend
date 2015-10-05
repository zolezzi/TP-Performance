package unq.tpi.persistencia;

import org.junit.Test
import unq.tpi.persistencia.performanceEj.servicios.ListadoDeptos
import unq.tpi.persistencia.performanceEj.servicios.ListadoDetalleEmpleado
import unq.tpi.persistencia.performanceEj.servicios.ListadoMaximosSalarios
import unq.tpi.persistencia.performanceEj.servicios.ListadoPagosPorDepto

class ListadosTest {
	
	@Test
	def void testListadoPagosPorDepto() {
		new ListadoPagosPorDepto("d007").generarListado();
	}
	
	@Test
	def void testListadoDeptos(){
		new ListadoDeptos().generarListado();
	}
	
	@Test
	def void testListadoMaximosSalarios() {
		new ListadoMaximosSalarios().generarListado();
	}
	
	@Test
	def void testDetalleEmpleado() {
		new ListadoDetalleEmpleado(10010).generarListado();
		new ListadoDetalleEmpleado(10019).generarListado();
	}
}
