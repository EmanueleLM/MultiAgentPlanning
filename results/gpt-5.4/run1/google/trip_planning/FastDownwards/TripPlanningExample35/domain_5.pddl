(define (domain european_trip_10_day_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (visited ?d - day ?c - city)
    (need_relatives ?d - day)
    (relatives_visited ?d - day)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?d2 ?c))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?d2 ?c)
    )
  )

  (:action stay_with_relatives
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at dubrovnik)
      (need_relatives ?d2)
      (not (visited ?d2 dubrovnik))
      (not (relatives_visited ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?d2 dubrovnik)
      (relatives_visited ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (= ?from ?to))
      (not (visited ?d2 ?to))
      (not (need_relatives ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
    )
  )

  (:action fly_to_dubrovnik_with_relatives
    :parameters (?d1 - day ?d2 - day ?from - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from dubrovnik)
      (not (= ?from dubrovnik))
      (need_relatives ?d2)
      (not (visited ?d2 dubrovnik))
      (not (relatives_visited ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at dubrovnik)
      (visited ?d2 dubrovnik)
      (relatives_visited ?d2)
    )
  )
)