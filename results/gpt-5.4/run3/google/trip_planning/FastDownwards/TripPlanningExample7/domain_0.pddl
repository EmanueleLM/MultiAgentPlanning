(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    person
    city
    day
    dubrovnik_count
    istanbul_count
    venice_count
  )

  (:predicates
    (at ?p - person ?c - city)
    (direct_flight ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (trip_complete)

    (assigned ?d - day ?c - city)

    (dubrovnik_count_at ?x - dubrovnik_count)
    (next_dubrovnik_count ?x - dubrovnik_count ?y - dubrovnik_count)

    (istanbul_count_at ?x - istanbul_count)
    (next_istanbul_count ?x - istanbul_count ?y - istanbul_count)

    (venice_count_at ?x - venice_count)
    (next_venice_count ?x - venice_count ?y - venice_count)
  )

  (:action stay_and_assign_dubrovnik
    :parameters (?p - person ?day - day ?nextday - day ?c1 - dubrovnik_count ?c2 - dubrovnik_count)
    :precondition (and
      (at ?p dubrovnik)
      (current_day ?day)
      (next_day ?day ?nextday)
      (dubrovnik_count_at ?c1)
      (next_dubrovnik_count ?c1 ?c2)
      (not (trip_complete))
    )
    :effect (and
      (not (current_day ?day))
      (current_day ?nextday)
      (assigned ?day dubrovnik)
      (not (dubrovnik_count_at ?c1))
      (dubrovnik_count_at ?c2)
    )
  )

  (:action stay_and_assign_istanbul
    :parameters (?p - person ?day - day ?nextday - day ?c1 - istanbul_count ?c2 - istanbul_count)
    :precondition (and
      (at ?p istanbul)
      (current_day ?day)
      (next_day ?day ?nextday)
      (istanbul_count_at ?c1)
      (next_istanbul_count ?c1 ?c2)
      (not (trip_complete))
    )
    :effect (and
      (not (current_day ?day))
      (current_day ?nextday)
      (assigned ?day istanbul)
      (not (istanbul_count_at ?c1))
      (istanbul_count_at ?c2)
    )
  )

  (:action stay_and_assign_venice
    :parameters (?p - person ?day - day ?nextday - day ?c1 - venice_count ?c2 - venice_count)
    :precondition (and
      (at ?p venice)
      (current_day ?day)
      (next_day ?day ?nextday)
      (venice_count_at ?c1)
      (next_venice_count ?c1 ?c2)
      (not (trip_complete))
    )
    :effect (and
      (not (current_day ?day))
      (current_day ?nextday)
      (assigned ?day venice)
      (not (venice_count_at ?c1))
      (venice_count_at ?c2)
    )
  )

  (:action fly_and_assign_dubrovnik
    :parameters (?p - person ?from - city ?day - day ?nextday - day ?c1 - dubrovnik_count ?c2 - dubrovnik_count)
    :precondition (and
      (at ?p ?from)
      (direct_flight ?from dubrovnik)
      (current_day ?day)
      (next_day ?day ?nextday)
      (dubrovnik_count_at ?c1)
      (next_dubrovnik_count ?c1 ?c2)
      (not (at ?p dubrovnik))
      (not (trip_complete))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p dubrovnik)
      (not (current_day ?day))
      (current_day ?nextday)
      (assigned ?day dubrovnik)
      (not (dubrovnik_count_at ?c1))
      (dubrovnik_count_at ?c2)
    )
  )

  (:action fly_and_assign_istanbul
    :parameters (?p - person ?from - city ?day - day ?nextday - day ?c1 - istanbul_count ?c2 - istanbul_count)
    :precondition (and
      (at ?p ?from)
      (direct_flight ?from istanbul)
      (current_day ?day)
      (next_day ?day ?nextday)
      (istanbul_count_at ?c1)
      (next_istanbul_count ?c1 ?c2)
      (not (at ?p istanbul))
      (not (trip_complete))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p istanbul)
      (not (current_day ?day))
      (current_day ?nextday)
      (assigned ?day istanbul)
      (not (istanbul_count_at ?c1))
      (istanbul_count_at ?c2)
    )
  )

  (:action fly_and_assign_venice
    :parameters (?p - person ?from - city ?day - day ?nextday - day ?c1 - venice_count ?c2 - venice_count)
    :precondition (and
      (at ?p ?from)
      (direct_flight ?from venice)
      (current_day ?day)
      (next_day ?day ?nextday)
      (venice_count_at ?c1)
      (next_venice_count ?c1 ?c2)
      (not (at ?p venice))
      (not (trip_complete))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p venice)
      (not (current_day ?day))
      (current_day ?nextday)
      (assigned ?day venice)
      (not (venice_count_at ?c1))
      (venice_count_at ?c2)
    )
  )

  (:action stay_and_assign_dubrovnik_last
    :parameters (?p - person ?day - day ?c1 - dubrovnik_count ?c2 - dubrovnik_count)
    :precondition (and
      (at ?p dubrovnik)
      (current_day ?day)
      (last_day ?day)
      (dubrovnik_count_at ?c1)
      (next_dubrovnik_count ?c1 ?c2)
      (not (trip_complete))
    )
    :effect (and
      (not (current_day ?day))
      (assigned ?day dubrovnik)
      (not (dubrovnik_count_at ?c1))
      (dubrovnik_count_at ?c2)
      (trip_complete)
    )
  )

  (:action stay_and_assign_istanbul_last
    :parameters (?p - person ?day - day ?c1 - istanbul_count ?c2 - istanbul_count)
    :precondition (and
      (at ?p istanbul)
      (current_day ?day)
      (last_day ?day)
      (istanbul_count_at ?c1)
      (next_istanbul_count ?c1 ?c2)
      (not (trip_complete))
    )
    :effect (and
      (not (current_day ?day))
      (assigned ?day istanbul)
      (not (istanbul_count_at ?c1))
      (istanbul_count_at ?c2)
      (trip_complete)
    )
  )

  (:action stay_and_assign_venice_last
    :parameters (?p - person ?day - day ?c1 - venice_count ?c2 - venice_count)
    :precondition (and
      (at ?p venice)
      (current_day ?day)
      (last_day ?day)
      (venice_count_at ?c1)
      (next_venice_count ?c1 ?c2)
      (not (trip_complete))
    )
    :effect (and
      (not (current_day ?day))
      (assigned ?day venice)
      (not (venice_count_at ?c1))
      (venice_count_at ?c2)
      (trip_complete)
    )
  )

  (:action fly_and_assign_dubrovnik_last
    :parameters (?p - person ?from - city ?day - day ?c1 - dubrovnik_count ?c2 - dubrovnik_count)
    :precondition (and
      (at ?p ?from)
      (direct_flight ?from dubrovnik)
      (current_day ?day)
      (last_day ?day)
      (dubrovnik_count_at ?c1)
      (next_dubrovnik_count ?c1 ?c2)
      (not (at ?p dubrovnik))
      (not (trip_complete))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p dubrovnik)
      (not (current_day ?day))
      (assigned ?day dubrovnik)
      (not (dubrovnik_count_at ?c1))
      (dubrovnik_count_at ?c2)
      (trip_complete)
    )
  )

  (:action fly_and_assign_istanbul_last
    :parameters (?p - person ?from - city ?day - day ?c1 - istanbul_count ?c2 - istanbul_count)
    :precondition (and
      (at ?p ?from)
      (direct_flight ?from istanbul)
      (current_day ?day)
      (last_day ?day)
      (istanbul_count_at ?c1)
      (next_istanbul_count ?c1 ?c2)
      (not (at ?p istanbul))
      (not (trip_complete))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p istanbul)
      (not (current_day ?day))
      (assigned ?day istanbul)
      (not (istanbul_count_at ?c1))
      (istanbul_count_at ?c2)
      (trip_complete)
    )
  )

  (:action fly_and_assign_venice_last
    :parameters (?p - person ?from - city ?day - day ?c1 - venice_count ?c2 - venice_count)
    :precondition (and
      (at ?p ?from)
      (direct_flight ?from venice)
      (current_day ?day)
      (last_day ?day)
      (venice_count_at ?c1)
      (next_venice_count ?c1 ?c2)
      (not (at ?p venice))
      (not (trip_complete))
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p venice)
      (not (current_day ?day))
      (assigned ?day venice)
      (not (venice_count_at ?c1))
      (venice_count_at ?c2)
      (trip_complete)
    )
  )
)