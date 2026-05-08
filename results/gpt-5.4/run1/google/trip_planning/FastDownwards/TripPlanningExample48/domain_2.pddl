(define (domain trip_planning_example48)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (in_split ?d - day)
    (in_manchester ?d - day)
    (in_geneva ?d - day)
    (friend_met)
  )

  (:action stay_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at split ?d1)
      (not (at split ?d2))
    )
    :effect (and
      (at split ?d2)
      (in_split ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at manchester ?d1)
      (not (at manchester ?d2))
    )
    :effect (and
      (at manchester ?d2)
      (in_manchester ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at geneva ?d1)
      (not (at geneva ?d2))
    )
    :effect (and
      (at geneva ?d2)
      (in_geneva ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_manchester_to_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at manchester ?d1)
      (direct manchester split)
      (not (at split ?d2))
    )
    :effect (and
      (at split ?d2)
      (in_split ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_split_to_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at split ?d1)
      (direct split manchester)
      (not (at manchester ?d2))
    )
    :effect (and
      (at manchester ?d2)
      (in_manchester ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_manchester_to_geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at manchester ?d1)
      (direct manchester geneva)
      (not (at geneva ?d2))
    )
    :effect (and
      (at geneva ?d2)
      (in_geneva ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_geneva_to_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at geneva ?d1)
      (direct geneva manchester)
      (not (at manchester ?d2))
    )
    :effect (and
      (at manchester ?d2)
      (in_manchester ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_split_to_geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at split ?d1)
      (direct split geneva)
      (not (at geneva ?d2))
    )
    :effect (and
      (at geneva ?d2)
      (in_geneva ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_geneva_to_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at geneva ?d1)
      (direct geneva split)
      (not (at split ?d2))
    )
    :effect (and
      (at split ?d2)
      (in_split ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action meet_friend_day2
    :parameters ()
    :precondition (and
      (current_day day_2)
      (at split day_2)
      (not (friend_met))
    )
    :effect (friend_met)
  )

  (:action meet_friend_day3
    :parameters ()
    :precondition (and
      (current_day day_3)
      (at split day_3)
      (not (friend_met))
    )
    :effect (friend_met)
  )
)