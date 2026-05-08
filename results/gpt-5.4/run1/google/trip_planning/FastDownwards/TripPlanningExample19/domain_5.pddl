(define (domain trip_planning_example19)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city_on ?c - city ?d - day)
    (visited ?c - city)
    (friends_met)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (visited brussels))
      (not (visited valencia))
      (not (visited nice))
      (not (at brussels))
      (not (at valencia))
      (not (at nice))
    )
    :effect (and
      (at ?c)
      (visited ?c)
      (in_city_on ?c day1)
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (in_city_on brussels ?d2))
      (not (in_city_on valencia ?d2))
      (not (in_city_on nice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in_city_on ?c ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (in_city_on brussels ?d2))
      (not (in_city_on valencia ?d2))
      (not (in_city_on nice ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (in_city_on ?to ?d2)
    )
  )

  (:action meet_friends_in_nice
    :parameters (?d - day)
    :precondition (and
      (in_city_on nice ?d)
      (not (friends_met))
    )
    :effect (and
      (friends_met)
    )
  )
)