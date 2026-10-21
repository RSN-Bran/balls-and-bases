extends Mover
class_name SpikeBall

func get_worth(player):
	return floor(player.score/3)*-1
