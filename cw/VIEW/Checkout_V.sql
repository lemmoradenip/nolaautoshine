USE [CarWash]
GO

/****** Object:  View [dbo].[Checkout_V]    Script Date: 28/3/2019 2:51:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Checkout_V]
AS
SELECT        c.id AS customerid, c.Fname + N' ' + c.Lname AS BilltoCustomer, c.Address AS BilltoAddr, c.Mobile, c.Email, c.CreatedDate, CONVERT(nvarchar(12), c.ScheduledDate, 100) AS ServiceDate, 
                         c.ScheduledTime AS ServiceTime, c.SelectedServices, c.Ispaid, c.VehicleType, c.CarModel, dbo.CarMakerList.CarMake,
                             (SELECT        SUM(ServiceCharges) AS Expr1
                               FROM            dbo.SelectedServices AS ss
                               WHERE        (CustomerId = c.id) AND (Isvoid IS NULL)) AS InvoiceNetAmount, ISNULL
                             ((SELECT        TOP (1) Currency
                                 FROM            dbo.Currency), 'USD') AS Currency, ISNULL
                             ((SELECT        TOP (1) PaymentId + 1 AS Expr1
                                 FROM            dbo.PaymentTransaction
                                 ORDER BY PaymentId DESC), 1) AS InvoiceNo, CONVERT(nvarchar(12), GETDATE()) AS Invoicedate
FROM            dbo.Customer AS c LEFT OUTER JOIN
                         dbo.CarMakerList ON c.CarModel = dbo.CarMakerList.ID
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[1] 2[57] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 297
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "CarMakerList"
            Begin Extent = 
               Top = 6
               Left = 251
               Bottom = 168
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3930
         Alias = 5145
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Checkout_V'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Checkout_V'
GO

