(define (domain multiagent-meetings)
  (:requirements :strips :typing)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent)
    (at-time ?t - time)
  )

  (:action travel-traveler-sunset-to-haight
    :parameters ()
    :precondition (and
      (at traveler sunset)
      (at-time t540)
    )
    :effect (and
      (not (at traveler sunset))
      (at traveler haight)
      (not (at-time t540))
      (at-time t555)
    )
  )

  (:action travel-traveler-haight-to-sunset
    :parameters ()
    :precondition (and
      (at traveler haight)
      (at-time t540)
    )
    :effect (and
      (not (at traveler haight))
      (at traveler sunset)
      (not (at-time t540))
      (at-time t555)
    )
  )

  (:action wait-540-to-1170
    :parameters ()
    :precondition (and
      (at-time t540)
    )
    :effect (and
      (not (at-time t540))
      (at-time t1170)
    )
  )

  (:action wait-555-to-1170
    :parameters ()
    :precondition (and
      (at-time t555)
    )
    :effect (and
      (not (at-time t555))
      (at-time t1170)
    )
  )

  (:action nancy-start-availability
    :parameters ()
    :precondition (and
      (at-time t1170)
    )
    :effect (and
      (at nancy haight)
    )
  )

  (:action meet-nancy
    :parameters ()
    :precondition (and
      (at traveler haight)
      (at nancy haight)
      (at-time t1170)
    )
    :effect (and
      (met nancy)
      (not (at-time t1170))
      (at-time t1245)
    )
  )
)