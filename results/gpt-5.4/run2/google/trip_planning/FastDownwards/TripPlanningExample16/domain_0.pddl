(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (connected ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (workshop_attended)
  )

  (:action seed_start_day_prague
    :parameters ()
    :precondition (not (assigned day_1))
    :effect (and
      (at prague day_1)
      (assigned day_1)
      (workshop_attended)
    )
  )

  (:action seed_start_day_vienna
    :parameters ()
    :precondition (not (assigned day_1))
    :effect (and
      (at vienna day_1)
      (assigned day_1)
    )
  )

  (:action seed_start_day_porto
    :parameters ()
    :precondition (not (assigned day_1))
    :effect (and
      (at porto day_1)
      (assigned day_1)
    )
  )

  (:action assign_next_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (assigned ?d1)
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
    )
  )

  (:action assign_next_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (assigned ?d1)
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (connected ?from ?to)
      (not (assigned ?d2))
      (not (at ?to ?d1))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?d2)
    )
  )

  (:action assign_day_2_prague_from_stay
    :parameters ()
    :precondition (and
      (assigned day_1)
      (at prague day_1)
      (next_day day_1 day_2)
      (not (assigned day_2))
    )
    :effect (and
      (at prague day_2)
      (assigned day_2)
      (workshop_attended)
    )
  )

  (:action assign_day_2_prague_from_fly
    :parameters (?from - city)
    :precondition (and
      (assigned day_1)
      (at ?from day_1)
      (next_day day_1 day_2)
      (connected ?from prague)
      (not (assigned day_2))
      (not (at prague day_1))
    )
    :effect (and
      (at prague day_2)
      (assigned day_2)
      (workshop_attended)
    )
  )

  (:action assign_day_3_prague_from_stay
    :parameters ()
    :precondition (and
      (assigned day_2)
      (at prague day_2)
      (next_day day_2 day_3)
      (not (assigned day_3))
    )
    :effect (and
      (at prague day_3)
      (assigned day_3)
      (workshop_attended)
    )
  )

  (:action assign_day_3_prague_from_fly
    :parameters (?from - city)
    :precondition (and
      (assigned day_2)
      (at ?from day_2)
      (next_day day_2 day_3)
      (connected ?from prague)
      (not (assigned day_3))
      (not (at prague day_2))
    )
    :effect (and
      (at prague day_3)
      (assigned day_3)
      (workshop_attended)
    )
  )
)