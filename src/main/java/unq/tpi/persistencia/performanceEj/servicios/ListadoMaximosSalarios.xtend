package unq.tpi.persistencia.performanceEj.servicios

import java.util.Comparator
import unq.tpi.persistencia.performanceEj.daos.EmployeeDAO
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.performanceEj.objetosResultantes.ResultadosSalariosMaximo

class ListadoMaximosSalarios extends AbstractListado {

	new(String fileName) {
		super(fileName)
	}

	override def doListado() throws Exception {
		 
		val  empleados = new EmployeeDAO().getAllEmployeeWithName_Salary()
	
		addColumn("Nombre").addColumn("Sueldo").newLine()
		empleados.forEach[ e |
			addColumn(e.fullName).addColumn(e.amount).newLine()
		]
 
		 
	}
	
	
}
