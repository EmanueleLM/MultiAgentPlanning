(define (domain european_trip_13days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (day_in_city ?d - day ?c - city)
    (visited_day ?d - day)

    (count_florence ?n - count)
    (count_amsterdam ?n - count)
    (count_riga ?n - count)
    (next_count ?n1 - count ?n2 - count)

    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay_florence_workshop
    :parameters (?d1 - day ?d2 - day ?f1 - count ?f2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (count_florence ?f1)
      (next_count ?f1 ?f2)
      (workshop_window ?d1)
      (not (workshop_attended))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 florence)
      (not (count_florence ?f1))
      (count_florence ?f2)
      (workshop_attended)
    )
  )

  (:action stay_florence
    :parameters (?d1 - day ?d2 - day ?f1 - count ?f2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (count_florence ?f1)
      (next_count ?f1 ?f2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 florence)
      (not (count_florence ?f1))
      (count_florence ?f2)
    )
  )

  (:action stay_amsterdam
    :parameters (?d1 - day ?d2 - day ?a1 - count ?a2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at amsterdam)
      (count_amsterdam ?a1)
      (next_count ?a1 ?a2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (count_amsterdam ?a1))
      (count_amsterdam ?a2)
    )
  )

  (:action stay_riga
    :parameters (?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (count_riga ?r1)
      (next_count ?r1 ?r2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 riga)
      (not (count_riga ?r1))
      (count_riga ?r2)
    )
  )

  (:action fly_to_florence_workshop
    :parameters (?from - city ?d1 - day ?d2 - day ?f1 - count ?f2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at florence))
      (direct ?from florence)
      (count_florence ?f1)
      (next_count ?f1 ?f2)
      (workshop_window ?d1)
      (not (workshop_attended))
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 florence)
      (not (count_florence ?f1))
      (count_florence ?f2)
      (workshop_attended)
    )
  )

  (:action fly_to_florence
    :parameters (?from - city ?d1 - day ?d2 - day ?f1 - count ?f2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at florence))
      (direct ?from florence)
      (count_florence ?f1)
      (next_count ?f1 ?f2)
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 florence)
      (not (count_florence ?f1))
      (count_florence ?f2)
    )
  )

  (:action fly_to_amsterdam
    :parameters (?from - city ?d1 - day ?d2 - day ?a1 - count ?a2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at amsterdam))
      (direct ?from amsterdam)
      (count_amsterdam ?a1)
      (next_count ?a1 ?a2)
    )
    :effect (and
      (not (at ?from))
      (at amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 amsterdam)
      (not (count_amsterdam ?a1))
      (count_amsterdam ?a2)
    )
  )

  (:action fly_to_riga
    :parameters (?from - city ?d1 - day ?d2 - day ?r1 - count ?r2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at riga))
      (direct ?from riga)
      (count_riga ?r1)
      (next_count ?r1 ?r2)
    )
    :effect (and
      (not (at ?from))
      (at riga)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_day ?d2)
      (day_in_city ?d2 riga)
      (not (count_riga ?r1))
      (count_riga ?r2)
    )
  )
)