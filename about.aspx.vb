Public Class about
    Inherits System.Web.UI.Page
     
       

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Dim s As String = Request.PhysicalApplicationPath + "Everest_clien\ssm.exe"
        Response.ContentType = "APPLICATION/OCTET-STREAM"
        Dim Header As [String] = "Attachment; Filename= " + "ssm.exe"
        Response.AppendHeader("Content-Disposition", Header)
        ' Dim Dfile As New System.IO.FileInfo(Server.MapPath("Excel\test" + Session("Tendangnhap").ToString + ".xlsx"))
        Dim Dfile As New System.IO.FileInfo(s)
        Response.WriteFile(Dfile.FullName)
        'Don't forget to add the following line
        Response.[End]()
    End Sub

    
    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Dim s As String = Request.PhysicalApplicationPath + "Everest_clien\dotnet3.5.exe"
        Response.ContentType = "APPLICATION/OCTET-STREAM"
        Dim Header As [String] = "Attachment; Filename= " + "ssm.exe"
        Response.AppendHeader("Content-Disposition", Header)
        ' Dim Dfile As New System.IO.FileInfo(Server.MapPath("Excel\test" + Session("Tendangnhap").ToString + ".xlsx"))
        Dim Dfile As New System.IO.FileInfo(s)
        Response.WriteFile(Dfile.FullName)
        'Don't forget to add the following line
        Response.[End]()
    End Sub
End Class