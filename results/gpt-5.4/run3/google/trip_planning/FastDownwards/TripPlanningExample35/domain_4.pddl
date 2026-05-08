(define (domain trip_planning_example35)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (connected ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (start)
  )

  (:action choose_start_bucharest
    :parameters ()
    :precondition (start)
    :effect (and
      (at bucharest d1)
      (not (start)))
  )

  (:action choose_start_zurich
    :parameters ()
    :precondition (start)
    :effect (and
      (at zurich d1)
      (not (start)))
  )

  (:action choose_start_dubrovnik
    :parameters ()
    :precondition (start)
    :effect (and
      (at dubrovnik d1)
      (not (start)))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2))
    :effect (and
      (at ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
      (not (= ?from ?to)))
    :effect (and
      (at ?to ?d2))
  )
)