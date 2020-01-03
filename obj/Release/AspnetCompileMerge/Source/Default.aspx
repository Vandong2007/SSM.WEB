<%@ Page Title =" Doanh số bán ra " Culture="en-US"  Language="VB" AutoEventWireup="true" MasterPageFile="~/homes.master" CodeBehind="Default.aspx.vb" Inherits="WEB.SSM._Default" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <%--bản đồ--%>
  <%--  <script type='text/javascript' src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
   <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type='text/javascript'>
        google.load('visualization', '1', {
            'packages': ['geochart']
        });
        google.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            
            jQuery.ajax({
                type: "POST",
                url: "Default.aspx/GetChartData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'State');
                    data.addColumn('number', 'Value');
                 
                    for (var i = 0; i < r.d.length; i++) {
                       
                            var employeeId = r.d[i][0].toString();
                            var employeeName = parseFloat( r.d[i][1] );
                            
                            data.addRows([[employeeId, { v: employeeName, f: employeeName.toFixed(0) }]]);
                        
                    }

                    var opts = {
                        region: 'VN',
                        displayMode: 'regions',
                        resolution: 'provinces',
                        colorAxis: { colors: ['#e7711c', '#4374e0'] }
                    };
                    var geochart = new google.visualization.GeoChart(
                      document.getElementById('visualization'));
                    geochart.draw(data, opts);
                    //var chart = new google.visualization.OrgChart($("#chart")[0]);
                    //chart.draw(data, { allowHtml: true });
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
            
        };
          </script> --%>
    <%--    <ClientSideEvents Init="function(s, e) {
	dateEd.GetCalendar().SetVisibleDate(new Date());}" />--%>
    <div>
         
				<%--<hr>--%>
				<%--<ul class="breadcrumb">--%>
				 
				
			 
				<%--<hr>--%>
		   
        <table style="width:100%;border-collapse:initial" cellpadding="0" cellspacing="0">
   
	 
            <tr>
                <td style="width: 200px; text-align: Left;"> Doanh số bán ra</td>
                <td style="width: 98px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px" EditFormat="Custom"  >
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right; width: 108px;"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100px" >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
               
            </tr>
        
               </table>
     <hr>
        <div id="visualization" style="margin: 1em"> </div>
           </div>
           <div>
        <%--  <tr>
              </table>--%>
                <div>
             <table> <tr>
            <td style="width: 735px">
                <table >
                    <tr>
                        <td>
                            <table>
                                <tr >
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Chart Type:" />
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ChartType" runat="server" OnValueChanged="ChartType_ValueChanged"
                                            AutoPostBack="True" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <dx:ASPxCheckBox runat="server" Text="Show Column Grand Totals" AutoPostBack="True"
                                ID="ShowColumnGrandTotals" OnCheckedChanged="ShowColumnGrandTotals_CheckedChanged"
                                Wrap="False" />
                        </td>
                        <td>
                            <dx:ASPxCheckBox runat="server" Text="Generate Series from Columns" AutoPostBack="True"
                                ID="ChartDataVertical" OnCheckedChanged="ChartDataVertical_CheckedChanged" Wrap="False" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="PointLabels" runat="server" Text="Show Point Labels" OnCheckedChanged="PointLabels_CheckedChanged"
                                AutoPostBack="True" Wrap="False" />
                        </td>
                        <td>
                            <dx:ASPxCheckBox runat="server" Checked="True" Text="Show Row Grand Totals" AutoPostBack="True"
                                ID="ShowRowGrandTotals" OnCheckedChanged="ShowRowGrandTotals_CheckedChanged"
                                Wrap="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr></table>
               
                     <hr>
            <dx:WebChartControl ID="WebChart1" runat="server" DataSourceID="ASPxPivotGrid1" Height="400px" SeriesDataMember="Series" SideBySideEqualBarWidth="True" Width="1000px">
                <diagramserializable>
                    <dx:XYDiagram>
                        <axisx title-text="Region Area" visibleinpanesserializable="-1">
                            <range sidemarginsenabled="True" />
                        </axisx>
                        <axisy title-text="Doanh Số" visibleinpanesserializable="-1">
                            <range sidemarginsenabled="True" />
                        </axisy>
                    </dx:XYDiagram>
                </diagramserializable>
<FillStyle><OptionsSerializable>
<dx:SolidFillOptions></dx:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                <legend maxhorizontalpercentage="30"></legend>

<SeriesTemplate argumentdatamember="Arguments" argumentscaletype="Qualitative" valuedatamembersserializable="Values"><ViewSerializable>
    <dx:LineSeriesView>
    </dx:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <dx:PointSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <dx:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <dx:PointOptions>
            </dx:PointOptions>
        </pointoptionsserializable>
    </dx:PointSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<dx:PointOptions></dx:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

<CrosshairOptions><CommonLabelPositionSerializable>
<dx:CrosshairMousePosition></dx:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<dx:ToolTipMousePosition></dx:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
            </dx:WebChartControl>
                       
         
                      
        </div> 
               <table>
                   <tr>
                       <td>
                           Bảng tổng hợp doanh số bán ra 
                       </td>
 <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="116px" Height="23px" />
                   
                 </td>
                   </tr>
               </table>
          <hr>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" Width="100%" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="1" FieldName="MaNPP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="2" FieldName="TenNPP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" GroupIndex="0" InnerGroupIndex="0" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSubregion" AreaIndex="0" FieldName="Subregion">
                </dx:PivotGridField>
           
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhanSP" AreaIndex="0" FieldName="NhanSP" Area="ColumnArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldThanhtien" AreaIndex="0" FieldName="Thanhtien" RunningTotal="True" SortMode="Value" Area="DataArea"
                    CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption="Doanh Số"
                     >
                </dx:PivotGridField>
            </Fields>
            <OptionsChartDataSource ProvideColumnGrandTotals="True" ProvideColumnTotals="True" ProvideRowTotals="True" />
            <OptionsPager RowsPerPage="200">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup ShowNewValues="True" />
            </Groups>
        </dx:ASPxPivotGrid>
       
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetDoanhso" SelectCommandType="StoredProcedure">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                       <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                       <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
                   </SelectParameters>
               </asp:SqlDataSource>
       
        <%--    </tr>
         <tr>
            <td>
                
            </td>
        </tr>
         </table>--%><%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>
         </div>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
</asp:Content>