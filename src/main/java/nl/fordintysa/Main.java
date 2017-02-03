package nl.fordintysa;

public class Main {

	public static void main(String[] args) {
        System.out.println("Hello " + getName(args) + "!");
    }

    public static String getName(String[] args) {
        String result = "Fordintysa";
        if (args != null && args.length > 0) {
            result = args[0];
        }
        return result;
    }

}
