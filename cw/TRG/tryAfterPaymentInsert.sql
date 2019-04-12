USE [CarWash]
GO

/****** Object:  Trigger [dbo].[trgAfterPaymentInsert]    Script Date: 28/3/2019 2:50:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trgAfterPaymentInsert]
   ON [dbo].[PaymentTransaction] 
   AFTER insert
AS 
BEGIN


update dbo.Customer 
set ispaid=1--payment was done
where id= (select top 1 i.customerid from inserted as i )--this will get the customerid from inserted/updated record


END
GO

ALTER TABLE [dbo].[PaymentTransaction] ENABLE TRIGGER [trgAfterPaymentInsert]
GO

