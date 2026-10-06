CREATE TABLE [dbo].[BusRoutes]
(
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [RouteName]     NVARCHAR (100) NOT NULL,
    [VehicleNumber] NVARCHAR (30)  NULL,
    [DriverName]    NVARCHAR (100) NULL,
    [DriverPhone]   NVARCHAR (20)  NULL,
    [Fee]           DECIMAL (10, 2) NOT NULL CONSTRAINT [DF_BusRoutes_Fee] DEFAULT (0),
    [IsActive]      BIT            NOT NULL CONSTRAINT [DF_BusRoutes_IsActive] DEFAULT (1),
    CONSTRAINT [PK_BusRoutes] PRIMARY KEY CLUSTERED ([Id] ASC)
);
