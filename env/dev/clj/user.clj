(ns user
  (:require [pulap.config :refer [env]]
            [mount.core :as mount]
            [pulap.figwheel :refer [start-fw stop-fw cljs]]
            [pulap.core :refer [start-app]]
            [conman.core :as conman]
            [luminus-migrations.core :as migrations]))

(defn start []
  (mount/start-without #'pulap.core/repl-server))

(defn stop []
  (mount/stop-except #'pulap.core/repl-server))

(defn restart []
  (stop)
  (start))

(defn restart-db []
  (mount/stop #'pulap.db.core/*db*)
  (mount/start #'pulap.db.core/*db*)
  (binding [*ns* 'pulap.db.core]
    (conman/bind-connection pulap.db.core/*db* "sql/queries.sql")))

(defn reset-db []
  (migrations/migrate ["reset"] (select-keys env [:database-url])))

(defn migrate []
  (migrations/migrate ["migrate"] (select-keys env [:database-url])))

(defn rollback []
  (migrations/migrate ["rollback"] (select-keys env [:database-url])))

(defn create-migration [name]
  (migrations/create name (select-keys env [:database-url])))


