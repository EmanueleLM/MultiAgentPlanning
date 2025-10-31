(define (domain multiagent-meet)
  (:requirements :strips :typing :fluents)
  (:types location)

  (:predicates
    (at-traveler ?l - location)
    (met75)
  )

  (:functions
    (time)
  )

  (:action traveler-move-m2r
    :parameters ()
    :precondition (at-traveler marina)
    :effect (and
      (not (at-traveler marina))
      (at-traveler richmond)
      (increase (time) 11)
    )
  )

  (:action traveler-move-r2m
    :parameters ()
    :precondition (at-traveler richmond)
    :effect (and
      (not (at-traveler richmond))
      (at-traveler marina)
      (increase (time) 9)
    )
  )

  (:action wait-until-2030
    :parameters ()
    :precondition (<= (time) 1230)
    :effect (and
      (assign (time) 1230)
    )
  )

  (:action traveler-meet-with-betty
    :parameters ()
    :precondition (and
      (at-traveler richmond)
      (>= (time) 1230)
      (<= (+ (time) 75) 1320)
    )
    :effect (and
      (met75)
      (increase (time) 75)
    )
  )
)