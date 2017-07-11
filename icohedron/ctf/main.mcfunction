# Keep track of which entities are currently in the game
scoreboard players set @e CTFActive 0

# [User Input 1]
# The following assigns the score CTFActive to all entities within the map (including the lobby)
# Use an appropriate selector. Replace @e[r=-1]
scoreboard players set @e[r=-1] CTFActive 1

# Exclude spectators
scoreboard players set @a[score_CTFActive_min=1,m=creative] CTFActive 2
scoreboard players set @a[score_CTFActive_min=1,m=spectator] CTFActive 2
scoreboard players set @a[score_CTFActive_min=1,score_CTFSpectate_min=1] CTFActive 2

# Spectators leave their team if they were on one
scoreboard teams leave @a[score_CTFActive_min=2,team=CTFRed]
scoreboard teams leave @a[score_CTFActive_min=2,team=CTFBlue]

# [User Input 2]
# Use event server spawn point system. Set spawn points to a random active lobby spawn point
# Use the assigned 'SPid' for the map -- currently using 33
# scoreboard players add @a[score_CTFActive_min=1,score_CTFActive=1] SPid 0
# scoreboard players set @a[score_CTFActive_min=1,score_CTFActive=1,score_SPid=-34] SPid 33
# scoreboard players set @a[score_CTFActive_min=1,score_CTFActive=1,score_SPid_min=-32] SPid 33

# CTF Control Panel book given to Event Coordinators
# {"command":"/give @p written_book 1 0 {pages:%s,title:Book,author:TellrawGenerator}","jobject":[{"text":"Capture the Flag","bold":true},{"text":"\\n"},{"text":"Game:"},{"text":" "},{"text":"[Start]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 1"}},{"text":"\\n"},{"text":"Teams:"},{"text":"\\n"},{"text":"[Add Red]","color":"red","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 6"}},{"text":" "},{"text":"[Add Blue]","color":"blue","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 7"}},{"text":"\\n"},{"text":"[Rebalance Teams]","color":"dark_purple","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 8"}},{"text":"\\n\\n"},{"text":"Winning Score:"},{"text":" "},{"text":"[-]","color":"red","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 5"}},{"text":" "},{"text":"[+]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 4"}},{"text":"\\n"},{"text":"Time:"},{"text":"\\n"},{"text":"[-1 min]","color":"red","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 3"}},{"text":" "},{"text":"[+1 min]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 2"}},{"text":"\\n"},{"NEW_ITERATE_FLAG":true},{"text":"Advanced Controls","bold":true},{"text":"\\n"},{"text":"Spectate:"},{"text":"\\n"},{"text":"[Add Spectator]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 11"}},{"text":"\\n"},{"text":"Teams:"},{"text":"\\n"},{"text":"[Add Red]","color":"red","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 12"}},{"text":" "},{"text":"[Add Blue]","color":"blue","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 13"}},{"text":"\\n\\n"},{"text":"Time Limit:"},{"text":"\\n"},{"text":"[Change Time]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 9"}},{"text":"\\n"},{"text":"Winning Score:"},{"text":"\\n"},{"text":"[Change Score]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger CTFTrigger set 10"}},{"text":"\\n"}],"jtemplate":"book"}
replaceitem entity @a[score_CTFActive_min=1,score_MCTeams_min=8,score_MCTeams=8] slot.hotbar.6 written_book 1 0 {pages:["[\"\",{\"text\":\"Capture the Flag\",\"bold\":true},{\"text\":\"\\n\",\"bold\":false},{\"text\":\"Game:\"},{\"text\":\" \"},{\"text\":\"[Start]\",\"color\":\"dark_green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 1\"}},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"Teams:\",\"color\":\"none\"},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"[Add Red]\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 6\"}},{\"text\":\" \",\"color\":\"none\"},{\"text\":\"[Add Blue]\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 7\"}},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"[Rebalance Teams]\",\"color\":\"dark_purple\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 8\"}},{\"text\":\"\\n\\n\",\"color\":\"none\"},{\"text\":\"Winning Score:\",\"color\":\"none\"},{\"text\":\" \",\"color\":\"none\"},{\"text\":\"[-]\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 5\"}},{\"text\":\" \",\"color\":\"none\"},{\"text\":\"[+]\",\"color\":\"dark_green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 4\"}},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"Time:\",\"color\":\"none\"},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"[-1 min]\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 3\"}},{\"text\":\" \",\"color\":\"none\"},{\"text\":\"[+1 min]\",\"color\":\"dark_green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 2\"}},{\"text\":\"\\n\",\"color\":\"none\"}]","[\"\",{\"text\":\"Advanced Controls\",\"bold\":true},{\"text\":\"\\n\",\"bold\":false},{\"text\":\"Spectate:\"},{\"text\":\"\\n\"},{\"text\":\"[Add Spectator]\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 11\"}},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"Teams:\",\"color\":\"none\"},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"[Add Red]\",\"color\":\"red\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 12\"}},{\"text\":\" \",\"color\":\"none\"},{\"text\":\"[Add Blue]\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 13\"}},{\"text\":\"\\n\\n\",\"color\":\"none\"},{\"text\":\"Time:\",\"color\":\"none\"},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"[Change Time]\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 9\"}},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"Winning Score:\",\"color\":\"none\"},{\"text\":\"\\n\",\"color\":\"none\"},{\"text\":\"[Change Score]\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger CTFTrigger set 10\"}},{\"text\":\"\\n\",\"color\":\"none\"}]"],title:"CTF Control Panel",author:"Icohedron"}

# Trigger for Event Coordinators
scoreboard players enable @a[score_CTFActive_min=1,score_MCTeams_min=8,score_MCTeams=8] CTFTrigger
# Move from lobby state to start state
execute @a[score_CTFTrigger_min=1,score_CTFTrigger=1] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:1,Tags:["CTFStartGame"]}
# Increment/Decrement time by 1 minute
execute @a[score_CTFTrigger_min=2,score_CTFTrigger=2] ~ ~ ~ scoreboard players add TimeInTicks CTFRoundTime 1200
execute @a[score_CTFTrigger_min=3,score_CTFTrigger=3] ~ ~ ~ scoreboard players remove TimeInTicks CTFRoundTime 1200
# Increment/Decrement winning score by 1
execute @a[score_CTFTrigger_min=4,score_CTFTrigger=4] ~ ~ ~ scoreboard players add Winning_Score CTFScore 1
execute @a[score_CTFTrigger_min=5,score_CTFTrigger=5] ~ ~ ~ scoreboard players remove Winning_Score CTFScore 1
# Move one player from blue to red
execute @a[score_CTFTrigger_min=6,score_CTFTrigger=6] ~ ~ ~ scoreboard players tag @r[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] add CTFJoinRed
# Move one player from red to blue
execute @a[score_CTFTrigger_min=7,score_CTFTrigger=7] ~ ~ ~ scoreboard players tag @r[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] add CTFJoinBlue
# Randomize and rebalance teams
execute @a[score_CTFTrigger_min=8,score_CTFTrigger=8] ~ ~ ~ scoreboard teams leave @a[team=CTFRed]
execute @a[score_CTFTrigger_min=8,score_CTFTrigger=8] ~ ~ ~ scoreboard teams leave @a[team=CTFBlue]
# Change time, using the scoreboard command, in ticks
execute @a[score_CTFTrigger_min=9,score_CTFTrigger=9] ~ ~ ~ tellraw @p ["",{"text":"Click ","color":"gold","bold":true},{"text":"here","color":"dark_aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players set TimeInTicks CTFRoundTime <time in ticks>"}},{"text":" to set the time limit (in ticks)","color":"gold","bold":true}]
# Change the winning score using the scoreboard command
execute @a[score_CTFTrigger_min=10,score_CTFTrigger=10] ~ ~ ~ tellraw @p ["",{"text":"Click ","color":"gold","bold":true},{"text":"here","color":"dark_aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players set Winning_Score CTFScore <score>"}},{"text":" to set the winning score","color":"gold","bold":true}]
# Add a player to spectate using the scoreboard command
execute @a[score_CTFTrigger_min=11,score_CTFTrigger=11] ~ ~ ~ tellraw @p ["",{"text":"Click ","color":"gold","bold":true},{"text":"here","color":"dark_aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players set <player> CTFSpectate 1"}},{"text":" to add someone to ","color":"gold","bold":true},{"text":"Spectator","color":"gray","bold":true}]
# Add a player to red team using the scoreboard command
execute @a[score_CTFTrigger_min=12,score_CTFTrigger=12] ~ ~ ~ tellraw @p ["",{"text":"Click ","color":"gold","bold":true},{"text":"here","color":"dark_aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players tag <player> add CTFJoinRed"}},{"text":" to add someone to ","color":"gold","bold":true},{"text":"Red","color":"red","bold":true},{"text":" team","color":"gold","bold":true}]
# Add a player to blue team using the scoreboard command
execute @a[score_CTFTrigger_min=13,score_CTFTrigger=13] ~ ~ ~ tellraw @p ["",{"text":"Click ","color":"gold","bold":true},{"text":"here","color":"dark_aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/scoreboard players tag <player> add CTFJoinBlue"}},{"text":" to add someone to ","color":"gold","bold":true},{"text":"Blue","color":"blue","bold":true},{"text":" team","color":"gold","bold":true}]
scoreboard players set @a[score_CTFTrigger_min=1] CTFTrigger 0

# Set the default game mode
gamemode adventure @a[score_CTFActive_min=1,score_CTFActive=1,m=!adventure]

# Time
scoreboard players operation Minutes CTFRoundTime = @e[type=armor_stand,tag=CTFGame] CTFRoundTime
scoreboard players operation Minutes CTFRoundTime /= TicksPerMinute CTFRoundTime
scoreboard players operation Minutes CTFScore = Minutes CTFRoundTime

scoreboard players operation Seconds CTFRoundTime = @e[type=armor_stand,tag=CTFGame] CTFRoundTime
scoreboard players operation Seconds CTFRoundTime %= TicksPerMinute CTFRoundTime
scoreboard players operation Seconds CTFRoundTime /= TicksPerSecond CTFRoundTime
scoreboard players operation Seconds CTFScore = Seconds CTFRoundTime

### Assign Teams -- Tagging ###

# Reset team counter
scoreboard players set @e[type=armor_stand,tag=CTFRedMarker] CTFTeamCounter 0
scoreboard players set @e[type=armor_stand,tag=CTFBlueMarker] CTFTeamCounter 0
scoreboard players set @e[type=armor_stand,tag=CTFTeamBalancer] CTFTeamCounter 0

# Count up the number of players on each team
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ scoreboard players add @e[type=armor_stand,tag=CTFRedMarker] CTFTeamCounter 1
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ scoreboard players add @e[type=armor_stand,tag=CTFBlueMarker] CTFTeamCounter 1

# Take the difference to determine which team needs the extra player (Red - Blue)
scoreboard players operation @e[type=armor_stand,tag=CTFTeamBalancer] CTFTeamCounter = @e[type=armor_stand,tag=CTFRedMarker] CTFTeamCounter
scoreboard players operation @e[type=armor_stand,tag=CTFTeamBalancer] CTFTeamCounter -= @e[type=armor_stand,tag=CTFBlueMarker] CTFTeamCounter

# Ensure that players are not on other teams unrelated to CTF
scoreboard players tag @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] add CTFOnATeam
scoreboard players tag @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] add CTFOnATeam
scoreboard teams leave @a[score_CTFActive_min=1,score_CTFActive=1,tag=!CTFOnATeam]
scoreboard players tag @a[tag=CTFOnATeam] remove CTFOnATeam

# Both teams have equal numbers of players. Join a random team
execute @e[type=armor_stand,tag=CTFTeamBalancer,score_CTFTeamCounter_min=0,score_CTFTeamCounter=0] ~ ~ ~ scoreboard players tag @r[score_CTFActive_min=1,score_CTFActive=1,team=,tag=!CTFJoiningTeam] add CTFJoinRandom
scoreboard players tag @e[tag=CTFRandomTeamMarker] remove CTFRandomTeamMarker
scoreboard players tag @r[type=armor_stand,tag=CTFTeamMarker] add CTFRandomTeamMarker
execute @e[type=armor_stand,tag=CTFRandomTeamMarker] ~ ~ ~ execute @e[r=0,c=1,tag=CTFRedMarker] ~ ~ ~ scoreboard players tag @p[tag=CTFJoinRandom] add CTFJoinRed
execute @e[type=armor_stand,tag=CTFRandomTeamMarker] ~ ~ ~ execute @e[r=0,c=1,tag=CTFBlueMarker] ~ ~ ~ scoreboard players tag @p[tag=CTFJoinRandom] add CTFJoinBlue
scoreboard players tag @a[tag=CTFJoinRandom] remove CTFJoinRandom
scoreboard players tag @e[tag=CTFRandomTeamMarker] remove CTFRandomTeamMarker

scoreboard players tag @a[tag=CTFJoinRed] add CTFJoiningTeam
scoreboard players tag @a[tag=CTFJoinBlue] add CTFJoiningTeam

# Blue team has more players. Join Red
execute @e[type=armor_stand,tag=CTFTeamBalancer,score_CTFTeamCounter=-1] ~ ~ ~ scoreboard players tag @r[score_CTFActive_min=1,score_CTFActive=1,team=,tag=!CTFJoiningTeam] add CTFJoinRed
scoreboard players tag @a[tag=CTFJoinRed] add CTFJoiningTeam

# Red team has more players. Join Blue
execute @e[type=armor_stand,tag=CTFTeamBalancer,score_CTFTeamCounter_min=1] ~ ~ ~ scoreboard players tag @r[score_CTFActive_min=1,score_CTFActive=1,team=,tag=!CTFJoiningTeam] add CTFJoinBlue
scoreboard players tag @a[tag=CTFJoinBlue] add CTFJoiningTeam

# Recursive team assignment tagging to assign teams in a single tick
# function icohedron:ctf/assign_teams if @a[score_CTFActive_min=1,score_CTFActive=1,team=,tag=!CTFJoiningTeam]

### End Team Assignment tagging ###

### Team Assignment ###

# Leave the current team, set spawnpoint
scoreboard teams leave @a[tag=CTFJoiningTeam]
execute @a[tag=CTFJoiningTeam] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint,c=1]

# [User Input 3]
# Use regular spawn point system
spawnpoint @a[tag=CTFJoiningTeam]
execute @a[tag=CTFJoiningTeam] ~ ~ ~ tellraw @p ["Your spawn point has been set"]

# Clear inventory, teleport to team spawn, announce joining of team, join team, give items
scoreboard players set @a[tag=CTFJoiningTeam,score_CTFFlagTracker_min=1] CTFFlagTracker 0
clear @a[tag=CTFJoiningTeam]

execute @a[tag=CTFJoinRed] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@p[tag=CTFJoinRed]"}, " joined team ", {"text":"Red","color":"red"}, "!"]
scoreboard teams join CTFRed @a[tag=CTFJoinRed]
scoreboard players tag @a[tag=CTFJoinRed] remove CTFJoinRed

execute @a[tag=CTFJoinBlue] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@p[tag=CTFJoinBlue]"}, " joined team ", {"text":"Blue","color":"blue"}, "!"]
scoreboard teams join CTFBlue @a[tag=CTFJoinBlue]
scoreboard players tag @a[tag=CTFJoinBlue] remove CTFJoinBlue

scoreboard players tag @a[tag=CTFJoiningTeam] remove CTFJoiningTeam

### End Team Assignment ###

# Give armor
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ replaceitem entity @p slot.armor.head leather_helmet 1 0 {display:{color:16711680},Unbreakable:1}
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ replaceitem entity @p slot.armor.chest leather_chestplate 1 0 {display:{color:16711680},Unbreakable:1}
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ replaceitem entity @p slot.armor.legs leather_leggings 1 0 {display:{color:16711680},Unbreakable:1}
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ replaceitem entity @p slot.armor.feet leather_boots 1 0 {display:{color:16711680},Unbreakable:1}

execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ replaceitem entity @p slot.armor.head leather_helmet 1 0 {display:{color:255},Unbreakable:1}
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ replaceitem entity @p slot.armor.chest leather_chestplate 1 0 {display:{color:255},Unbreakable:1}
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ replaceitem entity @p slot.armor.legs leather_leggings 1 0 {display:{color:255},Unbreakable:1}
execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ replaceitem entity @p slot.armor.feet leather_boots 1 0 {display:{color:255},Unbreakable:1}

# Spectators
scoreboard players enable @a[score_CTFActive_min=1] CTFSpectate
# Assign score of 1 for adding a spectator
# Assign score of -1 for removing a spectator
# Score of 2 means they are already in spectate
# Score of 0 means they are not spectating
execute @a[score_CTFSpectate_min=1,score_CTFSpectate=1] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFSpectatorSpawnPoint]
clear @a[score_CTFSpectate_min=1,score_CTFSpectate=1]
scoreboard players set @a[score_CTFSpectate_min=1,score_CTFSpectate=1] CTFSpectate 2

execute @a[score_CTFSpectate_min=-1,score_CTFSpectate=-1] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint]
scoreboard players set @a[score_CTFSpectate_min=-1,score_CTFSpectate=-1] CTFSpectate 0

# Spectator effects
effect @a[score_CTFSpectate_min=1] weakness 1 100 true
effect @a[score_CTFSpectate_min=1] instant_health 1 2 true
effect @a[score_CTFSpectate_min=1] saturation 1 2 true

# Execute the functions corresponding to the current game state. 1.12+ only
# Older versions of Minecraft may use a Repeat -> Conditional Repeat command block chain.
function icohedron:ctf/states/lobby if @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=0,score_CTFGameState=0]
function icohedron:ctf/states/start if @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=1,score_CTFGameState=1]
function icohedron:ctf/states/play if @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=2,score_CTFGameState=2]
function icohedron:ctf/states/end if @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=3,score_CTFGameState=3]
