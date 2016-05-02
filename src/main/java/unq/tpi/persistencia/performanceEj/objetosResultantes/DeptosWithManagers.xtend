package unq.tpi.persistencia.performanceEj.objetosResultantes

import unq.tpi.persistencia.performanceEj.model.Employee
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DeptosWithManagers {
	String code
	String name
	Employee manager

	}
