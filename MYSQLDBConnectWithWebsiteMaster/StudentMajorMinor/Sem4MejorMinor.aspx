<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sem4MejorMinor.aspx.cs" Inherits="MYSQLDBConnectWithWebsiteMaster.StudentMajorMinor.Sem4MejorMinor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-row">
        <div class="form-group col-md-6">
            <div class="form-group col-md-12">
                <label for="fname">Roll No. </label>
                <asp:Label ID="lblrollno" runat="server"></asp:Label>
            </div>
            <div class="form-group col-md-12">
                <label for="fname">Name</label>
                <asp:Label ID="lblname" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-group col-md-6">
            <div class="form-group col-md-12">
                <label for="fname">Batch</label>
                <asp:Label ID="lblbatch" runat="server"></asp:Label>
            </div>
            <div class="form-group col-md-12">
                <label for="fname">Course</label>
                <asp:Label ID="lblcourse" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="fname">Select Major</label>
            <asp:RadioButtonList ID="majorRadioList" runat="server" OnSelectedIndexChanged="ShowMinor" AutoPostBack="true">
                <asp:ListItem Value="1">DataScience</asp:ListItem>
                <asp:ListItem Value="2">Finance</asp:ListItem>
                <asp:ListItem Value="3">HR ( People Development)</asp:ListItem>
                <asp:ListItem Value="4">Marketing</asp:ListItem>
                <asp:ListItem Value="5">Operations</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group col-md-6">
            <label for="lname">Select Minor</label>
            <asp:RadioButtonList ID="minorRadioList" runat="server" Enabled="false" OnSelectedIndexChanged="minorRadioList_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="1">DataScience</asp:ListItem>
                <asp:ListItem Value="2">Finance</asp:ListItem>
                <asp:ListItem Value="3">HR ( People Development)</asp:ListItem>
                <asp:ListItem Value="4">Marketing</asp:ListItem>
                <asp:ListItem Value="5">Operations</asp:ListItem>
                <asp:ListItem Value="6">Business Economics</asp:ListItem>
                <asp:ListItem Value="7">Strategy & Consulting </asp:ListItem>
                <asp:ListItem Value="8">Business Analytics </asp:ListItem>
                <asp:ListItem Value="9">Sustainability</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>

    <asp:Button class="btn btn-primary" ID="submitbtn" OnClick="Button1_Click" runat="server" Text="Show" />
    <asp:Button class="btn btn-primary" ID="Button1" OnClick="Reset_Click" runat="server" Text="Reset" CausesValidation="False" />
    <asp:Label ID="Validationlbl" runat="server" ForeColor="Red"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="majorRadioList" Display="Dynamic" ErrorMessage="Please Select Major" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="minorRadioList" Display="Dynamic" ErrorMessage="Please Select Minor" ForeColor="Red"></asp:RequiredFieldValidator>

    <div id="ShowSemesterMajorMinorSubjects" runat="server">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#Semester4">Sem 4</a></li>
            <li><a data-toggle="tab" href="#Semester5">Sem 5</a></li>
            <li><a data-toggle="tab" href="#Semester6">Sem 6</a></li>
        </ul>

        <div class="tab-content">
            <div id="Semester4" class="tab-pane fade in active">
                <h3>Semester 4</h3>

                <div id="Sem4table">
                    <div class="form-row">
                        <div class="form-group col-lg-12">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="710px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Type" HeaderText="Major/Minor" />
                                    <asp:BoundField DataField="Special" HeaderText="Special" />
                                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" ReadOnly="true" InsertVisible="False" />
                                    <asp:BoundField DataField="Hours" HeaderText="Hours" />
                                    <asp:BoundField DataField="Marks" HeaderText="Marks" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Semester5" class="tab-pane fade">
                <h3>Semester 5</h3>
                <div class="form-row">
                    <div class="form-group col-lg-12">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="710px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="Major/Minor" />
                                <asp:BoundField DataField="Special" HeaderText="Special" />
                                <asp:BoundField DataField="CourseName" HeaderText="Course Name" ReadOnly="true" InsertVisible="False" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" />
                                <asp:BoundField DataField="Marks" HeaderText="Marks" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div id="Semester6" class="tab-pane fade">
                <h3>Semester6 </h3>
                <div class="form-row">
                    <div class="form-group col-lg-12">
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="710px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="Major/Minor" />
                                <asp:BoundField DataField="Special" HeaderText="Special" />
                                <asp:BoundField DataField="CourseName" HeaderText="Course Name" ReadOnly="true" InsertVisible="False" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" />
                                <asp:BoundField DataField="Marks" HeaderText="Marks" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <%--<asp:Button class="btn btn-primary" data-toggle="modal" data-target="#confirmMajorMinorModal"  runat="server" Text="Submit" />--%>
        <button id="btnsubmitmajorminor" type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirmMajorMinorModal" runat="server">Submit</button>
    </div>

    <div class="modal fade" id="confirmMajorMinorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirm Your details </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table style="width: 100%;">
                        <tr>
                            <td><label for="fname">Roll No. </label>  </td>
                            <td><asp:Label ID="lblmodalrollno" runat="server"></asp:Label></td>
                            <td><label for="fname">Name </label></td>
                            <td><asp:Label ID="lblmodalname" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="fname">Batch </label></td>
                            <td><asp:Label ID="lblmodalbatch" runat="server"></asp:Label></td>
                            <td><label for="fname">Course </label></td>
                            <td><asp:Label ID="lblmodalcourse" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="fname">Email Id </label></td>
                            <td><asp:Label ID="lblmodalemail" runat="server"></asp:Label></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><label for="fname">Major </label></td>
                            <td><asp:Label ID="lblmodalmajor" runat="server"></asp:Label></td>
                            <td><label for="fname">Minor </label></td>
                            <td><asp:Label ID="lblmodalminor" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" type="button" class="btn btn-secondary" data-dismiss="modal" Text="Cancel/Edit" />
                    <asp:Button runat="server" type="button" class="btn btn-primary" Text="Save changes" OnClick="modal_show_button_click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
