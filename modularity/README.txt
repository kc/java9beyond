- Demo first en second maken (bron: Java 9 and beyond (Venkat S.), modules: https://youtu.be/oRcOiGWK9Ts?t=5121)

	1. build zonder module en  dependency (1-..cmd) en run in classpath met java 9+:
	    - Q: kan dit wel zonder modules?
	    - A: ja, backwards compatible.
	    - toon ook java --list-modules
	2. build zonder module mét dependency (2-..cmd) en run in cp en mp, incl. tonen modulename (getmodule()) met java 9+
	    - Q in welke module(s) leven de jars?
	    - A: a) classpath:
                unnnamed module:  alle jars in classpath, one happy family
	         b) modulepath:
	            automatic module: voor iedere jar, modulename==jarname
        - show-module-graph.cmd
	3. build en run mét module-info (3-..cmd) = explicitly named module
		a. eerst without requires/exports
            - Q in welke module(s) leven de jars?
            - A: a) classpath:
                    unnnamed module:  alle jars in classpath, one happy family
                 b) modulepath:
                    automatic module: voor iedere jar, modulename==jarname
		b. now with requires (1), then exports (2), then static (3)
		c. show-module-graph.cmd
	4. tonen/runnen without intermediary jar (4-...cmd)
	    - Q: can I build a module directly without intermediary jar?
	    - A: yes, but the module name in module-info should the match directory name then
	5. fail fast
	    Q: what happens when a dependency (as module) is not available?
	    A: vroeger: ooit at runtime een crash, pas als de foute code uitgevoerd wordt
           nu: tijdens opstarten app second al meteen een fout
        Demo:
            vroeger
                build met 2-...cmd
                remove firstauto.jar
                run second met: java -p output\mlib -m secondauto/com.example.second.Second
            nu
                build met 3-...cmd
                remove first.jar
                run second met: java -p output\mlib -m secondnamed/com.example.second.Second

- Demo jlink voor non-modular: run
    - 1-...cmd,
    - jlink-build.bat
    - jlink-run.bat
