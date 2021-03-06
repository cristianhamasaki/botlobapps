USE [dxfy17metrictracker]
GO
/****** Object:  StoredProcedure [dbo].[createOrUpdatePolicyRequest]    Script Date: 10-09-2016 19:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[createOrUpdatePolicyRequest] 
	-- Add the parameters for the stored procedure here
	@PolicyRequestId varchar(50) ,
	@CustomerId varchar(50) ,
	@PolicyType varchar(50) ,
	@ApplicationDate Date ,
	@PolicyStatus varchar(50) ,
	@InsuredIdentifier varchar(50) , -- this is the registration number of the vehicle etc
	@InsuredValue Decimal(18,3),
	@Currency varchar(50) ,
	@PolicyStartDate Date ,
	@PolicyExpiryDate Date ,
	@PolicyId varchar(100) ,
	@RefDocumentIds varchar(50) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @vals int
	--SET @vals  = SELECT COUNT(*) FROM DBO.FY17ISVEngagementTracker WHERE ID = @ID
	--print @vals

	If(SELECT COUNT(*) FROM DBO.PolicyRequests WHERE PolicyRequestId = @PolicyRequestId) > 0
	Begin
	UPDATE DBO.PolicyRequests SET
	CustomerId	=	@CustomerId,
	PolicyType	=	@PolicyType,
	ApplicationDate	=	@ApplicationDate,
	PolicyStatus	=	@PolicyStatus,
	InsuredIdentifier	=	@InsuredIdentifier,
	AssessedValue	=	@InsuredValue,
	Currency	=	@Currency,
	PolicyStartDate	=	@PolicyStartDate,
	PolicyExpiryDate	=	@PolicyExpiryDate,
	PolicyId	=	@PolicyId,
	RefDocumentIds	=	@RefDocumentIds

	WHERE PolicyRequestId = @PolicyRequestId
	End
	
	Else 
	Begin
    -- Insert statements for procedure here
	INSERT INTO DBO.PolicyRequests 
	(
	PolicyRequestId,
	CustomerId,
	PolicyType,
	ApplicationDate,
	PolicyStatus,
	InsuredIdentifier,
	AssessedValue,
	Currency,
	PolicyStartDate,
	PolicyExpiryDate,
	PolicyId,
	RefDocumentIds
	)
	VALUES
	(
	@PolicyRequestId,
	@CustomerId,
	@PolicyType,
	@ApplicationDate,
	@PolicyStatus,
	@InsuredIdentifier,
	@InsuredValue,
	@Currency,
	@PolicyStartDate,
	@PolicyExpiryDate,
	@PolicyId,
	@RefDocumentIds
	)
	End
End



