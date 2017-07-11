# This condition must pass before the rest of the commands in this file run.
testfor @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=2,score_CTFGameState=2]
# For command block chains initially facing towards positive x (don't set to "Always Active", must be turned on/off with the condition above. Otherwise, it may keep running even after the arena is turned off):
# setblock ~ ~ ~ repeating_command_block 13 replace {TrackOutput:0b,auto:0b}

# Respawn. Teleport all players in a 3 block radius around the lobby spawn point to their team's spawn point. Also resupply their inventory
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ clear @a[score_CTFActive_min=1,score_CTFActive=1,r=3] arrow
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,r=3] slot.hotbar.0 iron_sword 1 0 {Unbreakable:1}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,r=3] slot.hotbar.1 bow 1 0 {Unbreakable:1}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,r=3] slot.hotbar.7 arrow 32 0

execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed,r=3] slot.hotbar.8 wool 1 14 {display:{Name:"Your Team"}}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed,r=3] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFRedSpawnPoint]

execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue,r=3] slot.hotbar.8 wool 1 11 {display:{Name:"Your Team"}}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue,r=3] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueSpawnPoint]

# Saturation
effect @a[score_CTFActive_min=1,score_CTFActive=1] saturation 1 2 true

# Regeneration I
execute @e[type=armor_stand,tag=CTFExists] ~ ~ ~ execute @e[type=area_effect_cloud,tag=CTFRegenTimer] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 1
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:51,Tags:["CTFRegenTimer"]}
scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 0

scoreboard players tag @e[type=area_effect_cloud,tag=CTFRegenTimer] add CTFHealthTick {Age:50}
execute @e[type=area_effect_cloud,tag=CTFHealthTick] ~ ~ ~ effect @a[score_CTFActive_min=1,score_CTFActive=1] regeneration 4 0 true
scoreboard players tag @e[type=area_effect_cloud,tag=CTFRegenTimer] remove CTFHealthTick

# Kill dropped items, xp, and arrows no longer in the air
kill @e[score_CTFActive_min=1,type=item,tag=!CTFFlag]
kill @e[score_CTFActive_min=1,type=xp_orb]

scoreboard players tag @e[score_CTFActive_min=1,type=arrow] add InGround {inGround:1b}
kill @e[score_CTFActive_min=1,type=arrow,tag=InGround]

# Resupply points
scoreboard players add @a[score_CTFActive_min=1,score_CTFActive=1] CTFResupply 0

execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1] ~ ~ ~ clear @p arrow
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1] ~ ~ ~ replaceitem entity @p slot.hotbar.0 iron_sword 1 0 {Unbreakable:1}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1] ~ ~ ~ replaceitem entity @p slot.hotbar.1 bow 1 0 {Unbreakable:1}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1] ~ ~ ~ replaceitem entity @p slot.hotbar.7 arrow 32 0

execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1,team=CTFRed] ~ ~ ~ replaceitem entity @p slot.hotbar.8 wool 1 14 {display:{Name:"Your Team"}}
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1,team=CTFBlue] ~ ~ ~ replaceitem entity @p slot.hotbar.8 wool 1 11 {display:{Name:"Your Team"}}

execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ effect @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1] instant_health 1 0

# Start cooldown timer
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFResupplyPoint] ~ ~ ~ scoreboard players set @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFResupply=0,r=1] CTFResupply 60

# Count down resupply cooldown timer
scoreboard players remove @a[score_CTFResupply_min=1] CTFResupply 1

### Flag Mechanics ###

# If the player died, drop the flag, reset scoreboards
scoreboard players tag @a[score_CTFFlagTracker_min=1,score_CTFDeathCount_min=1] add CTFResetFlag
# Kill all existing flag trackers
execute @a[tag=CTFResetFlag,team=CTFRed] ~ ~ ~ kill @e[type=area_effect_cloud,tag=CTFBlueFlagTracker]
execute @a[tag=CTFResetFlag,team=CTFBlue] ~ ~ ~ kill @e[type=area_effect_cloud,tag=CTFRedFlagTracker]
# Drop the flag
execute @a[tag=CTFResetFlag,team=CTFRed] ~ ~ ~ summon item ~ ~ ~ {Tags:["CTFBlueFlag","CTFFlag"],PickupDelay:32767,Age:-32768,Item:{id:"wool",Count:1,Damage:11},CustomName:"Blue Flag",CustomNameVisible:true,Glowing:true}
execute @a[tag=CTFResetFlag,team=CTFBlue] ~ ~ ~ summon item ~ ~ ~ {Tags:["CTFRedFlag","CTFFlag"],PickupDelay:32767,Age:-32768,Item:{id:"wool",Count:1,Damage:14},CustomName:"Red Flag",CustomNameVisible:true,Glowing:true}
execute @a[tag=CTFResetFlag,team=CTFRed] ~ ~ ~ scoreboard teams join CTFVBlue @e[type=item,tag=CTFBlueFlag]
execute @a[tag=CTFResetFlag,team=CTFBlue] ~ ~ ~ scoreboard teams join CTFVRed @e[type=item,tag=CTFRedFlag]
# Create flag drop timer
execute @a[tag=CTFResetFlag,team=CTFRed] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:1201,Tags:["CTFBlueFlagTimer"]}
execute @a[tag=CTFResetFlag,team=CTFBlue] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:1201,Tags:["CTFRedFlagTimer"]}
# Announce flag drop
execute @a[tag=CTFResetFlag,team=CTFRed] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@a[tag=CTFResetFlag,team=CTFRed]"}, " has dropped the ", {"text":"Blue","color":"blue"}, " flag!"]
execute @a[tag=CTFResetFlag,team=CTFBlue] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@a[tag=CTFResetFlag,team=CTFBlue]"}, " has dropped the ", {"text":"Red","color":"red"}, " flag!"]
execute @a[tag=CTFResetFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.snare master @p ~ ~ ~
scoreboard players set @a[tag=CTFResetFlag] CTFFlagTracker 0
scoreboard players tag @a[tag=CTFResetFlag] remove CTFResetFlag

# Disconnect detection, change team detection, becoming spectate detection, going out of bounds detection
scoreboard players set @a[score_CTFActive_min=2,score_CTFFlagTracker_min=1] CTFFlagTracker 0
scoreboard players set @a[score_CTFActive=0,score_CTFFlagTracker_min=1] CTFFlagTracker 0
scoreboard players set @a[score_CTFFlagTracker_min=1,score_CTFDisconnect_min=1] CTFFlagTracker 0
scoreboard players set @a[score_CTFDisconnect_min=1] CTFDisconnect 0

# Detect when the flag holder disappears. Announce that the flag was returned
# Create an area of effect cloud that lasts for 2 ticks. Execute on the flag holder to kill the area of effect cloud at its last tick. If the cloud isn't killed, it means that the flag holder is missing. Therefore, the flag holder has disappeared!
execute @a[score_CTFFlagTracker_min=1,team=CTFBlue] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:2,Tags:["CTFRedFlagTracker","CTFPlayerFlagTracker"]}
execute @a[score_CTFFlagTracker_min=1,score_CTFDeathCount=0,team=CTFBlue] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,tag=CTFRedFlagTracker] add CTFKillFlagTracker {Age:1}
kill @e[type=area_effect_cloud,tag=CTFKillFlagTracker]

scoreboard players tag @e[type=area_effect_cloud,tag=CTFRedFlagTracker] add CTFReturnRedFlag {Age:1}
execute @e[type=area_effect_cloud,tag=CTFReturnRedFlag] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["The ", {"text":"Red","color":"red"}, " flag has been returned to its base!"]
execute @e[type=area_effect_cloud,tag=CTFReturnRedFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.hat master @p ~ ~ ~

execute @a[score_CTFFlagTracker_min=1,team=CTFRed] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:2,Tags:["CTFBlueFlagTracker","CTFPlayerFlagTracker"]}
execute @a[score_CTFFlagTracker_min=1,score_CTFDeathCount=0,team=CTFRed] ~ ~ ~ scoreboard players tag @e[type=area_effect_cloud,tag=CTFBlueFlagTracker] add CTFKillFlagTracker {Age:1}
kill @e[type=area_effect_cloud,tag=CTFKillFlagTracker]

scoreboard players tag @e[type=area_effect_cloud,tag=CTFBlueFlagTracker] add CTFReturnBlueFlag {Age:1}
execute @e[type=area_effect_cloud,tag=CTFReturnBlueFlag] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["The ", {"text":"Blue","color":"blue"}, " flag has been returned to its base!"]
execute @e[type=area_effect_cloud,tag=CTFReturnBlueFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.hat master @p ~ ~ ~

# Assume the flag markers are holding the flag
scoreboard players set @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedFlagMarker] CTFFlagTracker 1
scoreboard players set @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueFlagMarker] CTFFlagTracker 1

# Give the flag to the person nearest it of the opposite team
execute @e[type=item,tag=CTFRedFlag] ~ ~ ~ scoreboard players tag @p[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue,r=1] add CTFPickupRedFlag
execute @e[type=item,tag=CTFBlueFlag] ~ ~ ~ scoreboard players tag @p[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed,r=1] add CTFPickupBlueFlag

scoreboard players set @a[tag=CTFPickupRedFlag] CTFFlagTracker 1
scoreboard players set @a[tag=CTFPickupBlueFlag] CTFFlagTracker 1

execute @a[tag=CTFPickupRedFlag] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@a[tag=CTFPickupRedFlag]"}, " has taken the ", {"text":"Red","color":"red"}, " flag!"]
execute @a[tag=CTFPickupRedFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.hat master @p ~ ~ ~
execute @a[tag=CTFPickupBlueFlag] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@a[tag=CTFPickupBlueFlag]"}, " has taken the ", {"text":"Blue","color":"blue"}, " flag!"]
execute @a[tag=CTFPickupBlueFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.hat master @p ~ ~ ~

# Kill the flag timers (when a player dies with the flag) if there are any
execute @a[tag=CTFPickupRedFlag] ~ ~ ~ kill @e[type=area_effect_cloud,tag=CTFRedFlagTimer]
execute @a[tag=CTFPickupBlueFlag] ~ ~ ~ kill @e[type=area_effect_cloud,tag=CTFBlueFlagTimer]

scoreboard players tag @a remove CTFPickupRedFlag
scoreboard players tag @a remove CTFPickupBlueFlag

# Get the flag holder player to tell the respective flag marker that the flag marker isn't holding the flag
execute @p[score_CTFActive_min=1,score_CTFActive=1,score_CTFFlagTracker_min=1,team=CTFBlue] ~ ~ ~ scoreboard players set @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedFlagMarker] CTFFlagTracker 0
execute @p[score_CTFActive_min=1,score_CTFActive=1,score_CTFFlagTracker_min=1,team=CTFRed] ~ ~ ~ scoreboard players set @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueFlagMarker] CTFFlagTracker 0 

# Show the flag in the inventory
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFFlagTracker=0] slot.hotbar.4 air 1 0
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFFlagTracker_min=1,team=CTFRed] slot.hotbar.4 wool 1 11 {display:{Name:"Enemy Flag"},ench:[{id:19,lvl:1}]}
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,score_CTFFlagTracker_min=1,team=CTFBlue] slot.hotbar.4 wool 1 14 {display:{Name:"Enemy Flag"},ench:[{id:19,lvl:1}]}

# If the flag marker isn't holding the flag, a player must be. So kill existing flags
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedFlagMarker,score_CTFFlagTracker=0] ~ ~ ~ kill @e[type=item,tag=CTFRedFlag]
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueFlagMarker,score_CTFFlagTracker=0] ~ ~ ~ kill @e[type=item,tag=CTFBlueFlag]

# Summon a flag if the marker is holding it. Don't summon if one already exists
execute @e[type=armor_stand,tag=CTFExists] ~ ~ ~ execute @e[type=item,tag=CTFRedFlag] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 1
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedFlagMarker,score_CTFFlagTracker_min=1] ~ ~ ~ summon item ~ ~ ~ {Tags:["CTFRedFlag","CTFFlag"],PickupDelay:32767,Age:-32768,Item:{id:"wool",Count:1,Damage:14},CustomName:"Red Flag",CustomNameVisible:true,Glowing:true}
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedFlagMarker,score_CTFFlagTracker_min=1] ~ ~ ~ scoreboard teams join CTFVRed @e[type=item,tag=CTFRedFlag]
scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 0

execute @e[type=armor_stand,tag=CTFExists] ~ ~ ~ execute @e[type=item,tag=CTFBlueFlag] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 1
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueFlagMarker,score_CTFFlagTracker_min=1] ~ ~ ~ summon item ~ ~ ~ {Tags:["CTFBlueFlag","CTFFlag"],PickupDelay:32767,Age:-32768,Item:{id:"wool",Count:1,Damage:11},CustomName:"Blue Flag",CustomNameVisible:true,Glowing:true}
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueFlagMarker,score_CTFFlagTracker_min=1] ~ ~ ~ scoreboard teams join CTFVBlue @e[type=item,tag=CTFBlueFlag]
scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 0

# Expose the thief!
effect @a[score_CTFActive_min=1,score_CTFFlagTracker_min=1] glowing 1 0 false

# Flag drop expiration
scoreboard players tag @e[type=area_effect_cloud,tag=CTFRedFlagTimer] add CTFKillRedFlag {Age:1200}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFBlueFlagTimer] add CTFKillBlueFlag {Age:1200}

execute @e[type=area_effect_cloud,tag=CTFKillRedFlag] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["The ", {"text":"Red","color":"red"}, " flag has been returned to its base!"]
execute @e[type=area_effect_cloud,tag=CTFKillRedFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.hat master @p ~ ~ ~
execute @e[type=area_effect_cloud,tag=CTFKillBlueFlag] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["The ", {"text":"Blue","color":"blue"}, " flag has been returned to its base!"]
execute @e[type=area_effect_cloud,tag=CTFKillBlueFlag] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound block.note.hat master @p ~ ~ ~

execute @e[type=area_effect_cloud,tag=CTFKillRedFlag] ~ ~ ~ kill @e[type=item,tag=CTFRedFlag]
execute @e[type=area_effect_cloud,tag=CTFKillBlueFlag] ~ ~ ~ kill @e[type=item,tag=CTFBlueFlag]

scoreboard players tag @e[type=area_effect_cloud,tag=CTFRedFlagTimer] remove CTFKillRedFlag
scoreboard players tag @e[type=area_effect_cloud,tag=CTFBlueFlagTimer] remove CTFKillBlueFlag

# Check if flag has been captured
scoreboard players add @e[type=armor_stand,tag=CTFRedMarker] CTFFlagTracker 0
scoreboard players add @e[type=armor_stand,tag=CTFBlueMarker] CTFFlagTracker 0

execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedFlagMarker] ~ ~ ~ scoreboard players tag @p[score_CTFFlagTracker_min=1,team=CTFRed,r=1] add CTFScoreRed
# Kill flag trackers
execute @a[tag=CTFScoreRed] ~ ~ ~ kill @e[type=area_effect_cloud,tag=CTFBlueFlagTracker]
# Let go of the flag
scoreboard players set @a[tag=CTFScoreRed] CTFFlagTracker 0
# Announce score
execute @a[tag=CTFScoreRed] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@p"}, " has successfully captured the ", {"text":"Blue","color":"blue"}, " flag!"]
execute @a[tag=CTFScoreRed] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound entity.player.levelup master @p ~ ~ ~
# Remove glowing effect
effect @a[tag=CTFScoreRed] glowing 0
# Add 1 to red's score
execute @a[tag=CTFScoreRed] ~ ~ ~ scoreboard players add @e[type=armor_stand,tag=CTFRedMarker] CTFFlagTracker 1
scoreboard players tag @a[tag=CTFScoreRed] remove CTFScoreRed

# Rinse and repeat for blue team
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueFlagMarker] ~ ~ ~ scoreboard players tag @p[score_CTFFlagTracker_min=1,team=CTFBlue,r=1] add CTFScoreBlue
execute @a[tag=CTFScoreBlue] ~ ~ ~ kill @e[type=area_effect_cloud,tag=CTFRedFlagTracker]
scoreboard players set @a[tag=CTFScoreBlue] CTFFlagTracker 0
execute @a[tag=CTFScoreBlue] ~ ~ ~ tellraw @a[score_CTFActive_min=1] [{"selector":"@p"}, " has successfully captured the ", {"text":"Red","color":"red"}, " flag!"]
execute @a[tag=CTFScoreBlue] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound entity.player.levelup master @p ~ ~ ~
effect @a[tag=CTFScoreBlue] glowing 0
execute @a[tag=CTFScoreBlue] ~ ~ ~ scoreboard players add @e[type=armor_stand,tag=CTFBlueMarker] CTFFlagTracker 1
scoreboard players tag @a[tag=CTFScoreBlue] remove CTFScoreBlue

# Update Score scoreboard
scoreboard players operation Red CTFScore = @e[type=armor_stand,tag=CTFRedMarker] CTFFlagTracker
scoreboard players operation Blue CTFScore = @e[type=armor_stand,tag=CTFBlueMarker] CTFFlagTracker

# Check if red or blue have reached the winning score
scoreboard players operation @e[type=armor_stand,tag=CTFRedMarker] CTFScoreKeeper = @e[type=armor_stand,tag=CTFRedMarker] CTFFlagTracker
scoreboard players operation @e[type=armor_stand,tag=CTFRedMarker] CTFScoreKeeper -= Winning_Score CTFScore
scoreboard players operation @e[type=armor_stand,tag=CTFBlueMarker] CTFScoreKeeper = @e[type=armor_stand,tag=CTFBlueMarker] CTFFlagTracker
scoreboard players operation @e[type=armor_stand,tag=CTFBlueMarker] CTFScoreKeeper -= Winning_Score CTFScore
# Change to game state 3 if the winning score has been reached
execute @e[type=armor_stand,tag=CTFRedMarker,score_CTFScoreKeeper_min=0] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFGame] CTFGameState 3
execute @e[type=armor_stand,tag=CTFBlueMarker,score_CTFScoreKeeper_min=0] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFGame] CTFGameState 3

# Change to game state 3 if the time limit has been reached
scoreboard players set @e[type=armor_stand,tag=CTFGame,score_CTFRoundTime=0] CTFGameState 3
execute @e[type=armor_stand,tag=CTFGame,score_CTFRoundTime_min=0,score_CTFRoundTime=0] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["Time is up!"]

# Reset death counter
scoreboard players set @a CTFDeathCount 0

# Count down on timer
scoreboard players remove @e[type=armor_stand,tag=CTFGame] CTFRoundTime 1
