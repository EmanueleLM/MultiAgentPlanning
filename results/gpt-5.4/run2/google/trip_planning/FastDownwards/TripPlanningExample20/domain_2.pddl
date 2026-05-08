(define (domain trip_planning_example20)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city_on_day ?c - city ?d - day)
    (counted_istanbul ?d - day)
    (counted_budapest ?d - day)
    (counted_dubrovnik ?d - day)
    (visited_istanbul_1)
    (visited_istanbul_2)
    (visited_istanbul_3)
    (visited_istanbul_4)
    (visited_istanbul_5)
    (visited_budapest_1)
    (visited_budapest_2)
    (visited_budapest_3)
    (visited_budapest_4)
    (visited_budapest_5)
    (visited_budapest_6)
    (visited_dubrovnik_1)
    (visited_dubrovnik_2)
    (visited_dubrovnik_3)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (in_city_on_day ?c ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in_city_on_day ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (in_city_on_day ?to ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (in_city_on_day ?to ?d2)
    )
  )

  (:action count_istanbul_day_1
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day istanbul ?d)
      (not (counted_istanbul ?d))
      (not (visited_istanbul_1))
    )
    :effect (and
      (counted_istanbul ?d)
      (visited_istanbul_1)
    )
  )

  (:action count_istanbul_day_2
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day istanbul ?d)
      (not (counted_istanbul ?d))
      (visited_istanbul_1)
      (not (visited_istanbul_2))
    )
    :effect (and
      (counted_istanbul ?d)
      (visited_istanbul_2)
    )
  )

  (:action count_istanbul_day_3
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day istanbul ?d)
      (not (counted_istanbul ?d))
      (visited_istanbul_2)
      (not (visited_istanbul_3))
    )
    :effect (and
      (counted_istanbul ?d)
      (visited_istanbul_3)
    )
  )

  (:action count_istanbul_day_4
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day istanbul ?d)
      (not (counted_istanbul ?d))
      (visited_istanbul_3)
      (not (visited_istanbul_4))
    )
    :effect (and
      (counted_istanbul ?d)
      (visited_istanbul_4)
    )
  )

  (:action count_istanbul_day_5
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day istanbul ?d)
      (not (counted_istanbul ?d))
      (visited_istanbul_4)
      (not (visited_istanbul_5))
    )
    :effect (and
      (counted_istanbul ?d)
      (visited_istanbul_5)
    )
  )

  (:action count_budapest_day_1
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day budapest ?d)
      (not (counted_budapest ?d))
      (not (visited_budapest_1))
    )
    :effect (and
      (counted_budapest ?d)
      (visited_budapest_1)
    )
  )

  (:action count_budapest_day_2
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day budapest ?d)
      (not (counted_budapest ?d))
      (visited_budapest_1)
      (not (visited_budapest_2))
    )
    :effect (and
      (counted_budapest ?d)
      (visited_budapest_2)
    )
  )

  (:action count_budapest_day_3
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day budapest ?d)
      (not (counted_budapest ?d))
      (visited_budapest_2)
      (not (visited_budapest_3))
    )
    :effect (and
      (counted_budapest ?d)
      (visited_budapest_3)
    )
  )

  (:action count_budapest_day_4
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day budapest ?d)
      (not (counted_budapest ?d))
      (visited_budapest_3)
      (not (visited_budapest_4))
    )
    :effect (and
      (counted_budapest ?d)
      (visited_budapest_4)
    )
  )

  (:action count_budapest_day_5
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day budapest ?d)
      (not (counted_budapest ?d))
      (visited_budapest_4)
      (not (visited_budapest_5))
    )
    :effect (and
      (counted_budapest ?d)
      (visited_budapest_5)
    )
  )

  (:action count_budapest_day_6
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day budapest ?d)
      (not (counted_budapest ?d))
      (visited_budapest_5)
      (not (visited_budapest_6))
    )
    :effect (and
      (counted_budapest ?d)
      (visited_budapest_6)
    )
  )

  (:action count_dubrovnik_day_1
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day dubrovnik ?d)
      (not (counted_dubrovnik ?d))
      (not (visited_dubrovnik_1))
    )
    :effect (and
      (counted_dubrovnik ?d)
      (visited_dubrovnik_1)
    )
  )

  (:action count_dubrovnik_day_2
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day dubrovnik ?d)
      (not (counted_dubrovnik ?d))
      (visited_dubrovnik_1)
      (not (visited_dubrovnik_2))
    )
    :effect (and
      (counted_dubrovnik ?d)
      (visited_dubrovnik_2)
    )
  )

  (:action count_dubrovnik_day_3
    :parameters (?d - day)
    :precondition (and
      (in_city_on_day dubrovnik ?d)
      (not (counted_dubrovnik ?d))
      (visited_dubrovnik_2)
      (not (visited_dubrovnik_3))
    )
    :effect (and
      (counted_dubrovnik ?d)
      (visited_dubrovnik_3)
    )
  )
)