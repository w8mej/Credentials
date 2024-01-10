if not exists (select * from master.dbo.syslogins where loginname = N'thesorrow')
BEGIN
    declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'master', @loginlang = N'us_english'
    if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
        select @logindb = N'master'
    if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
        select @loginlang = @@language
    CREATE LOGIN thesorrow WITH PASSWORD = 'thisisinsecuresoCHANGEM3!'  MUST_CHANGE, 
      SID = 0x14585E90117152449347750164BA00A7,
    | DEFAULT_DATABASE = thesorrowDatabase,
    | DEFAULT_LANGUAGE = us_english,
    | CHECK_EXPIRATION = ON,
    | CHECK_POLICY = ON,
| FROM CREDENTIAL = thesorrow_cert;
END
GO

CREATE USER thesorrow FOR LOGIN thesorrow;
