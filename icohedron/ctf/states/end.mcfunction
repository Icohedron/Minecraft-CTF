# This condition must pass before the rest of the commands in this file run.
testfor @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=3,score_CTFGameState=3]
# For command block chains initially facing towards positive x (don't set to "Always Active", must be turned on/off with the condition above. Otherwise, it may keep running even after the arena is turned off):
# setblock ~ ~ ~ repeating_command_block 13 replace {TrackOutput:0b,auto:0b}

# Effects
effect @a[score_CTFActive_min=1,score_CTFActive=1] saturation 1 2 true
effect @a[score_CTFActive_min=1,score_CTFActive=1] weakness 1 100 true
effect @a[score_CTFActive_min=1,score_CTFActive=1] instant_health 1 2 true

# Kill items and xp
kill @e[score_CTFActive_min=1,type=item,tag=!CTFFlag]
kill @e[score_CTFActive_min=1,type=xp_orb]
kill @e[score_CTFActive_min=1,type=arrow]
# Remove flags as to not give players the false message that they stil have it
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1] slot.hotbar.4 air 1 0

# Summon end countdown timer if it doesn't exist
execute @e[type=armor_stand,tag=CTFExists] ~ ~ ~ execute @e[type=area_effect_cloud,tag=CTFEndTimer] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 1
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:201,Tags:["CTFEndTimer"]}
scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 0

# Add tags to fireworks and area effect clouds according to their age/life
scoreboard players tag @e[type=area_effect_cloud,tag=CTFEndTimer] add CTFInitialRocket {Age:0}
scoreboard players tag @e[type=fireworks_rocket,tag=CTFFireworkTimer,c=1] add CTFCreateRocket {Life:20}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFEndTimer] add CTFEndGame {Age:200}

# Determine the winner based on score
# Take the difference in score (Red - Blue) to determine the winning team
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ scoreboard players operation @e[type=armor_stand,tag=CTFGame] CTFScoreKeeper = Red CTFScore
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ scoreboard players operation @e[type=armor_stand,tag=CTFGame] CTFScoreKeeper -= Blue CTFScore
# Summon the initial firework for the winning team
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=1] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ summon fireworks_rocket ~ ~3 ~ {LifeTime:21,Tags:["CTFFireworkTimer"]}
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper=-1] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ summon fireworks_rocket ~ ~3 ~ {LifeTime:21,Tags:["CTFFireworkTimer"]}
# Announce winners
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=0,score_CTFScoreKeeper=0] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=3] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["Stalemate!"]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=0,score_CTFScoreKeeper=0] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=3] ~ ~ ~ title @a[score_CTFActive_min=1] subtitle ["Stalemate!"]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=1] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["", {"text":"Red","color":"red"}, " team has won!"]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=1] ~ ~ ~ title @a[score_CTFActive_min=1] subtitle ["", {"text":"Red","color":"red"}, " team has won!"]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper=-1] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["", {"text":"Blue","color":"blue"}, " team has won!"]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper=-1] ~ ~ ~ title @a[score_CTFActive_min=1] subtitle ["", {"text":"Blue","color":"blue"}, " team has won!"]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ title @a[score_CTFActive_min=1] title [""]
# List players on winning team to event coordinators
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=1] ~ ~ ~ tellraw @a[score_CTFActive_min=1,score_MCTeams_min=8,score_MCTeams=8] ["Players on winning team: ", {"selector":"@a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed]"}]
execute @e[type=area_effect_cloud,tag=CTFInitialRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper=-1] ~ ~ ~ tellraw @a[score_CTFActive_min=1,score_MCTeams_min=8,score_MCTeams=8] ["Players on winning team: ", {"selector":"@a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue]"}]

# Summon another rocket if the existing ones have reached their time limit
execute @e[type=fireworks_rocket,tag=CTFCreateRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper_min=1] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ summon fireworks_rocket ~ ~3 ~ {LifeTime:21,Tags:["CTFFireworkTimer"]}
execute @e[type=fireworks_rocket,tag=CTFCreateRocket] ~ ~ ~ execute @e[type=armor_stand,tag=CTFGame,score_CTFScoreKeeper=-1] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ summon fireworks_rocket ~ ~3 ~ {LifeTime:21,Tags:["CTFFireworkTimer"]}

# Reset the game and switch to game state 0
execute @e[type=area_effect_cloud,tag=CTFEndGame] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint]
execute @e[type=area_effect_cloud,tag=CTFEndGame] ~ ~ ~ scoreboard players operation @e[type=armor_stand,tag=CTFGame] CTFRoundTime = TimeInTicks CTFRoundTime
execute @e[type=area_effect_cloud,tag=CTFEndGame] ~ ~ ~ scoreboard players set Red CTFScore 0
execute @e[type=area_effect_cloud,tag=CTFEndGame] ~ ~ ~ scoreboard players set Blue CTFScore 0
execute @e[type=area_effect_cloud,tag=CTFEndGame] ~ ~ ~ scoreboard players set * CTFFlagTracker 0
execute @e[type=area_effect_cloud,tag=CTFEndGame] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFGame] CTFGameState 0

# Remove the tags
scoreboard players tag @e[type=area_effect_cloud,tag=CTFInitialRocket] remove CTFInitialRocket
scoreboard players tag @e[type=fireworks_rocket,tag=CTFCreateRocket] remove CTFCreateRocket
scoreboard players tag @e[type=area_effect_cloud,tag=CTFEndGame] remove CTFEndGame
