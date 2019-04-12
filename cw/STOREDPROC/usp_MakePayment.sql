USE [CarWash]
GO

/****** Object:  StoredProcedure [dbo].[usp_MakePayment]    Script Date: 28/3/2019 2:51:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_MakePayment]
	-- Add the parameters for the stored procedure here
	@paymentid int =null,
	@customerid int = null,
	@amountreceived decimal(18,2) = null,--cash|check only
	@paymentmethod nvarchar(20) = null,
	@username nvarchar(25) = null,
	@paymentsource nvarchar(25)=null, -- counter|reservation|
	@cardtype nvarchar(50)=null,
	@cardholdername nvarchar(50)=null,
	@cardnumber nvarchar(50) = null,
	@expirationdate nvarchar(20)= null, -- MM-YYYYY
	@cvc nvarchar(3) = null,
	@ip nvarchar(20)=null,
	@invoicenumber nvarchar(50) = null,
	@checkbank varchar(50)=  null,
	@checkseries nvarchar(50) = null
	
	
AS
BEGIN
	
	update dbo.PaymentTransaction
	set PaymentType=@paymentmethod
	,Paymentdate=GETDATE()
	,paymentsource=@paymentsource--from cashier|reservations
	where PaymentId=@paymentid

	if @@ROWCOUNT =0 
	begin
		insert into dbo.PaymentTransaction
		(Customerid,PaymentType,Paymentdate,paymentsource,invoiceamount,cardtype,CardHolderName,CardNumber,ExpirationDate,cvc,ip,InvoiceNumber,Email,Currency,checkbank,checkseries,amountofcashreceived,Createdby,datecreated)
		--get the customer information
		select top 1
		@customerid,@paymentmethod,GETDATE(),@paymentsource,(select sum(ss.ServiceCharges) from SelectedServices as ss where ss.customerid=c.id),
		@cardtype,@cardholdername,@cardnumber,@expirationdate,@cvc,@ip,@invoicenumber,c.Email,'USD',@checkbank,@checkseries,@amountreceived,@username,getdate()		
		from dbo.Customer_V c
		where c.id=@customerid
	end
END
GO

