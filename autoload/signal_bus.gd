extends Node

signal _set_mover_speed_modifier(modifier: float)
signal _rotate_all_arrows(degrees)
signal _randomize_player_positions()
signal _set_spawner_rates(spawnRateList: Array[SpawnRate])
signal _set_spawner_modifier(modifier: float)
signal _display_menu(menuType: int)
signal _pause_unpause()
signal _set_game_state(state: int)
signal _spawn_mover(mover: Mover)
signal _freeze_unfreeze(componentIdsToFreeze, freeze: bool)
signal _end_event()
signal _choose_map(map: PlayMap)
