(define (domain trip_11_days_three_cities)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (occupied ?d - day ?c - city)

    (visited_seville_on ?d - day)
    (visited_manchester_on ?d - day)
    (visited_stockholm_on ?d - day)

    (unfilled_seville_1)
    (unfilled_seville_2)
    (unfilled_seville_3)
    (unfilled_seville_4)
    (unfilled_seville_5)

    (unfilled_manchester_1)
    (unfilled_manchester_2)
    (unfilled_manchester_3)
    (unfilled_manchester_4)
    (unfilled_manchester_5)

    (unfilled_stockholm_1)
    (unfilled_stockholm_2)
    (unfilled_stockholm_3)
  )

  (:action stay_to_next_day_in_seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at seville)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_seville_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2 seville)
      (visited_seville_on ?d2)
    )
  )

  (:action stay_to_next_day_in_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_manchester_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2 manchester)
      (visited_manchester_on ?d2)
    )
  )

  (:action stay_to_next_day_in_stockholm
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at stockholm)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_stockholm_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2 stockholm)
      (visited_stockholm_on ?d2)
    )
  )

  (:action fly_manchester_to_seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (direct_flight manchester seville)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_seville_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at manchester))
      (at seville)
      (occupied ?d2 seville)
      (visited_seville_on ?d2)
    )
  )

  (:action fly_seville_to_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at seville)
      (direct_flight seville manchester)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_manchester_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at seville))
      (at manchester)
      (occupied ?d2 manchester)
      (visited_manchester_on ?d2)
    )
  )

  (:action fly_stockholm_to_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at stockholm)
      (direct_flight stockholm manchester)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_manchester_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at stockholm))
      (at manchester)
      (occupied ?d2 manchester)
      (visited_manchester_on ?d2)
    )
  )

  (:action fly_manchester_to_stockholm
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at manchester)
      (direct_flight manchester stockholm)
      (not (occupied ?d2 seville))
      (not (occupied ?d2 manchester))
      (not (occupied ?d2 stockholm))
      (not (visited_stockholm_on ?d2))
      (or)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at manchester))
      (at stockholm)
      (occupied ?d2 stockholm)
      (visited_stockholm_on ?d2)
    )
  )
)