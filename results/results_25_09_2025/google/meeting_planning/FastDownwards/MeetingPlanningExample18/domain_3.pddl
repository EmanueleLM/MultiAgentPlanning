(define (domain multiagent-meet)
  (:requirements :strips :typing)
  (:types location)

  (:predicates
    (at-traveler ?l - location)
    (betty-available)
    (met75)
  )

  (:action traveler-move-m2r
    :parameters ()
    :precondition (at-traveler marina)
    :effect (and
      (not (at-traveler marina))
      (at-traveler richmond)
    )
  )

  (:action traveler-move-r2m
    :parameters ()
    :precondition (at-traveler richmond)
    :effect (and
      (not (at-traveler richmond))
      (at-traveler marina)
    )
  )

  (:action traveler-meet-with-betty
    :parameters ()
    :precondition (and
      (at-traveler richmond)
      (betty-available)
    )
    :effect (and
      (met75)
    )
  )
)