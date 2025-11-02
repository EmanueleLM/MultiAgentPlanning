(define (domain multiagent-meet)
  (:requirements :strips :typing :negative-preconditions :fluents :numbers)
  (:types location)

  (:predicates
    (at-traveler ?l - location)
  )

  (:functions
    (time)            ; minutes since midnight
    (met-minutes)     ; accumulated minutes traveler met Betty
  )

  (:action traveler-move-m2r
    :parameters ()
    :precondition (and (at-traveler marina))
    :effect (and
      (not (at-traveler marina))
      (at-traveler richmond)
      (increase (time) 11)
    )
  )

  (:action traveler-move-r2m
    :parameters ()
    :precondition (and (at-traveler richmond))
    :effect (and
      (not (at-traveler richmond))
      (at-traveler marina)
      (increase (time) 9)
    )
  )

  (:action traveler-wait-1min
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )

  (:action traveler-meet-1min-with-betty
    :parameters ()
    :precondition (and
      (at-traveler richmond)
      (>= (time) 1230)
      (<= (+ (time) 1) 1320)
    )
    :effect (and
      (increase (time) 1)
      (increase (met-minutes) 1)
    )
  )

  (:action betty-wait-1min
    :parameters ()
    :precondition ()
    :effect (and
      (increase (time) 1)
    )
  )
)