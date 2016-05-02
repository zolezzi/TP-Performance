package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager
import org.hibernate.transform.Transformers
import unq.tpi.persistencia.performanceEj.objetosResultantes.ResultadosSalariosMaximo

class EmployeeDAO {

	def getByName(String name, String lastName) {
		val session = SessionManager.getSession()
		session.createQuery("from Employee where firstName = :name and lastName = :lastName")
				.setParameter("name", name)
				.setParameter("lastName", lastName)
				.uniqueResult() as Employee
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Employee).list() as List<Employee>
	}

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.load(Employee, id) as Employee
	}
	
	def getAllEmployeeWithName_Salary(){
		val session = SessionManager.getSession()
		session.createQuery("select employee.firstName, employee.lastName, max(employee.salaries)[0] from Employee as employee").setResultTransformer(Transformers.aliasToBean(ResultadosSalariosMaximo)).list() as List<ResultadosSalariosMaximo>;
	}

}
