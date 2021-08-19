- Demo first en second maken (bron: Java 9 and beyond (Venkat S.), modules: https://youtu.be/oRcOiGWK9Ts?t=5121)

	1. Build en run second zonder module en zonder dependency (1-..cmd) en run in classpath met java 9+:
	    - Q: kan dit wel zonder modules?
	    - A: ja, backwards compatible.
	    - toon ook java --list-modules
	2. Build zonder module mét dependency en run in cp en mp, incl. tonen modulename (getmodule()) met java 9+
	    a.
            - Q in welke module(s) leven de jars?
                - Uncomment in Second: the calls to First
                - Run 2-...cmd
            - A:
                 * classpath:
                    unnnamed module:  alle jars in classpath, one happy family
                 * modulepath:
                    automatic module: voor iedere jar, modulename==jarname
            - show-module-graph.cmd
                - automatic module exports and requires everything
	    b. Second can access First's internals ...
	        - Uncomment in Second: the calls to Internal
            - Run 2-...cmd -> No problem!
	3. Build en run mét module-info (3-..cmd) = explicitly named module
		- Q: How can I make my apps modular?
            a. eerst een module-info without requires/exports --> Compile error!
            b. now with requires (1), then exports (2), then static (3)
            c. now try to use first.Internal in second --> Compile error! --> add "exports ... to ..." (or comment)
            d. show-module-graph.cmd
	4. tonen/runnen without intermediary jar (4-...cmd)
	    - Q: can I build a module directly without intermediary jar?
	    - A: yes, but the module name in module-info should the match directory name then
	5. fail fast
	    Q: what happens when a dependency (as module) is not available?
	    A: vroeger: at runtime een crash, pas als de foute code uitgevoerd wordt
           nu: tijdens opstarten app second al meteen een fout
        Demo:
            vroeger
                comment whole module-info.java
                build met 2-...cmd
                remove firstauto.jar
                run second met: java -p output\mlib -m secondauto/com.example.second.Second
            nu
                uncomment whole module-info.java
                rename module "..." to "...named"
                build met 3-...cmd
                remove first.jar
                run second met: java -p output\mlib -m secondnamed/com.example.second.Second

- Demo jlink, run:
    - 3-...cmd,
    - jlink-build.bat
    - jlink-run.bat

    - again but with additional options
