CREATE PROCEDURE [dbo].[usp_BusRoute_Insert]
    @RouteName     NVARCHAR (100),
    @VehicleNumber NVARCHAR (30)  = NULL,
    @DriverName    NVARCHAR (100) = NULL,
    @DriverPhone   NVARCHAR (20)  = NULL,
    @Fee           DECIMAL (10, 2) = 0,
    @NewId         INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[BusRoutes] ([RouteName], [VehicleNumber], [DriverName], [DriverPhone], [Fee])
    VALUES (@RouteName, @VehicleNumber, @DriverName, @DriverPhone, @Fee);

    SET @NewId = CAST(SCOPE_IDENTITY() AS INT);
END
