(define (domain meetingplanningexample18)
  (:requirements :strips :typing :negative-preconditions :action-costs :numeric-fluents)
  (:types location)
  (:predicates
    (at ?l - location)
    (met-betty)
  )
  (:functions
    (clock)
    (total-cost)
  )

  ; Waiting actions (cost-free), to advance time while respecting the horizon
  (:action wait-1
    :precondition (<= (clock) 1349)
    :effect (increase (clock) 1)
  )
  (:action wait-9
    :precondition (<= (clock) 1341)
    :effect (increase (clock) 9)
  )
  (:action wait-10
    :precondition (<= (clock) 1340)
    :effect (increase (clock) 10)
  )
  (:action wait-19
    :precondition (<= (clock) 1331)
    :effect (increase (clock) 19)
  )
  (:action wait-30
    :precondition (<= (clock) 1320)
    :effect (increase (clock) 30)
  )
  (:action wait-40
    :precondition (<= (clock) 1310)
    :effect (increase (clock) 40)
  )
  (:action wait-60
    :precondition (<= (clock) 1290)
    :effect (increase (clock) 60)
  )
  (:action wait-120
    :precondition (<= (clock) 1230)
    :effect (increase (clock) 120)
  )
  (:action wait-180
    :precondition (<= (clock) 1170)
    :effect (increase (clock) 180)
  )
  (:action wait-240
    :precondition (<= (clock) 1110)
    :effect (increase (clock) 240)
  )
  (:action wait-300
    :precondition (<= (clock) 1050)
    :effect (increase (clock) 300)
  )

  ; Directed travel actions with costs equal to travel minutes
  (:action travel-m-r
    :parameters ()
    :precondition (and (at marina) (<= (clock) 1339))
    :effect (and
      (not (at marina))
      (at richmond)
      (increase (clock) 11)
      (increase (total-cost) 11)
    )
  )
  (:action travel-r-m
    :parameters ()
    :precondition (and (at richmond) (<= (clock) 1341))
    :effect (and
      (not (at richmond))
      (at marina)
      (increase (clock) 9)
      (increase (total-cost) 9)
    )
  )

  ; Meeting actions: enforce continuous block within Betty's availability window
  ; Window: 20:30 (1230) to 22:00 (1320)
  ; Start bounds ensure meeting ends by 1320
  (:action meet-betty-75
    :parameters ()
    :precondition (and (not (met-betty)) (at richmond) (>= (clock) 1230) (<= (clock) 1245))
    :effect (and
      (increase (clock) 75)
      (met-betty)
    )
  )
  (:action meet-betty-80
    :parameters ()
    :precondition (and (not (met-betty)) (at richmond) (>= (clock) 1230) (<= (clock) 1240))
    :effect (and
      (increase (clock) 80)
      (met-betty)
    )
  )
  (:action meet-betty-85
    :parameters ()
    :precondition (and (not (met-betty)) (at richmond) (>= (clock) 1230) (<= (clock) 1235))
    :effect (and
      (increase (clock) 85)
      (met-betty)
    )
  )
  (:action meet-betty-90
    :parameters ()
    :precondition (and (not (met-betty)) (at richmond) (>= (clock) 1230) (<= (clock) 1230))
    :effect (and
      (increase (clock) 90)
      (met-betty)
    )
  )
)