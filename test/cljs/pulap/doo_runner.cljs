(ns pulap.doo-runner
  (:require [doo.runner :refer-macros [doo-tests]]
            [pulap.core-test]))

(doo-tests 'pulap.core-test)

