(define (domain trip_planning_example18)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city_on ?c - city ?d - day)
    (friends_met)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (at amsterdam))
      (not (at vilnius))
      (not (at bucharest))
      (not (in_city_on amsterdam d1))
      (not (in_city_on vilnius d1))
      (not (in_city_on bucharest d1))
    )
    :effect (and
      (at ?c)
      (in_city_on ?c d1)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (in_city_on amsterdam ?d2))
      (not (in_city_on vilnius ?d2))
      (not (in_city_on bucharest ?d2))
    )
    :effect (and
      (in_city_on ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (at ?to))
      (not (in_city_on amsterdam ?d2))
      (not (in_city_on vilnius ?d2))
      (not (in_city_on bucharest ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (in_city_on ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friends_on_day_6
    :parameters ()
    :precondition (and
      (in_city_on bucharest d6)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_on_day_7
    :parameters ()
    :precondition (and
      (in_city_on bucharest d7)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_on_day_8
    :parameters ()
    :precondition (and
      (in_city_on bucharest d8)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_on_day_9
    :parameters ()
    :precondition (and
      (in_city_on bucharest d9)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_on_day_10
    :parameters ()
    :precondition (and
      (in_city_on bucharest d10)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_on_day_11
    :parameters ()
    :precondition (and
      (in_city_on bucharest d11)
      (not (friends_met))
    )
    :effect (friends_met)
  )
)