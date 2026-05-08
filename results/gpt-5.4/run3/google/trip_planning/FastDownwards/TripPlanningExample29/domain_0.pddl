(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (visited_on frankfurt ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on dubrovnik ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly_frankfurt_to_krakow
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt krakow)
      (not (visited_on frankfurt ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on dubrovnik ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at frankfurt))
      (at krakow)
      (visited_on krakow ?d2)
    )
  )

  (:action fly_krakow_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at krakow)
      (direct_flight krakow frankfurt)
      (not (visited_on frankfurt ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on dubrovnik ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at krakow))
      (at frankfurt)
      (visited_on frankfurt ?d2)
    )
  )

  (:action fly_dubrovnik_to_frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik)
      (direct_flight dubrovnik frankfurt)
      (not (visited_on frankfurt ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on dubrovnik ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at dubrovnik))
      (at frankfurt)
      (visited_on frankfurt ?d2)
    )
  )

  (:action fly_frankfurt_to_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at frankfurt)
      (direct_flight frankfurt dubrovnik)
      (not (visited_on frankfurt ?d2))
      (not (visited_on krakow ?d2))
      (not (visited_on dubrovnik ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at frankfurt))
      (at dubrovnik)
      (visited_on dubrovnik ?d2)
    )
  )
)