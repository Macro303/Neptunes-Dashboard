package macro.neptunes.core.game

import io.javalin.Context
import macro.neptunes.core.game.GameHandler

/**
 * Created by Macro303 on 2018-Nov-16.
 */
object GameController {

	fun webGet(context: Context) {
		context.html(GameHandler.game.toString())
	}

	fun apiGet(context: Context) {
		if (context.status() >= 400)
			return
		context.json(GameHandler.game)
	}
}