(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (next ?d - day ?next - day)
    (visited)
    (schedule ?stage - stage ?city - city)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?from ?d1)
      (direct_flight ?from ?to)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
  
  (:action proceed_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2)
    )
  )

  (:action mark_visit
    :parameters ()
    :precondition (at athens day_7)
    :effect (visited)
  )
  
)