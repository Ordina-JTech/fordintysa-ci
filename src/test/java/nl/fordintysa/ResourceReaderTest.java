package nl.fordintysa;

import java.util.List;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class ResourceReaderTest {

	@Test
	public void testReadResource() {
		List<String> text = ResourceReader.readAll("testResource1.txt");
		assertEquals(4, text.size());
		assertEquals("First line", text.get(0));
		assertEquals("Second", text.get(1));
		assertEquals("", text.get(2));
		assertEquals("Fourth (third is empty)", text.get(3));
	}
}
