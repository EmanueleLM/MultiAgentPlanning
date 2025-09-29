(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :fluents :numeric-fluents :adl :assign)
  (:types person location)
  (:predicates
    (at ?l - location)
    (met-betty)
  )
  (:functions
    (time)          ; minutes since 09:00
    (met-count)
  )

  (:action travel-marina-to-richmond
    :parameters ()
    :precondition (and (at marina) (< (time) 780))
    :effect (and
      (not (at marina))
      (at richmond)
      (increase (time) 11)
    )
  )

  (:action travel-richmond-to-marina
    :parameters ()
    :precondition (and (at richmond) (< (time) 780))
    :effect (and
      (not (at richmond))
      (at marina)
      (increase (time) 9)
    )
  )

  (:action wait-until-betty-window
    :parameters ()
    :precondition (and (<= (time) 690))
    :effect (and
      (assign (time) 690)
    )
  )

  (:action meet-betty-75
    :parameters ()
    :precondition (and
      (at richmond)
      (>= (time) 690)         ; earliest Betty availability relative to 09:00 (20:30 = 690)
      (<= (time) 705)         ; latest start so that 75-minute meeting finishes by 780 (22:00)
      (not (met-betty))
    )
    :effect (and
      (met-betty)
      (increase (met-count) 1)
      (increase (time) 75)    ; meeting duration exactly 75 minutes (minimum required)
    )
  )
)