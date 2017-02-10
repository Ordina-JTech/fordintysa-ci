package nl.fordintysa;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Simple servlet implementation
 */
@WebServlet(description = "AppServlet", urlPatterns = { "/app" })
public class AppServlet extends HttpServlet {

	private static final long serialVersionUID = -6153259490501984924L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.renderPage(req, resp);
	}

	private void renderPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		renderFromResource(out, "head.htf");
		renderFromResource(out, "bodytop.htf");
		for (String line: ResourceReader.readAll("wishlist.txt")) {
			out.println("<li>" + line + "</li>");
		}
		renderFromResource(out, "bodybtm.htf");
		out.println("</html>");
	}
	
	private void renderFromResource(PrintWriter out, String id) {
		for (String line: ResourceReader.readAll(id)) {
			out.println(line);
		}
	}
}
