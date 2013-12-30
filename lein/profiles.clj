{:user {:plugins [[lein-midje "3.0.0"]
                  [lein-environ "0.4.0"]]
        :dependencies [[slamhound "RELEASE"]
                       [org.clojars.gjahad/debug-repl "0.3.3"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [(defn contextual-eval [ctx expr]
                       (eval   
                         `(let [~@(mapcat (fn [[k v]] [k `'~v]) ctx)] ~expr)))
                     (defmacro local-context []
                       (let [symbols (keys &env)]
                         (zipmap (map (fn [sym] `(quote ~sym)) symbols) symbols)))
                     (defn readr [prompt exit-code]
                       (let [input (clojure.main/repl-read prompt exit-code)]
                         (if (= input ::tl)
                           exit-code
                           input)))
                     ;;make a break point
                     (defmacro break []
                       `(clojure.main/repl
                         :prompt #(print "debug=> ")
                         :read readr
                         :eval (partial contextual-eval (local-context))))
                     ]}}
