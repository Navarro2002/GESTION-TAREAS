<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Home.HomeForm" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
     
<head runat="server">
    <link href="<%= ResolveUrl("~/Content/styles.css")  %>"" rel="stylesheet" type="text/css" />
    <title>Inicio - Sistema de Gestión de Proyectos</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 1171px;
            height: 434px;
        }
        .auto-style2 {
            width: 389px;
        }
        .auto-style3 {
            width: 582px;
        }
    </style>
</head>
<body>
    <div class="dashboard">
    <form id="form1" runat="server">
        <h1>Bienvenido, <asp:Label ID="lblUsuario" runat="server" >User</asp:Label>
        </h1>
        <h2>Resumen</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <h3>Proyectos</h3>
                                        <asp:Button ID="btnLogout" runat="server" Text="Cerrar sesión" OnClick="btnLogout_Click" />

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT 
    p.id_proyecto,
    p.nombre AS nombre_proyecto,
    p.descripcion,
    p.fecha_inicio,
    p.fecha_fin,
    e.nombre AS estado
FROM 
    proyectos p
INNER JOIN 
    estados_tareas e ON p.id_estado = e.id_estado
INNER JOIN 
    usuarios_proyectos up ON p.id_proyecto = up.id_proyecto
WHERE 
    up.id_usuario = @IdUsuario  -- Filtra por usuario
ORDER BY 
    p.id_proyecto;">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="IdUsuario" SessionField="IdUsuario" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="gvProyectos" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvProyectos_SelectedIndexChanged" DataKeyNames="id_proyecto" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="nombre_proyecto" HeaderText="nombre_proyecto" SortExpression="nombre_proyecto" />
                            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                            <asp:BoundField DataField="fecha_inicio" HeaderText="fecha_inicio" SortExpression="fecha_inicio" />
                            <asp:BoundField DataField="fecha_fin" HeaderText="fecha_fin" SortExpression="fecha_fin" />
                            <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
                <td class="auto-style2">
                    <h3>Tareas asignadas</h3>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT 
    t.id_tarea,
    t.titulo AS tarea,
    t.descripcion,
    t.fecha_creacion,
    t.fecha_limite,
    p.nombre AS proyecto,
    u.nombre AS usuario_asignado
FROM 
    tareas t
INNER JOIN 
    estados_tareas et ON t.id_estado = et.id_estado
INNER JOIN 
    proyectos p ON t.id_proyecto = p.id_proyecto
LEFT JOIN 
    usuarios_tareas ut ON t.id_tarea = ut.id_tarea
LEFT JOIN 
    usuarios u ON ut.id_usuario = u.id_usuario
WHERE 
    et.nombre = 'Pendiente'
    AND ut.id_usuario = @IdUsuario  -- Filtra por usuario específico
ORDER BY 
    t.fecha_limite;
">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="IdUsuario" SessionField="IdUsuario" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="gvTareas" runat="server" AutoGenerateColumns="False" DataKeyNames="id_tarea" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="tarea" HeaderText="tarea" SortExpression="tarea" />
                            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                            <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
                            <asp:BoundField DataField="fecha_limite" HeaderText="fecha_limite" SortExpression="fecha_limite" />
                            <asp:BoundField DataField="proyecto" HeaderText="proyecto" SortExpression="proyecto" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
                 <td>
                 <div class="Gestiones">
                    <h3>Administración</h3>
                     <p>
                         <asp:Button ID="btnUsuario" CssClass="btn" runat="server" Text="Crear Usuario" OnClick="btnUsuario_Click" Width="150px" />
                     </p>
                     <p>
                         <asp:Button ID="btnTarea" runat="server" CssClass="btn" Text="Crear Tarea" OnClick="btnTarea_Click" Width="153px" />
                     </p>
                     <p>
                         <asp:Button ID="btnProyectos" runat="server" CssClass="btn" Height="29px" Text="Administrar Proyectos" Width="165px" />
                     </p>
                     </div>
                 </td>
            </tr>
        </table>
        <hr />
     <table style="width:100%; border-collapse: collapse;">
    <tr>
        <!-- Gráfico ASP.NET Chart -->
        <td style="width:50%; text-align:center; vertical-align:top; padding:10px;">
            <h3>Cantidad de tareas</h3>
           <asp:Chart ID="graficaTareas" runat="server" DataSourceID="SqlDSTareas" Width="400px">
    <Series>
        <asp:Series ChartType="Doughnut" XValueMember="Estado" YValueMembers="TotalTareas" Name="Series1"></asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
    </ChartAreas>
    <Legends>
        <asp:Legend Name="Legend1" Docking="Bottom"></asp:Legend>
    </Legends>
</asp:Chart>
        </td>
    </tr>
</table>

    </form>
        </div>

    <p>
<asp:SqlDataSource ID="SqlDSTareas" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConexionSQL %>"
    SelectCommand="    
    SELECT 
    et.nombre AS Estado,
    COUNT(t.id_tarea) AS TotalTareas
FROM 
    usuarios_tareas ut
INNER JOIN 
    tareas t ON ut.id_tarea = t.id_tarea
INNER JOIN 
    estados_tareas et ON t.id_estado = et.id_estado
WHERE 
    ut.id_usuario = @idUsuario
GROUP BY 
    et.nombre;

">
    <SelectParameters>
        <asp:SessionParameter Name="idUsuario" SessionField="idUsuario" />
    </SelectParameters>
</asp:SqlDataSource>
    </p>

</body>
</html>
