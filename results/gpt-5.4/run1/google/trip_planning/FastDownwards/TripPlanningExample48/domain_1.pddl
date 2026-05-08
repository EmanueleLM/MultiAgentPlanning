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
    (visited ?c - city)
    (friend_met)
    (total_days_split_2)
    (total_days_manchester_2)
    (total_days_geneva_2)
    (done)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at ?c ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at ?to ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?to)
    )
  )

  (:action meet_friend_on_day_2
    :parameters ()
    :precondition (and
      (current_day day_2)
      (at split day_2)
      (not (friend_met))
    )
    :effect (friend_met)
  )

  (:action meet_friend_on_day_3
    :parameters ()
    :precondition (and
      (current_day day_3)
      (at split day_3)
      (not (friend_met))
    )
    :effect (friend_met)
  )

  (:action certify_split_2_days
    :parameters ()
    :precondition (and
      (at split day_1)
      (at split day_2)
      (at split day_3)
      (at split day_4)
      (not (total_days_split_2))
    )
    :effect (total_days_split_2)
  )

  (:action certify_manchester_2_days
    :parameters ()
    :precondition (and
      (at manchester day_1)
      (at manchester day_2)
      (at manchester day_3)
      (at manchester day_4)
      (not (total_days_manchester_2))
    )
    :effect (total_days_manchester_2)
  )

  (:action certify_geneva_2_days
    :parameters ()
    :precondition (and
      (at geneva day_1)
      (at geneva day_2)
      (at geneva day_3)
      (at geneva day_4)
      (not (total_days_geneva_2))
    )
    :effect (total_days_geneva_2)
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day day_4)
      (friend_met)
      (visited manchester)
      (visited split)
      (visited geneva)
      (not (done))
    )
    :effect (done)
  )
)