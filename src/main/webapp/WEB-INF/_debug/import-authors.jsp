<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="
    org.apache.commons.fileupload.servlet.ServletFileUpload,
    java.util.*,
    java.io.*,
    com.psddev.brightspot.*,
    com.psddev.brightspot.utils.AuthorImporter
"%>
<%

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (isMultipart) {
    DiskFileUpload fu = new DiskFileUpload();

    List fileItems = fu.parseRequest(request);
    Iterator itr = fileItems.iterator();

    while(itr.hasNext()) {
        FileItem fi = (FileItem)itr.next();
        if(!fi.isFormField()) {
            AuthorImporter importer = 
                    new AuthorImporter(fi.getInputStream());
            importer.start();
        }
    }
}

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Author Ingestion Task</title>
        <link href="/static/css/bootstrap.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <div class="page-header">
                <h2>Author Ingestion Task</h2>
            </div>
            <div class="well">
            <h5>Upload a .csv file with your authors</h5>
                <form class="form-horizontal" method="post" enctype="multipart/form-data">

                    <div class="control-group">
                        <label class="control-label" for="data">File</label><br>
                        <div class="controls">
                            <input type="file" name="data" />
                        </div>
                    </div>
                    <br><br>
                    <div class="control-group">
                        <div class="controls">
                        <input type="submit" class="btn btn-primary" name="action" value="Import">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>