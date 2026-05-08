(define (domain richmond-financial-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:predicates
    ;; location propositions (mutually exclusive in effect design)
    (at-richmond)
    (at-financial)
  )
  (:functions
    ;; global numeric timeline in minutes from midnight
    (time)
    ;; cumulative meeting minutes accrued with Betty
    (met-betty)
  )

  ;; Travel from Richmond to Financial District: asymmetric travel time = 22
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

  ;; Travel from Financial District to Richmond: asymmetric travel time = 21
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

  ;; Wait actions in 5-minute increments. Two actions avoid disjunctive preconditions.
  (:action wait-5-in-richmond
    :precondition (and
                    (at-richmond)
                    (not (at-financial))
                  )
    :effect (and
              (increase (time) 5)
            )
  )

  (:action wait-5-in-financial
    :precondition (and
                    (at-financial)
                    (not (at-richmond))
                  )
    :effect (and
              (increase (time) 5)
            )
  )

  ;; Meeting actions with Betty. Each action is atomic: it advances time by the meeting
  ;; duration and increases met-betty by the same amount. Availability constraints
  ;; are enforced in preconditions so meetings can only begin in the allowed window.
  ;; Note: availability window for Betty is start = 1035 (17:15). The overall
  ;; availability end is 1305; the actions require start times such that meeting
  ;; finishes by 1305 (hence start <= 1245 for 60-min meeting, <=1290 for 15-min).
  (:action meet-betty-60
    :precondition (and
                    (at-financial)
                    (>= (time) 1035)
                    (<= (time) 1245)  ;; ensures meeting will end by 1305
                  )
    :effect (and
              (increase (time) 60)
              (increase (met-betty) 60)
            )
  )

  (:action meet-betty-15
    :precondition (and
                    (at-financial)
                    (>= (time) 1035)
                    (<= (time) 1290)  ;; ensures meeting will end by 1305
                  )
    :effect (and
              (increase (time) 15)
              (increase (met-betty) 15)
            )
  )
)