<%@page import="com.psddev.crosslinker.db.*"%>

    <%

    Object content = request.getAttribute("content");
    CrosslinkOperation.Static.evaluateWithCache((Crosslinkable) content);

    %>