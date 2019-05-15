package macro.dashboard.neptunes

import org.slf4j.LoggerFactory
import org.yaml.snakeyaml.DumperOptions
import org.yaml.snakeyaml.Yaml
import java.io.File
import java.io.FileReader
import java.io.FileWriter
import java.io.IOException
import java.net.InetSocketAddress
import java.net.Proxy
import java.time.ZoneId

/**
 * Created by Macro303 on 2018-Nov-23.
 */
class Config internal constructor(
	databaseFile: String? = null,
	serverAddress: String? = null,
	serverPort: Int? = null,
	val proxyHostname: String? = null,
	val proxyPort: Int? = null,
	gameID: Long? = null,
	gameCode: String? = null,
	gameCycle: Int? = null,
	zoneId: String? = null
) {
	val databaseFile: File = File(databaseFile ?: "Neptunes-Dashboard.db")
	val serverAddress: String = serverAddress ?: "localhost"
	val serverPort: Int = serverPort ?: 5505
	val proxy: Proxy?
		get() = if (proxyHostname == null || proxyPort == null)
			null
		else
			Proxy(Proxy.Type.HTTP, InetSocketAddress(proxyHostname, proxyPort))
	val gameID: Long = gameID ?: 1L
	val gameCode: String = gameCode ?: "Code"
	val gameCycle: Int = gameCycle ?: 1
	val zoneId: ZoneId = ZoneId.of(zoneId ?: "Pacific/Auckland")

	fun toMap(): Map<String, Any?> {
		val data = mapOf(
			"Database File" to databaseFile.path,
			"Time Zone" to zoneId.id,
			"Server" to mapOf(
				"Address" to serverAddress,
				"Port" to serverPort
			),
			"Proxy" to mapOf(
				"Host Name" to proxyHostname,
				"Port" to proxyPort
			),
			"Game" to mapOf(
				"ID" to gameID,
				"Code" to gameCode,
				"Cycle Timer" to gameCycle
			).toSortedMap()
		)
		return data.toSortedMap()
	}

	companion object {
		private val LOGGER = LoggerFactory.getLogger(this::class.java)
		private val CONFIG_FILE: File = File("config.yaml")
		private val options: DumperOptions by lazy {
			val options = DumperOptions()
			options.defaultFlowStyle = DumperOptions.FlowStyle.BLOCK
			options.isPrettyFlow = true
			options
		}
		private var YAML: Yaml = Yaml(options)
		val CONFIG: Config by lazy {
			loadConfig()
		}

		internal fun loadConfig(): Config {
			return try {
				var temp: Config? = null
				FileReader(CONFIG_FILE).use {
					val loadedConfig: Map<String, Any?> = YAML.load(it)
					temp = fromMap(data = loadedConfig)
				}
				saveConfig(config = temp!!)
				temp!!
			} catch (ioe: IOException) {
				LOGGER.warn("Config File is missing, creating `$CONFIG_FILE`")
				saveConfig()
			}
		}

		internal fun saveConfig(config: Config = Config()): Config {
			try {
				FileWriter(CONFIG_FILE).use {
					YAML.dump(config.toMap(), it)
				}
			} catch (ioe: IOException) {
				LOGGER.error("Unable to Save Config", ioe)
			}
			return config
		}

		@Suppress("UNCHECKED_CAST")
		private fun fromMap(data: Map<String, Any?>): Config {
			val databaseFile = data["Database File"] as String?
			val zoneId = data["Time Zone"] as String?
			val serverAddress = (data["Server"] as Map<String, Any?>?)?.get("Address") as String?
			val serverPort = (data["Server"] as Map<String, Any?>?)?.get("Port") as Int?
			val proxyHostname = (data["Proxy"] as Map<String, Any?>?)?.get("Host Name") as String?
			val proxyPort = (data["Proxy"] as Map<String, Any?>?)?.get("Port") as Int?
			val gameID = (data["Game"] as Map<String, Any?>?)?.get("ID") as Long?
			val gameCode = (data["Game"] as Map<String, Any?>?)?.get("Code") as String?
			val gameCycle = (data["Game"] as Map<String, Any?>?)?.get("Cycle Timer") as Int?
			return Config(
				databaseFile = databaseFile,
				serverAddress = serverAddress,
				serverPort = serverPort,
				proxyHostname = proxyHostname,
				proxyPort = proxyPort,
				gameID = gameID,
				gameCode = gameCode,
				gameCycle = gameCycle,
				zoneId = zoneId
			)
		}
	}
}