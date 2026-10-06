CREATE TABLE [dbo].[StudentDocuments]
(
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [StudentId]    INT            NOT NULL,
    [DocumentType] NVARCHAR (100) NOT NULL, -- e.g. BirthCertificate, PreviousSchoolTC, Photo
    [FileName]     NVARCHAR (300) NULL,
    [FileUrl]      NVARCHAR (500) NOT NULL,  -- Cloudinary secure url
    [PublicId]     NVARCHAR (300) NULL,      -- Cloudinary public id
    [UploadedAt]   DATETIME2 (0)  NOT NULL CONSTRAINT [DF_StudentDocuments_UploadedAt] DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT [PK_StudentDocuments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StudentDocuments_Students] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([Id])
);
