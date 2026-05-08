(define (domain trip_planning)

  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at_city ?c - city ?d - day)
    (has_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (visited ?c - city)
    (workshop_attended)
  )

  (:action travel
    :parameters (?from - city ?to - city ?d - day ?next_d - day)
    :precondition (and
      (at_city ?from ?d)
      (has_flight ?from ?to)
      (next ?d ?next_d)
    )
    :effect (and
      (not (at_city ?from ?d))
      (at_city ?to ?next_d)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?next_d - day)
    :precondition (and
      (at_city ?c ?d)
      (next ?d ?next_d)
    )
    :effect (and
      (not (at_city ?c ?d))
      (at_city ?c ?next_d)
    )
  )

  (:action mark_visited
    :parameters (?c - city ?d - day)
    :precondition (at_city ?c ?d)
    :effect (visited ?c)
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and 
      (at_city venice ?d) 
      (not (workshop_attended))
      (or (at_city venice day5) 
          (at_city venice day6) 
          (at_city venice day7) 
          (at_city venice day8) 
          (at_city venice day9))
    )
    :effect (workshop_attended)
  )

)