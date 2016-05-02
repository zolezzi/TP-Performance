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
		session.createQuery("select employee.firstName as firstName, employee.lastName as lastName, salary.amount as amount 
								from Employee as employee 
								join employee.salaries as salary
								where salary.to = '9999-01-01' 
								order by salary.amount desc
								")
								.setResultTransformer(Transformers.aliasToBean(ResultadosSalariosMaximo))
								.setMaxResults(10).list() as List<ResultadosSalariosMaximo>;
	}

}
