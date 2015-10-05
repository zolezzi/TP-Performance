package unq.tpi.persistencia.performanceEj.servicios

import java.io.FileReader
import java.io.LineNumberReader
import org.junit.Assert

abstract class BaseListadoTest {
	
	def void assertListadoLength(int lines, String fileName) {
		val reader = new LineNumberReader(new FileReader(fileName))
		try {
			reader.skip(Long.MAX_VALUE)
			Assert.assertEquals("Incorrecta cantidad de lineas", lines, reader.lineNumber + 1)
		} finally {
			reader.close()
		}
	}

}
