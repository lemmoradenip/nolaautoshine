USE [CarWash]
GO

/****** Object:  Table [dbo].[PaymentTransaction]    Script Date: 28/3/2019 2:49:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PaymentTransaction](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [varchar](50) NULL,
	[Paymentdate] [datetime] NULL,
	[PaymentSource] [varchar](50) NOT NULL,
	[InvoiceAmount] [nvarchar](50) NULL,
	[CardType] [varchar](20) NULL,
	[CardHolderName] [nvarchar](50) NULL,
	[CardNumber] [nvarchar](20) NULL,
	[ExpirationDate] [nvarchar](20) NULL,
	[CVC] [nvarchar](3) NULL,
	[IP] [nvarchar](20) NULL,
	[InvoiceNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Currency] [varchar](5) NULL,
	[CheckBank] [varchar](50) NULL,
	[CheckSeries] [nvarchar](50) NULL,
	[AmountofCashReceived] [decimal](18, 2) NULL,
	[Createdby] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_PaymentTransac] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PaymentTransaction] ADD  CONSTRAINT [DF_PaymentTransac_Paymentdate]  DEFAULT (getdate()) FOR [Paymentdate]
GO

