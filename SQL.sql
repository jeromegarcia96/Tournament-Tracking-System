USE [master]
GO
/****** Object:  Database [Tournament]    Script Date: 3/20/2018 11:43:30 AM ******/
CREATE DATABASE [Tournament]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tournament', FILENAME = N'C:\Databases\Tournament.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tournaments_log', FILENAME = N'C:\Databases\Tournaments_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Tournament] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tournament].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tournament] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tournament] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tournament] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tournament] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tournament] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tournament] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tournament] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tournament] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tournament] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tournament] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tournament] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tournament] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tournament] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tournament] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tournament] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tournament] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tournament] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tournament] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tournament] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tournament] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tournament] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tournament] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tournament] SET RECOVERY FULL 
GO
ALTER DATABASE [Tournament] SET  MULTI_USER 
GO
ALTER DATABASE [Tournament] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tournament] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tournament] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tournament] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tournament] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tournament', N'ON'
GO
ALTER DATABASE [Tournament] SET QUERY_STORE = OFF
GO
USE [Tournament]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Tournament]
GO
/****** Object:  Table [dbo].[MatchupEntries]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchupEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatchupId] [int] NOT NULL,
	[ParentMatchupId] [int] NULL,
	[TeamCompetingId] [int] NULL,
	[Score] [float] NULL,
 CONSTRAINT [PK_MatchupEntries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matchups]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matchups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[WinnerId] [int] NULL,
	[MatchupRound] [int] NOT NULL,
 CONSTRAINT [PK_Matchups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[CellphoneNumber] [varchar](20) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prizes]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceNumber] [int] NOT NULL,
	[PlaceName] [nvarchar](50) NOT NULL,
	[PrizeAmount] [money] NOT NULL,
	[PrizePercentage] [float] NOT NULL,
 CONSTRAINT [PK_Prizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestPerson]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestPerson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[NumberOfKids] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TestPerson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentEntries]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentEntries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentPrizes]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentPrizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[PrizeId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentPrizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [nvarchar](200) NOT NULL,
	[EntryFee] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Prizes] ADD  CONSTRAINT [DF_Prizes_PrizeAmount]  DEFAULT ((0)) FOR [PrizeAmount]
GO
ALTER TABLE [dbo].[Prizes] ADD  CONSTRAINT [DF_Prizes_PrizePercentage]  DEFAULT ((0)) FOR [PrizePercentage]
GO
ALTER TABLE [dbo].[TestPerson] ADD  CONSTRAINT [DF_TestPerson_NumberOfKids]  DEFAULT ((0)) FOR [NumberOfKids]
GO
ALTER TABLE [dbo].[TestPerson] ADD  CONSTRAINT [DF_TestPerson_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Tournament] ADD  CONSTRAINT [DF_Tournaments_EntryFee]  DEFAULT ((0)) FOR [EntryFee]
GO
ALTER TABLE [dbo].[Tournament] ADD  CONSTRAINT [DF_Tournaments_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_MatchupId] FOREIGN KEY([MatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_MatchupId]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_ParentMatchupId] FOREIGN KEY([ParentMatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_ParentMatchupId]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntries_TeamCompetingId] FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries] CHECK CONSTRAINT [FK_MatchupEntries_TeamCompetingId]
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_TournamentId] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([id])
GO
ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_TournamentId]
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD  CONSTRAINT [FK_Matchups_WinnerId] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Matchups] CHECK CONSTRAINT [FK_Matchups_WinnerId]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_PersonId]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_TeamId]
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_TeamId]
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntries_TournamentId] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries] CHECK CONSTRAINT [FK_TournamentEntries_TournamentId]
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_PrizeId] FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prizes] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_PrizeId]
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrizes_TournamentId] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes] CHECK CONSTRAINT [FK_TournamentPrizes_TournamentId]
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_GetByMatchup]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets all the matchups for a given tournament
CREATE PROCEDURE [dbo].[spMatchupEntries_GetByMatchup]
  @MatchupId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select *
  from MatchupEntries
  where MatchupId = @MatchupId;

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Insert] 
	@MatchupId int,
	@ParentMatchupId int,
	@TeamCompetingId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.MatchupEntries (MatchupId, ParentMatchupId, TeamCompetingId)
	values (@MatchupId, @ParentMatchupId, @TeamCompetingId);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Update]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Update] 
	@id int,
	@TeamCompetingId int = null,
	@Score float = null
AS
BEGIN
	SET NOCOUNT ON;

    update dbo.MatchupEntries
	set TeamCompetingId = @TeamCompetingId, Score = @Score
	where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_GetByTournament]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets all the matchups for a given tournament
CREATE PROCEDURE [dbo].[spMatchups_GetByTournament]
  @TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select m.*
  from dbo.Matchups m
  where m.TournamentId = @TournamentId
  order by MatchupRound;

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchups_Insert] 
	@TournamentId int,
	@MatchupRound int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.Matchups (TournamentId, MatchupRound)
	values (@TournamentId, @MatchupRound);

	select @Id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchups_Update] 
	@id int,
	@WinnerId int
AS
BEGIN
	SET NOCOUNT ON;

    update dbo.Matchups
	set WinnerId = @WinnerId
	where id = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets all the people in the database
CREATE PROCEDURE [dbo].[spPeople_GetAll]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select *
  from People;

END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_Insert] 
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@EmailAddress nvarchar(100),
	@CellphoneNumber varchar(20),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.People (FirstName, LastName, EmailAddress, CellphoneNumber)
	values (@FirstName, @LastName, @EmailAddress, @CellphoneNumber);

	select @id=SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_GetAll]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets all the prizes for a given tournament
CREATE PROCEDURE [dbo].[spPrizes_GetAll]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select *
  from dbo.Prizes;

END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_GetByTournament]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets all the prizes for a given tournament
CREATE PROCEDURE [dbo].[spPrizes_GetByTournament]
  @TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select p.*
  from dbo.Prizes p
  inner join dbo.TournamentPrizes t on p.id = t.PrizeId
  where t.TournamentId = @TournamentId;

END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPrizes_Insert] 
	@PlaceNumber int,
	@PlaceName nvarchar(50),
	@PrizeAmount money,
	@PrizePercentage float,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.Prizes (PlaceNumber, PlaceName, PrizeAmount, PrizePercentage)
	values (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetAll]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeam_GetAll] 
AS
BEGIN
	SET NOCOUNT ON;

    select *
	from dbo.Teams;

END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets the current teams for a given tournament
CREATE PROCEDURE [dbo].[spTeam_GetByTournament]
	@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select t.*
  from dbo.Teams t
  inner join dbo.TournamentEntries e on t.id = e.TeamId
  where e.TournamentId = @TournamentId;

END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_GetByTeam]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets the people on a given team
CREATE PROCEDURE [dbo].[spTeamMembers_GetByTeam]
	@TeamId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select p.*
  from dbo.TeamMembers m
  inner join dbo.People p on m.PersonId = p.id
  where m.TeamId = @TeamId;

END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeamMembers_Insert] 
	@TeamId int,
	@PersonId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.TeamMembers(TeamId, PersonId)
	values (@TeamId, @PersonId);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTeams_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeams_Insert] 
	@TeamName nvarchar(100),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.Teams (TeamName)
	values (@TeamName);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTestPerson_GetByLastName]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTestPerson_GetByLastName] 
	@LastName nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

    select *
	from dbo.TestPerson
	where LastName = @LastName;

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentEntries_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamentEntries_Insert] 
	@TournamentId int,
	@TeamId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.TournamentEntries (TournamentId, TeamId)
	values (@TournamentId, @TeamId);

	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentPrizes_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamentPrizes_Insert] 
	@TournamentId int,
	@PrizeId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.TournamentPrizes( TournamentId, PrizeId)
	values (@TournamentId, @PrizeId);

	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Complete]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournaments_Complete] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;

    update dbo.Tournament
	set Active = 0
	where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_GetAll]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Gets all the Tournament in the database that are active
CREATE PROCEDURE [dbo].[spTournaments_GetAll]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select *
  from dbo.Tournament
  where Active = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Insert]    Script Date: 3/20/2018 11:43:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournaments_Insert] 
	@TournamentName nvarchar(200),
	@EntryFee money,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.Tournament ( TournamentName, EntryFee, Active)
	values ( @TournamentName, @EntryFee, 1);

	select @id = SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [Tournament] SET  READ_WRITE 
GO
