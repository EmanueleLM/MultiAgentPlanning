(define (domain rendezvous)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types agent friend location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?f - friend)
  )
  (:functions
    (time)          ; current time in minutes from midnight
    (met-count)     ; number of friends met
  )

  ; Travel actions for the traveler (distinct agent actions kept separate)
  (:action move-marina-to-embarcadero
    :parameters ()
    :precondition (and
      (at traveler marina)
    )
    :effect (and
      (not (at traveler marina))
      (at traveler embarcadero)
      (increase (time) 14)            ; travel time Marina -> Embarcadero = 14 minutes
    )
  )

  (:action move-embarcadero-to-marina
    :parameters ()
    :precondition (and
      (at traveler embarcadero)
    )
    :effect (and
      (not (at traveler embarcadero))
      (at traveler marina)
      (increase (time) 12)            ; travel time Embarcadero -> Marina = 12 minutes
    )
  )

  ; Wait action targeted to reach the earliest allowed meeting start (1:30PM = 810 minutes).
  ; This encodes the preference as a hard constraint: meetings must start at the earliest allowed time.
  (:action wait-until-810-at-embarcadero
    :parameters ()
    :precondition (and
      (at traveler embarcadero)
      (<= (time) 810)                 ; only usable before or at 810
    )
    :effect (and
      (assign (time) 810)             ; advance time to the earliest meeting start (exact)
    )
  )

  ; Meeting action with Barbara. Keeps agents' actions distinct: meeting invoked by traveler.
  ; Barbara's availability: Embarcadero from 810 to 1245 (1:30PM to 8:45PM).
  ; Meeting must last at least 60 minutes; we model it as a 60-minute meeting starting at earliest time 810.
  (:action meet-with-barbara
    :parameters ()
    :precondition (and
      (at traveler embarcadero)
      (= (time) 810)                  ; earliest-start constraint enforced as strict (priority given)
      (not (met traveler barbara))    ; only meet once
      ;; ensure meeting of 60 minutes fits within Barbara's availability window
      (<= (+ (time) 60) 1245)
    )
    :effect (and
      (met traveler barbara)
      (increase (met-count) 1)
      (increase (time) 60)            ; meeting duration = 60 minutes (minimum required)
    )
  )
)