(define (domain tripplanningexample33)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current ?d - day)
    (next ?d1 - day ?d2 - day)

    (stay_target ?d - day ?c - city)
    (friend_day ?d - day)

    (visited_rome)
    (visited_barcelona)
    (visited_krakow)
    (met_friend)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?d2)
      (stay_target ?d ?c)
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (visited_rome)
      (visited_barcelona)
      (visited_krakow)
    )
  )

  (:action stay_day_and_meet_friend
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at krakow)
      (current ?d)
      (next ?d ?d2)
      (stay_target ?d krakow)
      (friend_day ?d)
      (not (met_friend))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (met_friend)
      (visited_rome)
      (visited_barcelona)
      (visited_krakow)
    )
  )

  (:action fly_for_next_day
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current ?d)
      (next ?d ?d2)
      (direct ?from ?to)
      (stay_target ?d2 ?to)
      (not (stay_target ?d ?from))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d))
      (current ?d2)
      (visited_rome)
      (visited_barcelona)
      (visited_krakow)
    )
  )
)