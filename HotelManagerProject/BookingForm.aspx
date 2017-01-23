﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingForm.aspx.cs" Inherits="HotelManagerProject.BookingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function ShowLoginWindow() {
            createUserPopUp.Show();
        }

    </script>
    <div class="MainForm">
        
        <h1>Booking Form</h1>
        
        <div class="container" style="width: 100%">

                <div class="row">
                    <div style="height: 45px;" class="col-xs-4 col-sm-2 col-md-2 col-lg-1">
                         <label>Room Type:</label> 
                    </div>
                    <div class="col-xs-3 col-sm-1 col-md-2 col-lg-1">
                       <dx:ASPxComboBox ID="roomTypeComboBox" NullText="Select Room Type" runat="server" ValueField="Id" TextField="Code"  IncrementalFilteringMode= "None" DropDownStyle= "DropDownList">
                        </dx:ASPxComboBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-2 col-md-2 col-lg-1">
                         <label>Date From:</label> 
                    </div>
                    <div style="height: 45px;" class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
                        <dx:ASPxDateEdit AllowUserInput="False" ID= "dateFromCalendar" runat="server" AllowNull="False"></dx:ASPxDateEdit>
                    </div>

                    <div class="col-xs-4 col-sm-2 col-md-2 col-lg-1">
                        <label>Date To:</label> 
                    </div>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                        <dx:ASPxDateEdit AllowUserInput="False" ID= "dateToCalendar" runat="server" AllowNull="False"></dx:ASPxDateEdit>
                    </div>
                </div>
            <br/>
                <div class="row">
                        <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2">
                            <dx:ASPxButton OnClick="CalculateAvailableRoomsButton" ID= "calculateRoomTypePriceButton" runat="server" Text="Calculate Price" ToolTip="Calculates the price of the selected room"></dx:ASPxButton>  
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-3 col-lg-3">
                            <dx:ASPxTextBox ID= "roomTypePriceTextBox" runat="server" Width="170px" ReadOnly=True></dx:ASPxTextBox>
                        </div>
                    </div>
            <br/>
            <div class="row">
                        <div class="col-xs-12">
                           <h3>Available Rooms</h3>
                        </div>
                        
            </div>
            <br/>
            <div class="row">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-6" style="margin-bottom: 10px">
                    <dx:ASPxGridView ID="availableRoomsGridView" runat="server" Theme="BlackGlass" AutoGenerateColumns="False" KeyFieldName="Id">
                        <Settings ShowFilterRow="True"></Settings>
                        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

                        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                        <Columns>

                            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="1" ButtonRenderMode="Image">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Code" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="4" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="HotelId" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="RoomTypeId" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-2 col-lg-1">
                    <label>Comments:</label>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-3 col-lg-3">
                    <dx:ASPxMemo ID= "commentMemoBox" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>
                </div>
                        
            </div>
            <br/>
              <div class="row">
                        <div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
                           <label>Search Customer:</label>
                        </div>
                        <div style="height: 45px;" class="col-xs-8 col-sm-4 col-md-3 col-lg-3">
                            <dx:ASPxComboBox ID="customerComboBox" NullText="Search Customer" runat="server" ValueField="Id" TextField="Name" IncrementalFilteringMode= "Contains" DropDownStyle= "DropDown">
                                 <Columns>
                                <dx:ListBoxColumn FieldName="Name" Visible="True" Caption="Name"/>
                                <dx:ListBoxColumn Caption="Surname" FieldName="Surname" />
                                
                            </Columns>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-xs-4 col-sm-2 col-md-2 col-lg-2">
                           <label>Agreed Price:</label>
                        </div>
                        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                            <dx:ASPxTextBox ID= "agreedPriceTextBox" runat="server" Width="170px"></dx:ASPxTextBox>
                        </div>
                        
            </div>
            <br/>
             <dx:ASPxButton ID="createCustomerButton" runat="server" Text="Create Customer">
                <ClientSideEvents Click="function(s, e) { ShowLoginWindow(); }" />
            </dx:ASPxButton>
            
            <br/>
            <br/>
            <div class="row">
                <div class="col-xs-6">
                    
                </div>
                <div class="col-xs-6" style="text-align: right">
                    <dx:ASPxButton OnClick="saveBookingButton_OnClick" ID= "saveBookingButton" runat="server" Text="Save Booking"></dx:ASPxButton>
                </div>
                <br/>
                <br/>
                

            </div>
        </div>

    </div>
    <dx:ASPxPopupControl ClientInstanceName="createUserPopUp" Width="330px" Height="250px"
        MaxWidth="800px" MaxHeight="800px" MinHeight="150px" MinWidth="150px" ID="createUserPopUp"
        ShowFooter="True" FooterText="Runtime: 142 min" PopupElementID="imgButton" HeaderText="Customer Form"
        runat="server" EnableViewState="false" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" EnableHierarchyRecreation="True" AllowDragging= "True" PopupAnimationType="Fade" Modal="True">
        <modalbackgroundstyle backcolor="Black">
        </modalbackgroundstyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <label>Name:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ClientInstanceName="nameTextBox" ValidateRequestMode="Enabled" ID= "nameTextBox" runat="server" Width="170px">
                                    <ValidationSettings  EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Right" SetFocusOnError="true">
                                    <ErrorFrameStyle Font-Size="Large"/>
                                        <RequiredField IsRequired="True" ErrorText="*"/>
                                    </ValidationSettings>
                                </dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Surname:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ClientInstanceName="surnameText" ValidateRequestMode="Enabled" ID= "surNameTextBox" runat="server" Width="170px">
                                    <ValidationSettings  EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Right" SetFocusOnError="true">
                                    <ErrorFrameStyle Font-Size="Large"/>
                                        <RequiredField IsRequired="True" ErrorText="*"/>
                                    </ValidationSettings>
                                </dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Tax Id:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID= "taxIdTextBox" runat="server" Width="170px">
                                    
                                </dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Id Number:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ClientInstanceName="idNumberText" ID= "idNumberTextBox" runat="server" Width="170px">
                                    <ClientSideEvents KeyDown="function(s, e) {
	                                 if (!((e.htmlEvent.keyCode &gt;= 48 &amp;&amp; e.htmlEvent.keyCode &lt;= 57) || 
                                           (e.htmlEvent.keyCode == 8 || e.htmlEvent.keyCode == 46 || e.htmlEvent.keyCode == 37 || 
                                            e.htmlEvent.keyCode == 39))) 
                                        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent); }">
                                    </ClientSideEvents>
                                    <ValidationSettings  EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Right" SetFocusOnError="true">
                                    <ErrorFrameStyle Font-Size="Large"/>
                                        <RequiredField IsRequired="True" ErrorText="*"/>
                                    </ValidationSettings>
                                </dx:ASPxTextBox> 
                            </td>
                        </tr>
                         <tr>
                             <td>
                                <label>Address:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID= "addressTextBox" runat="server" Width="170px"></dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Email:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID= "emailTextBox" runat="server" Width="170px"></dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Phone:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID= "phoneTextBox" runat="server" Width="170px"></dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Created:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID= "createdTextBox" runat="server" Width="170px"></dx:ASPxTextBox> 
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label>Created By:  </label>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID= "createdByTextBox" runat="server" Width="170px"></dx:ASPxTextBox> 
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <div class="pcmButton">
                                            <dx:ASPxButton OnClick="CustomersPopUpSaveButton"  ID="customersPopUpSaveButton" runat="server" Text="Save" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) {if (eval(&#39;nameTextBox&#39;).lastChangedValue == null || eval(&#39;surnameText&#39;).lastChangedValue == null || eval(&#39;idNumberText&#39;).lastChangedValue == null) {
return false;
}
 if(ASPxClientEdit.ValidateGroup(&#39;entryGroup&#39;)) createUserPopUp.Hide(); 
}" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="btCancel" runat="server" Text="Cancel" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) { createUserPopUp.Hide(); }" />
                                            </dx:ASPxButton>
                                        </div>
                </asp:Panel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
