package unq.tpi.persistencia.performanceEj.objetosResultantes

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadosSalariosMaximo {
	
	String firstName
	String lastName
	Double salaries
	
	
	def Double getSalary(){
		salaries
	}

	def String getFullName() {
		lastName + ", " + firstName
	}
}