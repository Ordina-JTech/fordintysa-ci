package nl.fordintysa;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ResourceReader {

	public static List<String> readAll(String fileName) {
		List<String> result = new ArrayList<>();
		try {
			InputStream stream = ResourceReader.class.getResourceAsStream("/" +fileName);
			InputStreamReader reader = new InputStreamReader(stream);
			BufferedReader buffered = new BufferedReader(reader);
			while (buffered.ready()) {
				result.add(buffered.readLine());
			}
			reader.close();
		} catch (IOException e) {
		}
		return result;
	}
}
