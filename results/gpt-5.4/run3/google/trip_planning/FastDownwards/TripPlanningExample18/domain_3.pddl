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

  (:action start_in_city
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

  (:action stay_to_next_day
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

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (in_city_on amsterdam ?d2))
      (not (in_city_on vilnius ?d2))
      (not (in_city_on bucharest ?d2))
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (in_city_on ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friends_day6
    :parameters ()
    :precondition (and
      (in_city_on bucharest d6)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day7
    :parameters ()
    :precondition (and
      (in_city_on bucharest d7)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day8
    :parameters ()
    :precondition (and
      (in_city_on bucharest d8)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day9
    :parameters ()
    :precondition (and
      (in_city_on bucharest d9)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day10
    :parameters ()
    :precondition (and
      (in_city_on bucharest d10)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day11
    :parameters ()
    :precondition (and
      (in_city_on bucharest d11)
      (not (friends_met))
    )
    :effect (friends_met)
  )
)