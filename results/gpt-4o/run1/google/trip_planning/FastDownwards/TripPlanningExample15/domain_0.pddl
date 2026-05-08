(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_city ?c - city)
    (day_of_visit ?d - day)
    (visited_berlin)
    (visited_porto)
    (visited_krakow)
    (wedding_attended)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?day_from - day ?day_to - day)
    :precondition (and
      (current_city ?from)
      (day_of_visit ?day_from)
      (direct_flight ?from ?to)
      (next ?day_from ?day_to)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (not (day_of_visit ?day_from))
      (day_of_visit ?day_to)
    )
  )

  (:action stay_in_berlin
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (current_city berlin)
      (day_of_visit ?start_day)
      (next ?start_day ?end_day)
      (next ?end_day day_7)
    )
    :effect (and
      (visited_berlin)
      (not (day_of_visit ?start_day))
      (day_of_visit ?end_day)
    )
  )

  (:action stay_in_krakow
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (current_city krakow)
      (day_of_visit ?start_day)
      (next ?start_day ?end_day)
      (next ?end_day day_11)
    )
    :effect (and
      (visited_krakow)
      (not (day_of_visit ?start_day))
      (day_of_visit ?end_day)
    )
  )

  (:action stay_in_porto
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (current_city porto)
      (day_of_visit ?start_day)
      (next ?start_day ?end_day)
      (next ?end_day day_11)
    )
    :effect (and
      (visited_porto)
      (not (day_of_visit ?start_day))
      (day_of_visit ?end_day)
    )
  )

  (:action attend_wedding
    :parameters (?start_day - day ?end_day - day)
    :precondition (and
      (current_city porto)
      (day_of_visit ?start_day)
      (next ?start_day day_11)
      (next day_10 ?end_day)
    )
    :effect (wedding_attended)
  )
)