(define (domain european_trip)

  (:requirements :strips :typing)

  (:types city day)

  (:predicates
    (at ?city - city ?day - day)
    (attended_wedding)
    (flight_available ?from ?to - city)
    (next ?day1 ?day2 - day)
  )

  (:action fly
    :parameters (?from ?to - city ?day_from ?day_to - day)
    :precondition (and
      (at ?from ?day_from)
      (flight_available ?from ?to)
      (next ?day_from ?day_to)
    )
    :effect (and
      (not (at ?from ?day_from))
      (at ?to ?day_to)
    )
  )

  (:action attend_wedding
    :parameters (?day1 - day ?day2 - day)
    :precondition (and
      (at manchester ?day1)
      (next ?day1 ?day2)
    )
    :effect (attended_wedding)
  )
)