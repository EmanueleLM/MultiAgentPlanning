(define (domain sf-meet-classical)
  (:requirements :typing :negative-preconditions :adl :fluents :action-costs)
  (:types agent location timepoint)

  (:constants
    traveler andrew - agent
    Presidio UnionSquare - location
    time540 time562 time675 time780 time930 time1035 - timepoint
  )

  (:predicates
    (at ?ag - agent ?loc - location)
    (time-at ?t - timepoint)
    (met-andrew)
  )

  (:functions
    (total-cost)
  )

  (:action travel-presidio-to-unionsq
    :parameters ()
    :precondition (and
      (at traveler Presidio)
      (time-at time540)
    )
    :effect (and
      (not (at traveler Presidio))
      (at traveler UnionSquare)
      (not (time-at time540))
      (time-at time562)
      (increase (total-cost) 0)
    )
  )

  (:action wait-at-unionsq-until-675
    :parameters ()
    :precondition (and
      (at traveler UnionSquare)
      (time-at time562)
    )
    :effect (and
      (not (time-at time562))
      (time-at time675)
      (increase (total-cost) 0)
    )
  )

  (:action meet-with-andrew-105
    :parameters ()
    :precondition (and
      (at traveler UnionSquare)
      (at andrew UnionSquare)
      (time-at time675)
    )
    :effect (and
      (not (time-at time675))
      (time-at time780)
      (met-andrew)
      (increase (total-cost) -1)
    )
  )

  (:action optional-wait-until-930
    :parameters ()
    :precondition (and
      (time-at time780)
      (at traveler UnionSquare)
    )
    :effect (and
      (not (time-at time780))
      (time-at time930)
      (increase (total-cost) 0)
    )
  )

  (:action optional-wait-until-1035
    :parameters ()
    :precondition (and
      (time-at time930)
      (at traveler UnionSquare)
    )
    :effect (and
      (not (time-at time930))
      (time-at time1035)
      (increase (total-cost) 0)
    )
  )
)