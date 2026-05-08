(define (domain euro_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in_city ?c - city ?d - day)
    (flight_exists ?from - city ?to - city)
    (visited_relatives_santorini ?d - day)
    (planned_trip_finished)
    (successor ?d1 - day ?d2 - day)
  )
  
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (in_city ?from ?d1)
      (flight_exists ?from ?to)
      (successor ?d1 ?d2)
    )
    :effect (and
      (not (in_city ?from ?d1))
      (in_city ?to ?d2)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (in_city ?c ?d1)
      (successor ?d1 ?d2)
    )
    :effect (and
      (in_city ?c ?d2)
    )
  )
  
  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and
      (in_city santorini ?d)
      (or
        (= ?d day_12)
        (= ?d day_13)
        (= ?d day_14)
      )
    )
    :effect (visited_relatives_santorini ?d)
  )
)