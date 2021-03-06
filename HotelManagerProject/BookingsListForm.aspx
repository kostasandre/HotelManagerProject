﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingsListForm.aspx.cs" Inherits="HotelManagerProject.BookingsListForm" %>

<%@ Import Namespace="System.Web.DynamicData" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Web.UI.WebControls.Expressions" %>
<%@ Import Namespace="System.Web.UI.WebControls.WebParts" %>
<%@ Import Namespace="DevExpress.Web" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function ShowLoginWindow() {
            createBookingPopUp.Show();

        }

        function EndCallback(s, e) {
            if (s.cp_text !== undefined) {
                statusComboBox.SetText(s.cp_text);
                commentsTextBox.SetText(s.cp_text1);
                dateFromTextBox.SetText(s.cp_text2);
                dateToTextBox.SetText(s.cp_text3);
                systemPriceTextBox.SetText(s.cp_text4);
                agreedPriceTextBox.SetText(s.cp_text5);
                iDtextBox.SetText(s.cp_text8);
                codeTextBox.SetText(s.cp_text9);
                nameTextBox.SetText(s.cp_text10);
                surnameTextBox.SetText(s.cp_text11);
                iDtextBox.visible = 'false';


            }
        }
    </script>

    <div class="container" style="width: 100%">
        <div class="row">
            <div class="col-lg-1 col-sm-2 col-md-2 col-xs-4">
                <dx:ASPxButton OnClick="createBookingButton_OnClick" ID="createBookingButton" CssClass="button" ToolTip="Creates a new Booking" ForeColor="AquaMarine" Theme="BlackGlass" runat="server" Text="Create Booking" />
            </div>
            <div class="col-lg-1 col-md-2 col-sm-2 col-xs-4">
                <dx:ASPxButton OnClick="deleteBookingButton_OnClick" ID="deleteBookingButton" runat="server" CssClass="button" ToolTip="Deletes the selected Booking" ForeColor="AquaMarine" Theme="BlackGlass" Text="Delete Booking" />
            </div>



            <div class="col-lg-10 col-md-8 col-sm-8 col-xs-12">
                <div class="MainForm" style="width: 1400px">
                    <a style="font-size: 20px; color: black; font-weight: bold">Booking List</a>
                    <dx:ASPxGridView OnCustomButtonCallback="bookingsGridView_OnCustomButtonCallback" ID="bookingsGridView" runat="server" Theme="BlackGlass" AutoGenerateColumns="False" KeyFieldName="Id" ClientIDMode="Static">


                        <Settings ShowFilterRow="True" ShowGroupPanel="True"></Settings>
                        <SettingsDataSecurity AllowInsert="False" AllowDelete="False" AllowEdit="False"></SettingsDataSecurity>
                        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
                        <ClientSideEvents EndCallback="EndCallback" CustomButtonClick="function(s, e) {
                            e.processOnServer = true;
                            ShowLoginWindow(e.visibleIndex);
                            }" />

                        <Columns>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="1" SelectAllCheckboxMode="Page" ShowSelectCheckbox="True">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="2" ButtonRenderMode="Image">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="editButton">
                                        <Image Url="Images/edit.png" Width="35px" ToolTip="Edit"></Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Customer.Name" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Customer.Surname" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Room.Code" VisibleIndex="7" Caption="Room">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="From" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="To" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SystemPrice" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AgreedPrice" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Created" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
    </div>


    <dx:ASPxPopupControl ClientInstanceName="createBookingPopUp" Width="330px" Height="250px" Modal="True"
        MaxWidth="800px" MaxHeight="800px" MinHeight="150px" MinWidth="150px" ID="createBookingPopUp"
        PopupElementID="imgButton" HeaderText="Booking Details"
        runat="server" EnableViewState="false" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" EnableHierarchyRecreation="True" AllowDragging="True" Theme="BlackGlass">
        <ClientSideEvents EndCallback="EndCallback" PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup');}" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <label>Status : </label>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="statusComboBox" ClientIDMode="Static" runat="server" Width="170px" Theme="BlackGlass" EnableTheming="True">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Name:
                                </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="nameTextBox" runat="server" Width="170px" ClientIDMode="Static" ReadOnly=True>
                                    <ReadOnlyStyle BackColor="#999999">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Surname:
                                </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="surnameTextBox" runat="server" Width="170px" ClientIDMode="Static" ReadOnly=True>
                                    <ReadOnlyStyle BackColor="#999999">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Code:
                                </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="codeTextBox" runat="server" Width="170px" ClientIDMode="Static" ReadOnly=True>
                                    <ReadOnlyStyle BackColor="#999999">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Date From: </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ClientIDMode="Static" ID="dateFromTextBox" runat="server" Width="170px" ReadOnly=True>
                                    <ReadOnlyStyle BackColor="#999999">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Date To: </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ClientIDMode="Static" ID="dateToTextBox" runat="server" Width="170px" ReadOnly=True>
                                    <ReadOnlyStyle BackColor="#999999">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>System Price: </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="systemPriceTextBox" runat="server" Width="170px" ClientIDMode="Static" ReadOnly=True>
                                    <ReadOnlyStyle BackColor="#999999">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Agreed Price: </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ClientIDMode="Static" ID="agreedPriceTextBox" runat="server" Width="170px">
                                    <ClientSideEvents KeyDown="function(s, e) {
	if (!((e.htmlEvent.keyCode &gt;= 48 &amp;&amp; e.htmlEvent.keyCode &lt;= 57) || (e.htmlEvent.keyCode &gt;= 96&amp;&amp; e.htmlEvent.keyCode &lt;= 105) ||  (e.htmlEvent.keyCode == 188) || (e.htmlEvent.keyCode == 110) ||
           (e.htmlEvent.keyCode == 8 || e.htmlEvent.keyCode == 46 || e.htmlEvent.keyCode == 37 || 
            e.htmlEvent.keyCode == 39))) 
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); 
}"></ClientSideEvents>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Comments:
                                </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="commentsTextBox" runat="server" Width="170px" ClientIDMode="Static"></dx:ASPxTextBox>
                            </td>
                        </tr>

                        <tr>
                            <dx:ASPxTextBox CssClass="hidden" ClientIDMode="Static" ID="iDtextBox" runat="server" Width="170px"></dx:ASPxTextBox>

                        </tr>
                    </table>
                    <br />
                    <div class="pcmButton">
                        <dx:ASPxButton OnClick="Save_OnClick" ID="Save" runat="server" Text="Save" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                            <ClientSideEvents Click="function(s, e) { if(ASPxClientEdit.ValidateGroup('entryGroup')) createBookingPopUp.Hide(); }" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="btCancel" runat="server" Text="Cancel" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                            <ClientSideEvents Click="function(s, e) { createBookingPopUp.Hide(); }" />
                        </dx:ASPxButton>
                    </div>
                </asp:Panel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
