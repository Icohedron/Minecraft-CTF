# This condition must pass before the rest of the commands in this file run.
testfor @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=0,score_CTFGameState=0]
# For command block chains initially facing towards positive x (don't set to "Always Active", must be turned on/off with the condition above. Otherwise, it may keep running even after the arena is turned off):
# setblock ~ ~ ~ repeating_command_block 13 replace {TrackOutput:0b,auto:0b}

# Effects
effect @a[score_CTFActive_min=1,score_CTFActive=1] weakness 1 100 true
effect @a[score_CTFActive_min=1,score_CTFActive=1] instant_health 1 2 true
effect @a[score_CTFActive_min=1,score_CTFActive=1] saturation 1 2 true

# Kill items and xp
kill @e[score_CTFActive_min=1,type=item]
kill @e[score_CTFActive_min=1,type=xp_orb]
kill @e[score_CTFActive_min=1,type=arrow]

# Clear arrows
execute @e[type=armor_stand,tag=CTFGame,score_CTFGameState_min=0,score_CTFGameState=0] ~ ~ ~ clear @e[score_CTFActive_min=1,score_CTFActive=1] arrow

# Synchronize the timer while it is still able to be configured
scoreboard players operation @e[type=armor_stand,tag=CTFGame] CTFRoundTime = TimeInTicks CTFRoundTime

# Switch to game state 1 and teleport players to a random spawn point of their team. Give players their items
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ scoreboard players set @e[type=armor_stand,tag=CTFGame] CTFGameState 1
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFRedSpawnPoint]
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ execute @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFBlueSpawnPoint]
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ clear @a[score_CTFActive_min=1,score_CTFActive=1,tag=!InSpawn] arrow
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1] slot.hotbar.0 iron_sword 1 0 {Unbreakable:1}
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1] slot.hotbar.1 bow 1 0 {Unbreakable:1}
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1] slot.hotbar.7 arrow 32 0
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFRed] slot.hotbar.8 wool 1 14 {display:{Name:"Your Team"}}
execute @e[type=area_effect_cloud,tag=CTFStartGame] ~ ~ ~ replaceitem entity @a[score_CTFActive_min=1,score_CTFActive=1,team=CTFBlue] slot.hotbar.8 wool 1 11 {display:{Name:"Your Team"}}
