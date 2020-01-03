﻿Public Class Du_lieu_goc_nhap
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim today As DateTime = DateTime.Now
        'current date
        Dim firstDay As DateTime = today.AddDays(-(today.Day - 1))
        'first day
        today = today.AddMonths(1)
        Dim lastDay As DateTime = today.AddDays(-(today.Day))

        If datest.Value = Nothing Then
            datest.Value = firstDay
        End If
        If dateen.Value = Nothing Then
            dateen.Date = Date.Now
        End If

    End Sub

    Protected Sub Sqlnhap_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles Sqlnhap.Selecting
        e.Command.CommandTimeout = 444
    End Sub
    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()

    End Sub
End Class