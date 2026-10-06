CREATE PROCEDURE [dbo].[usp_BusRoute_GetAll]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Id], [RouteName], [VehicleNumber], [DriverName], [DriverPhone], [Fee], [IsActive]
    FROM   [dbo].[BusRoutes]
    WHERE  [IsActive] = 1
    ORDER BY [RouteName];
END
