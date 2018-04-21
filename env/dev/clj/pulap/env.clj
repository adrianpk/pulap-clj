(ns pulap.env
  (:require [selmer.parser :as parser]
            [clojure.tools.logging :as log]
            [pulap.dev-middleware :refer [wrap-dev]]))

(def defaults
  {:init
   (fn []
     (parser/cache-off!)
     (log/info "\n-=[pulap started successfully using the development profile]=-"))
   :stop
   (fn []
     (log/info "\n-=[pulap has shut down successfully]=-"))
   :middleware wrap-dev})
