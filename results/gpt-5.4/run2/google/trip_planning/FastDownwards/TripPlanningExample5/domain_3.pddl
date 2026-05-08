(define (domain trip_planning_example5)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city ?c - city ?d - day)
    (visited_day ?d - day)
  )

  (:action start_in_oslo
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (visited_day d1))
    )
    :effect (and
      (in_city oslo d1)
      (visited_day d1)
    )
  )

  (:action start_in_porto
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (visited_day d1))
    )
    :effect (and
      (in_city porto d1)
      (visited_day d1)
    )
  )

  (:action start_in_dubrovnik
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (visited_day d1))
    )
    :effect (and
      (in_city dubrovnik d1)
      (visited_day d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (not (visited_day ?d2))
      (in_city ?c ?d1)
    )
    :effect (and
      (in_city ?c ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (not (visited_day ?d2))
      (in_city ?from ?d1)
      (direct ?from ?to)
      (not (in_city ?to ?d1))
    )
    :effect (and
      (in_city ?to ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)