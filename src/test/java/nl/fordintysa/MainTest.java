package nl.fordintysa;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class MainTest {

    @Test
    public void testGetNameNullArgs() {
        String[] args = null;
        genericTest(args, "Fordintysa");
    }
    
    //@Test
    public void testGetNameNoArgs() {
        String[] args = {};
        genericTest(args, "Fordintysa");
    }
    
    @Test
    public void testGetNameOneArg() {
        String[] args = {"FooBar"};
        genericTest(args, "FooBar");
    }
    
//    @Test
//    public void testGetNameMoreArgs() {
//        String args = {"Foo", "Bar", "Code"};
//        genericTest(args, "Foo");
//    }
    
    private void genericTest(String[] args, String expected) {
        String result = Main.getName(args);
        assertEquals(result, expected);
    }

}
