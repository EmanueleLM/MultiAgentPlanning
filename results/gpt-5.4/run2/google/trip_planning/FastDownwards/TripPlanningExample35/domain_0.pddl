(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (spent_day_in ?d - day ?c - city)
    (dubrovnik_window_start ?d - day)
    (met_dubrovnik_window)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day_bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at bucharest)
      (not (spent_day_in ?d1 bucharest))
      (not (spent_day_in ?d1 zurich))
      (not (spent_day_in ?d1 dubrovnik))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in ?d1 bucharest)
    )
  )

  (:action spend_day_zurich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at zurich)
      (not (spent_day_in ?d1 bucharest))
      (not (spent_day_in ?d1 zurich))
      (not (spent_day_in ?d1 dubrovnik))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in ?d1 zurich)
    )
  )

  (:action spend_day_dubrovnik_nonwindow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik)
      (not (dubrovnik_window_start ?d1))
      (not (spent_day_in ?d1 bucharest))
      (not (spent_day_in ?d1 zurich))
      (not (spent_day_in ?d1 dubrovnik))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in ?d1 dubrovnik)
    )
  )

  (:action spend_day_dubrovnik_window
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik)
      (dubrovnik_window_start ?d1)
      (not (spent_day_in ?d1 bucharest))
      (not (spent_day_in ?d1 zurich))
      (not (spent_day_in ?d1 dubrovnik))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in ?d1 dubrovnik)
      (met_dubrovnik_window)
    )
  )
)