package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}
	
	def getAllByNameTitleAndSalaryMount(String num){
		val session = SessionManager.getSession()
		val q = session.createQuery
			("select department

			  from Department as department

			  join fetch department.employees as employees

              join fetch employees.salaries as salary

			  join fetch employees.titles as title

			  where department.code = :num 
					AND
			  		salary.to = '9999-01-01'")

		q.setParameter("num", num);
		q.uniqueResult as Department
	}
}