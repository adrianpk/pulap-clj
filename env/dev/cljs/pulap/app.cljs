(ns ^:figwheel-no-load pulap.app
  (:require [pulap.core :as core]
            [devtools.core :as devtools]))

(enable-console-print!)

(devtools/install!)

(core/init!)
