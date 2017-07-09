# This condition must pass before the rest of the commands in this file run.
testfor @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=1,score_CTFGameState=1]
# For command block chains initially facing towards positive x (don't set to "Always Active", must be turned on/off with the condition above. Otherwise, it may keep running even after the arena is turned off):
# setblock ~ ~ ~ minecraft:repeating_command_block 13 replace {TrackOutput:0b,auto:0b}

# Effects
effect @a[score_CTFActive_min=1,score_CTFActive=1] saturation 1 2 true
effect @a[score_CTFActive_min=1,score_CTFActive=1] instant_health 1 2 true

# Kill items and xp
kill @e[score_CTFActive_min=1,type=item]
kill @e[score_CTFActive_min=1,type=xp_orb]
kill @e[score_CTFActive_min=1,type=arrow]

# Teleport and keep players in their team spawn. Also resupply their inventories incase they somehow die
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedSpawnPoint] ~ ~ ~ scoreboard players tag @a[score_CTFActive_min=1,score_CTFActive=1,r=3,team=CTFRed] add InSpawn
execute @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueSpawnPoint] ~ ~ ~ scoreboard players tag @a[score_CTFActive_min=1,score_CTFActive=1,r=3,team=CTFBlue] add InSpawn

execute @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn,team=CTFRed] ~ ~ ~ tp @p @e[score_CTFActive_min=1,type=armor_stand,tag=CTFRedSpawnPoint,c=1]
execute @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn,team=CTFBlue] ~ ~ ~ tp @p @e[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueSpawnPoint,c=1]

clear @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn] arrow
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn] slot.hotbar.0 iron_sword 1 0 {Unbreakable:1}
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn] slot.hotbar.1 bow 1 0 {Unbreakable:1}
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn] slot.hotbar.7 arrow 32 0
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn,team=CTFRed] slot.hotbar.8 wool 1 14 {display:{Name:"Your Team"}}
replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn,team=CTFBlue] slot.hotbar.8 wool 1 11 {display:{Name:"Your Team"}}

scoreboard players tag @a[tag=InSpawn] remove InSpawn

# Create countdown start timer if it does not already exist
execute @e[type=armor_stand,tag=CTFExists] ~ ~ ~ execute @e[type=area_effect_cloud,tag=CTFStartTimer] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 1
execute @e[type=armor_stand,tag=CTFExists,score_CTFExists=0] ~ ~ ~ summon area_effect_cloud ~ ~ ~ {Duration:201,Tags:["CTFStartTimer"]}
scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 0

# Add a different tag depending on the age of the area effect cloud
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFCount10 {Age:1}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFCount5 {Age:100}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFCount4 {Age:120}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFCount3 {Age:140}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFCount2 {Age:160}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFCount1 {Age:180}
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStartTimer] add CTFStart {Age:200}

# Execute the commands that correspond to each age
execute @e[type=area_effect_cloud,tag=CTFCount10] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["Capture the Flag begins in 10 seconds"]
execute @e[type=area_effect_cloud,tag=CTFCount10] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:block.note.pling master @p
execute @e[type=area_effect_cloud,tag=CTFCount5] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["5"]
execute @e[type=area_effect_cloud,tag=CTFCount5] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:block.note.pling master @p
execute @e[type=area_effect_cloud,tag=CTFCount4] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["4"]
execute @e[type=area_effect_cloud,tag=CTFCount4] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:block.note.pling master @p
execute @e[type=area_effect_cloud,tag=CTFCount3] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["3"]
execute @e[type=area_effect_cloud,tag=CTFCount3] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:block.note.pling master @p
execute @e[type=area_effect_cloud,tag=CTFCount2] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["2"]
execute @e[type=area_effect_cloud,tag=CTFCount2] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:block.note.pling master @p
execute @e[type=area_effect_cloud,tag=CTFCount1] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["1"]
execute @e[type=area_effect_cloud,tag=CTFCount1] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:block.note.pling master @p
execute @e[type=area_effect_cloud,tag=CTFStart] ~ ~ ~ tellraw @a[score_CTFActive_min=1] ["Begin!"]
execute @e[type=area_effect_cloud,tag=CTFStart] ~ ~ ~ execute @a[score_CTFActive_min=1] ~ ~ ~ playsound minecraft:entity.wither.death master @p
execute @e[type=area_effect_cloud,tag=CTFStart] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFGame] CTFGameState 2

# Remove the tags
scoreboard players tag @e[type=area_effect_cloud,tag=CTFCount10] remove CTFCount10
scoreboard players tag @e[type=area_effect_cloud,tag=CTFCount5] remove CTFCount5
scoreboard players tag @e[type=area_effect_cloud,tag=CTFCount4] remove CTFCount4
scoreboard players tag @e[type=area_effect_cloud,tag=CTFCount3] remove CTFCount3
scoreboard players tag @e[type=area_effect_cloud,tag=CTFCount2] remove CTFCount2
scoreboard players tag @e[type=area_effect_cloud,tag=CTFCount1] remove CTFCount1
scoreboard players tag @e[type=area_effect_cloud,tag=CTFStart] remove CTFStart
