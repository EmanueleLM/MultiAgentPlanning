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
    (started)

    (spent ?c - city ?d - day)
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

  (:action start_in_city
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (not (started))
    )
    :effect (and
      (started)
      (at ?c)
      (spent ?c ?d)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (spent ?c ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent ?c ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (spent ?to ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (spent ?to ?d2)
    )
  )

  (:action count_berlin_day_from_3
    :parameters (?d - day)
    :precondition (and
      (spent berlin ?d)
      (need_berlin_3)
      (not (counted_berlin ?d))
    )
    :effect (and
      (not (need_berlin_3))
      (need_berlin_2)
      (counted_berlin ?d)
    )
  )

  (:action count_berlin_day_from_2
    :parameters (?d - day)
    :precondition (and
      (spent berlin ?d)
      (need_berlin_2)
      (not (counted_berlin ?d))
    )
    :effect (and
      (not (need_berlin_2))
      (need_berlin_1)
      (counted_berlin ?d)
    )
  )

  (:action count_berlin_day_from_1
    :parameters (?d - day)
    :precondition (and
      (spent berlin ?d)
      (need_berlin_1)
      (not (counted_berlin ?d))
    )
    :effect (and
      (not (need_berlin_1))
      (need_berlin_0)
      (counted_berlin ?d)
    )
  )

  (:action count_warsaw_day_from_3
    :parameters (?d - day)
    :precondition (and
      (spent warsaw ?d)
      (need_warsaw_3)
      (not (counted_warsaw ?d))
    )
    :effect (and
      (not (need_warsaw_3))
      (need_warsaw_2)
      (counted_warsaw ?d)
    )
  )

  (:action count_warsaw_day_from_2
    :parameters (?d - day)
    :precondition (and
      (spent warsaw ?d)
      (need_warsaw_2)
      (not (counted_warsaw ?d))
    )
    :effect (and
      (not (need_warsaw_2))
      (need_warsaw_1)
      (counted_warsaw ?d)
    )
  )

  (:action count_warsaw_day_from_1
    :parameters (?d - day)
    :precondition (and
      (spent warsaw ?d)
      (need_warsaw_1)
      (not (counted_warsaw ?d))
    )
    :effect (and
      (not (need_warsaw_1))
      (need_warsaw_0)
      (counted_warsaw ?d)
    )
  )

  (:action count_bucharest_day_from_2
    :parameters (?d - day)
    :precondition (and
      (spent bucharest ?d)
      (need_bucharest_2)
      (not (counted_bucharest ?d))
    )
    :effect (and
      (not (need_bucharest_2))
      (need_bucharest_1)
      (counted_bucharest ?d)
    )
  )

  (:action count_bucharest_day_from_1
    :parameters (?d - day)
    :precondition (and
      (spent bucharest ?d)
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
      (spent bucharest ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)