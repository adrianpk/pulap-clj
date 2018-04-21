(ns pulap.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[pulap started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[pulap has shut down successfully]=-"))
   :middleware identity})
