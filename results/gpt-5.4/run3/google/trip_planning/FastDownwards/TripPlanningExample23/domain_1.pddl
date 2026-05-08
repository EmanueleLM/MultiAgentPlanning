(define (domain tripplanningexample23)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (in_london_day ?d - day)
    (in_bucharest_day ?d - day)
    (in_riga_day ?d - day)

    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay_london
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at london)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_london_day ?d)
    )
  )

  (:action stay_bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_bucharest_day ?d)
    )
  )

  (:action stay_riga
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at riga)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_riga_day ?d)
    )
  )

  (:action attend_workshop_in_riga
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at riga)
      (workshop_day ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (in_riga_day ?d)
      (workshop_attended)
    )
  )

  (:action fly_london_to_bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at london)
      (direct london bucharest)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at london))
      (at bucharest)
      (in_bucharest_day ?d)
    )
  )

  (:action fly_bucharest_to_london
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct bucharest london)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at london)
      (in_london_day ?d)
    )
  )

  (:action fly_bucharest_to_riga
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at bucharest)
      (direct bucharest riga)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at bucharest))
      (at riga)
      (in_riga_day ?d)
    )
  )

  (:action fly_riga_to_bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at riga)
      (direct riga bucharest)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at riga))
      (at bucharest)
      (in_bucharest_day ?d)
    )
  )
)