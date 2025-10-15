(define (domain meet-friends)
  (:requirements :strips :negative-preconditions :functions :equality)
  (:predicates
    (at ?person ?loc)
    (met ?person)
  )
  (:functions
    (time)
    (met-count)
    (anthony-start)
    (anthony-end)
  )

  (:action travel-nobhill-to-alamo
    :parameters ()
    :precondition (and
      (at traveler nobhill)
    )
    :effect (and
      (not (at traveler nobhill))
      (at traveler alamosquare)
      (increase (time) 11)
    )
  )

  (:action travel-alamo-to-nobhill
    :parameters ()
    :precondition (and
      (at traveler alamosquare)
    )
    :effect (and
      (not (at traveler alamosquare))
      (at traveler nobhill)
      (increase (time) 11)
    )
  )

  (:action meet-anthony
    :parameters ()
    :precondition (and
      (at traveler alamosquare)
      (at anthony alamosquare)
      (not (met anthony))
      (>= (time) (anthony-start))
      (<= (+ (time) 15) (anthony-end))
    )
    :effect (and
      (met anthony)
      (increase (met-count) 1)
      (increase (time) 15)
    )
  )

  (:metric maximize (met-count))
)