- Demo first en second maken (bron: Java 9 and beyond (Venkat S.), modules: https://youtu.be/oRcOiGWK9Ts?t=5121)
	1. zonder module en  dependency (1-..cmd) en run in classpath
	2. zonder module mét dependency (2-..cmd) en run in a) classpath en b) modulepath incl. tonen modulename (getmodule())
		a. unnnamed module:  jar in classpath, one happy family
		b. automatic module: jar in module path
	3. met module-info (explicitly named module),
		a. start without requires/exports
		b. now with requires (1), then exports (2)
	4. tonen/runnen 4-....cmd
	5. fail fast
		remove first.jar
		run second:
			java -p output\mlib -m second/com.example.second.Second
		vroeger: at runtime op een bepaald moment crash (tonen via aanroep helpen , build met 2 en first verwijderen)
		nu: tijdens opstarten second al meteen fout: tonen via build met 3 en jar verwijderen)

- Demo jlink voor non-modular: run 1-..., jlink-build en jlink-run.