# IT Service Request Management System — v2

Professional MVC Java web application for Apache Tomcat 10.1+.

### Features
- New service request form
- Server-side validation
- Request number generation
- Successful acknowledgement
- My Requests / All Requests page
- Knowledge Base page
- Help & Contact page
- Responsive professional UI

### Important
Requests are stored in application memory using ServletContext. They remain available while Tomcat is running and are cleared when the application/server restarts. For permanent storage, a database would be required.

### Run without Maven
Compile with:
javac --release 17 -cp "C:\apache-tomcat-10.1.59\lib\servlet-api.jar" -d "C:\apache-tomcat-10.1.59\webapps\ITServiceRequestMVC\WEB-INF\classes" src\main\java\com\itservice\model\ServiceRequest.java src\main\java\com\itservice\controller\ServiceRequestServlet.java


### PDF Export
The **My Requests** page includes a **Download All as PDF** button. The generated PDF contains every request currently stored in the running Tomcat session, including request number, employee details, category, priority, description, and exact submission date/time. No external PDF library or Maven is required.
