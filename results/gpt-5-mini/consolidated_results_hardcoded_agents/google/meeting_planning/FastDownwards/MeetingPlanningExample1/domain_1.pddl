(define (domain richmond-financial-scheduling)
  (:requirements :strips :negative-preconditions :fluents)
  (:predicates
    (at-richmond)
    (at-financial)
  )
  (:functions
    (time)       ;; numeric global time in minutes from midnight
    (met-betty)  ;; cumulative meeting minutes with Betty
  )

  ;; Travel from Richmond to Financial District: 22 minutes
  (:action travel-richmond-to-financial
    :precondition (and
                    (at-richmond)
                    (not (at-financial))
                  )
    :effect (and
              (not (at-richmond))
              (at-financial)
              (increase (time) 22)
            )
  )

  ;; Travel from Financial to Richmond: 21 minutes
  (:action travel-financial-to-richmond
    :precondition (and
                    (at-financial)
                    (not (at-richmond))
                  )
    :effect (and
              (not (at-financial))
              (at-richmond)
              (increase (time) 21)
            )
  )

  ;; Wait 5 minutes in Richmond
  (:action wait-5-in-richmond
    :precondition (and
                    (at-richmond)
                    (not (at-financial))
                  )
    :effect (and
              (increase (time) 5)
            )
  )

  ;; Wait 5 minutes in Financial
  (:action wait-5-in-financial
    :precondition (and
                    (at-financial)
                    (not (at-richmond))
                  )
    :effect (and
              (increase (time) 5)
            )
  )

  ;; Meeting actions with Betty at Financial District.
  ;; Betty availability window: start = 1035 (17:15), end = 1305 (21:45).
  ;; meet-betty-60: 60-minute atomic meeting; can only start at times such that it will finish by 1305.
  (:action meet-betty-60
    :precondition (and
                    (at-financial)
                    (>= (time) 1035)
                    (<= (time) 1245)  ;; ensures meeting ends by 1305
                  )
    :effect (and
              (increase (time) 60)
              (increase (met-betty) 60)
            )
  )

  ;; meet-betty-15: 15-minute atomic meeting block; can only start if it will finish by 1305.
  (:action meet-betty-15
    :precondition (and
                    (at-financial)
                    (>= (time) 1035)
                    (<= (time) 1290)  ;; ensures meeting ends by 1305
                  )
    :effect (and
              (increase (time) 15)
              (increase (met-betty) 15)
            )
  )
)