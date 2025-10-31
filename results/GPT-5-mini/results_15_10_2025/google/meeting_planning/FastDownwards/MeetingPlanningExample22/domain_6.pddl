(define (domain sf-meet-classical)
  (:requirements :typing :negative-preconditions :equality :adl)
  (:types agent location timepoint)

  (:predicates
    (at ?ag - agent ?loc - location)
    (time-at ?t - timepoint)
    (met-andrew)
  )

  (:action travel-presidio-to-unionsq
    :parameters ()
    :precondition (and
      (at traveler presidio)
      (time-at time540)
    )
    :effect (and
      (not (at traveler presidio))
      (at traveler unionsquare)
      (not (time-at time540))
      (time-at time562)
    )
  )

  (:action wait-at-unionsq-until-675
    :parameters ()
    :precondition (and
      (at traveler unionsquare)
      (time-at time562)
    )
    :effect (and
      (not (time-at time562))
      (time-at time675)
    )
  )

  (:action meet-with-andrew-105
    :parameters ()
    :precondition (and
      (at traveler unionsquare)
      (at andrew unionsquare)
      (time-at time675)
    )
    :effect (and
      (not (time-at time675))
      (time-at time780)
      (met-andrew)
    )
  )

  (:action optional-wait-until-930
    :parameters ()
    :precondition (and
      (time-at time780)
      (at traveler unionsquare)
    )
    :effect (and
      (not (time-at time780))
      (time-at time930)
    )
  )

  (:action optional-wait-until-1035
    :parameters ()
    :precondition (and
      (time-at time930)
      (at traveler unionsquare)
    )
    :effect (and
      (not (time-at time930))
      (time-at time1035)
    )
  )
)