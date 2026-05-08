(define (domain tripplanningexample3)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    berlin warsaw bucharest - city
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited_day ?d - day)
    (counted_berlin ?d - day)
    (counted_warsaw ?d - day)
    (counted_bucharest ?d - day)

    (need_berlin_3)
    (need_berlin_2)
    (need_berlin_1)
    (need_berlin_0)

    (need_warsaw_3)
    (need_warsaw_2)
    (need_warsaw_1)
    (need_warsaw_0)

    (need_bucharest_2)
    (need_bucharest_1)
    (need_bucharest_0)

    (friend_window ?d - day)
    (met_friend)
  )

  (:action start_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (not (visited_day ?d))
    )
    :effect (and
      (at ?c ?d)
      (visited_day ?d)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at ?c ?d1)
      (not (visited_day ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_day ?d1)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (visited_day ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action count_berlin_day
    :parameters (?d - day)
    :precondition (and
      (at berlin ?d)
      (need_berlin_3)
      (not (counted_berlin ?d))
    )
    :effect (and
      (not (need_berlin_3))
      (need_berlin_2)
      (counted_berlin ?d)
    )
  )

  (:action count_berlin_day_2
    :parameters (?d - day)
    :precondition (and
      (at berlin ?d)
      (need_berlin_2)
      (not (counted_berlin ?d))
    )
    :effect (and
      (not (need_berlin_2))
      (need_berlin_1)
      (counted_berlin ?d)
    )
  )

  (:action count_berlin_day_3
    :parameters (?d - day)
    :precondition (and
      (at berlin ?d)
      (need_berlin_1)
      (not (counted_berlin ?d))
    )
    :effect (and
      (not (need_berlin_1))
      (need_berlin_0)
      (counted_berlin ?d)
    )
  )

  (:action count_warsaw_day
    :parameters (?d - day)
    :precondition (and
      (at warsaw ?d)
      (need_warsaw_3)
      (not (counted_warsaw ?d))
    )
    :effect (and
      (not (need_warsaw_3))
      (need_warsaw_2)
      (counted_warsaw ?d)
    )
  )

  (:action count_warsaw_day_2
    :parameters (?d - day)
    :precondition (and
      (at warsaw ?d)
      (need_warsaw_2)
      (not (counted_warsaw ?d))
    )
    :effect (and
      (not (need_warsaw_2))
      (need_warsaw_1)
      (counted_warsaw ?d)
    )
  )

  (:action count_warsaw_day_3
    :parameters (?d - day)
    :precondition (and
      (at warsaw ?d)
      (need_warsaw_1)
      (not (counted_warsaw ?d))
    )
    :effect (and
      (not (need_warsaw_1))
      (need_warsaw_0)
      (counted_warsaw ?d)
    )
  )

  (:action count_bucharest_day
    :parameters (?d - day)
    :precondition (and
      (at bucharest ?d)
      (need_bucharest_2)
      (not (counted_bucharest ?d))
    )
    :effect (and
      (not (need_bucharest_2))
      (need_bucharest_1)
      (counted_bucharest ?d)
    )
  )

  (:action count_bucharest_day_2
    :parameters (?d - day)
    :precondition (and
      (at bucharest ?d)
      (need_bucharest_1)
      (not (counted_bucharest ?d))
    )
    :effect (and
      (not (need_bucharest_1))
      (need_bucharest_0)
      (counted_bucharest ?d)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (friend_window ?d)
      (at bucharest ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)