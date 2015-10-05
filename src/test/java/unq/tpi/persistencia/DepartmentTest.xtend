package unq.tpi.persistencia;

import org.junit.Assert
import org.junit.Test
import unq.tpi.persistencia.performanceEj.daos.DepartmentDAO
import unq.tpi.persistencia.util.SessionManager

class DepartmentTest {

	@Test
	def void testFields() throws Exception {
		SessionManager.runInSession([
			val d = new DepartmentDAO().getByName("Finance");		
			Assert.assertNotNull(d);
			Assert.assertEquals("d002", d.code);
			Assert.assertEquals(12437, d.employees.length);
			Assert.assertEquals(4909, d.historicEmployees.length);
			return null;
		])
	}
}
