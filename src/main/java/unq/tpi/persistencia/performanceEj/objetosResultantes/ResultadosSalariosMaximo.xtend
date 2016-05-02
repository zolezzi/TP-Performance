package unq.tpi.persistencia.performanceEj.objetosResultantes

import org.eclipse.xtend.lib.annotations.Accessors
import unq.tpi.persistencia.performanceEj.model.Salary
import java.util.List

@Accessors
class ResultadosSalariosMaximo {
	
	String firstName
	String lastName
	Double amount
	
	new(){}


	def String getFullName() {
		lastName + ", " + firstName
	}
}