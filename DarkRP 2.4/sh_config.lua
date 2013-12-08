SSK = {}

--Names of the tabs on the sidebar
SSK.CommandsTabTitle = "Money/Commands"
SSK.JobsTabTitle = "Jobs"
SSK.EntitiesTabTitle = "Entities"



--Title for first section of commands
SSK.FirstCommandsTitle = "Money Commands"
--Title for second section of commands
SSK.SecondCommandsTitle = "Roleplay Commands"
--Title for third section of commands
SSK.ThirdCommandsTitle = "Other Commands"
--Title for Civil Protection section of commands
SSK.CPCommandsTitle = "Civil Protection Commands"
--Title for Civil Protection section of commands
SSK.MayorCommandsTitle = "Mayor Commands"

--The URL that opens when clicking the Forum tab
SSK.ForumURL = "http://google.com"
--The URL that opens when clicking the donate tab
SSK.DonateURL = "http://google.com"
--Whether or not to show donator only entities to all players
SSK.ShowDonatorEntitiesToAll = false

--Access to certain commands, make sure you add commas!

AccessToCPCmds = { TEAM_POLICE, TEAM_CHIEF }

AccessToMayorCmds = { TEAM_MAYOR }



-- Adding Commands Buttons (Advanced)
/*
MenuAddMButton - Adds button to first section
MenuAddRPButton - Adds button to second section
MenuAddCPButton - Adds button to exclusive CP section
MenuAddMayorButton - Adds button to exclusive mayor section

Format goes as shown:
MenuAddMButton( [Title of button], [Function of button] )

===============================================================================

If you would just like the button to run a command (i.e. /buyhealth):
For the [Function of button] argument, use:

RunConsoleCommand( "say", [Command] )

===============================================================================

If you would like to open a window that takes the players input (number or reason) when clicked:
For the [Function of button] argument, use:

function() OpenTextBox( [Title of dialog box], [Subtext of dialog box], [Command] ) end

===============================================================================

If you would like to open a window with a drop down of players when clicked:
For the [Function of button] argument, use:

function() OpenPlyBox( [Title of dialog box], [Subheading over dropdown], [Command] ) end

===============================================================================

If you would like to open a window with a drop down of players and an input box (reason or number) when clicked:
For the [Function of button] argument, use:

function() OpenPlyReasonBox( [Title of dialog box], [Subheading over dropdown], [Subheading over input box], [Command] ) end

===============================================================================

*/

MONEYCMD_BUTTONS = {}
RPCMD_BUTTONS = {}
CPCMD_BUTTONS = {}
MAYORCMD_BUTTONS = {}
OTHERCMD_BUTTONS = {}
 
local function MenuAddMButton( n, f )
    table.insert(MONEYCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddRPButton( n, f )
    table.insert(RPCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddCPButton( n, f )
    table.insert(CPCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddMayorButton( n, f )
    table.insert(MAYORCMD_BUTTONS, { NAME = n, FUNC = f } )
end

local function MenuAddOtherButton( n, f )
    table.insert(OTHERCMD_BUTTONS, { NAME = n, FUNC = f } )
end

--First Section
MenuAddMButton( "Give Money To The Player You're Looking At", function() OpenTextBox( "Give Money", "How much money would you like to give to this player?", "/give" ) end )
MenuAddMButton( "Drop Money", function() OpenTextBox( "Drop Money", "How much money would you like to drop?", "/moneydrop" ) end )
--MenuAddMButton( "Buy Health", function() RunConsoleCommand( "say", "/buyhealth" ) end )

--Second Section
MenuAddRPButton( "Change Roleplay Name", function() OpenTextBox( "Change Name", "What would you like to change your roleplay name to?", "/rpname" ) end )
MenuAddRPButton( "Go to Sleep/Wake Up", function() RunConsoleCommand( "say", "/sleep" ) end )
MenuAddRPButton( "Drop Current Weapon", function() RunConsoleCommand( "say", "/drop" ) end )
MenuAddRPButton( "Request Gun License", function() RunConsoleCommand( "say", "/requestlicense" ) end )
MenuAddRPButton( "Demote A Player", function() OpenPlyReasonBox( "Demote a player", "Which player would you like to demote?", "Why would you like to demote this player?", "/demote" ) end )
MenuAddRPButton( "Sell All Doors", function() RunConsoleCommand( "say", "/unownalldoors" ) end )

MenuAddCPButton( "Make a player wanted", function() OpenPlyReasonBox( "Make a player wanted", "Which player would you like to make wanted?", "Why would you like to make this player wanted?", "/wanted" ) end )
MenuAddCPButton( "Make a player not wanted", function() OpenPlyBox( "Make a player not wanted", "Which player would you like to make not wanted?", "/unwanted" ) end )
MenuAddCPButton( "Warrant a player", function() OpenPlyReasonBox( "Warrant A Player", "Which player would you like to warrant?", "Why would you like to warrant this player?", "/warrant" ) end )

MenuAddMayorButton( "Make a player wanted", function() OpenPlyReasonBox( "Make a player wanted", "Which player would you like to make wanted?", "Why would you like to make this player wanted?", "/wanted" ) end )
MenuAddMayorButton( "Make a player not wanted", function() OpenPlyBox( "Make a player not wanted", "Which player would you like to make not wanted?", "/unwanted" ) end )
MenuAddMayorButton( "Warrant a player", function() OpenPlyReasonBox( "Warrant A Player", "Which player would you like to warrant?", "Why would you like to warrant this player?", "/warrant" ) end )
MenuAddMayorButton( "Initiate a Lockdown", function() RunConsoleCommand( "say", "/lockdown" ) end )
MenuAddMayorButton( "Conclude a Lockdown", function() RunConsoleCommand( "say", "/unlockdown" ) end )
MenuAddMayorButton( "Place board of laws", function() RunConsoleCommand( "say", "/placelaws" ) end )
MenuAddMayorButton( "Add Law", function() OpenTextBox( "Add Law", "What new law would you like to introduce?", "/addlaw" ) end )

MenuAddOtherButton( "Say I'm Swaggy", function() RunConsoleCommand( "say", "I'm swaggy" ) end )