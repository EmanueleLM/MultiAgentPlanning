(define (domain trip_planning)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)
  
  (:predicates
    (at ?c - city ?d - day)
    (has_flight ?from - city ?to - city)
    (workshop_scheduled ?d - day)
    (next ?d1 - day ?d2 - day)
  )
  
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (has_flight ?from ?to)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
  
  (:action stay_in_venice
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (at venice ?start_day)
      (next ?start_day day2)
      (next day2 day3)
      (next day3 day4)
      (next day4 day5)
      (next day5 day6)
      (next day6 ?end_day)
    )
    :effect (and
      (not (at venice ?start_day))
      (at venice ?end_day)
    )
  )
  
  (:action stay_in_mykonos
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (at mykonos ?start_day)
      (next ?start_day day2)
      (next day2 ?end_day)
    )
    :effect (and
      (not (at mykonos ?start_day))
      (at mykonos ?end_day)
    )
  )
  
  (:action stay_in_vienna
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (at vienna ?start_day)
      (next ?start_day day2)
      (next day2 day3)
      (next day3 day4)
      (next day4 ?end_day)
    )
    :effect (and
      (not (at vienna ?start_day))
      (at vienna ?end_day)
    )
  )
)