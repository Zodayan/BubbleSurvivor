extends AnimatedSprite2D

@onready var Sprite = $BubbleSprite

func updateSprite(ratio, direction) :
		if (ratio < 0.33) :
			if (direction > 0):
				self.play("smallSizeRight")
			else :
				self.play("smallSizeLeft")
			return 2
		elif (ratio < 0.67) :
			if (direction > 0):
				self.play("middleSizeRight")
			else :
				self.play("middleSizeLeft")
			return 4
		else :
			if (direction > 0):
				self.play("bigSizeRight")
			else :
				self.play("bigSizeLeft")
			return 5
