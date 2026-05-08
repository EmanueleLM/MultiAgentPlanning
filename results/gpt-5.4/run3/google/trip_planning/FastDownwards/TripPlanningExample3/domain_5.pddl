(define (domain tripplanningexample3)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (at ?c - city)
    (current_day ?d - day)

    (visited_on ?c - city ?d - day)

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

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_on ?c ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited_on ?to ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )

  (:action count_berlin_from_3
    :parameters (?d - day)
    :precondition (and
      (visited_on berlin ?d)
      (need_berlin_3)
    )
    :effect (and
      (not (need_berlin_3))
      (need_berlin_2)
    )
  )

  (:action count_berlin_from_2
    :parameters (?d - day)
    :precondition (and
      (visited_on berlin ?d)
      (need_berlin_2)
    )
    :effect (and
      (not (need_berlin_2))
      (need_berlin_1)
    )
  )

  (:action count_berlin_from_1
    :parameters (?d - day)
    :precondition (and
      (visited_on berlin ?d)
      (need_berlin_1)
    )
    :effect (and
      (not (need_berlin_1))
      (need_berlin_0)
    )
  )

  (:action count_warsaw_from_3
    :parameters (?d - day)
    :precondition (and
      (visited_on warsaw ?d)
      (need_warsaw_3)
    )
    :effect (and
      (not (need_warsaw_3))
      (need_warsaw_2)
    )
  )

  (:action count_warsaw_from_2
    :parameters (?d - day)
    :precondition (and
      (visited_on warsaw ?d)
      (need_warsaw_2)
    )
    :effect (and
      (not (need_warsaw_2))
      (need_warsaw_1)
    )
  )

  (:action count_warsaw_from_1
    :parameters (?d - day)
    :precondition (and
      (visited_on warsaw ?d)
      (need_warsaw_1)
    )
    :effect (and
      (not (need_warsaw_1))
      (need_warsaw_0)
    )
  )

  (:action count_bucharest_from_2
    :parameters (?d - day)
    :precondition (and
      (visited_on bucharest ?d)
      (need_bucharest_2)
    )
    :effect (and
      (not (need_bucharest_2))
      (need_bucharest_1)
    )
  )

  (:action count_bucharest_from_1
    :parameters (?d - day)
    :precondition (and
      (visited_on bucharest ?d)
      (need_bucharest_1)
    )
    :effect (and
      (not (need_bucharest_1))
      (need_bucharest_0)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (friend_window ?d)
      (visited_on bucharest ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)