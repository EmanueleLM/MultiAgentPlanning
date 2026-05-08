(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (in ?c - city ?d - day)
    (current_day ?d - day)
    (friends_met)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (in amsterdam day_1))
      (not (in vilnius day_1))
      (not (in bucharest day_1))
    )
    :effect (in ?c day_1)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (in ?c ?d1)
      (not (in amsterdam ?d2))
      (not (in vilnius ?d2))
      (not (in bucharest ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (in ?from ?d1)
      (direct ?from ?to)
      (not (in amsterdam ?d2))
      (not (in vilnius ?d2))
      (not (in bucharest ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?to ?d2)
    )
  )

  (:action meet_friends_day_6
    :parameters ()
    :precondition (and
      (current_day day_6)
      (in bucharest day_6)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day_7
    :parameters ()
    :precondition (and
      (current_day day_7)
      (in bucharest day_7)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day_8
    :parameters ()
    :precondition (and
      (current_day day_8)
      (in bucharest day_8)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day_9
    :parameters ()
    :precondition (and
      (current_day day_9)
      (in bucharest day_9)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day_10
    :parameters ()
    :precondition (and
      (current_day day_10)
      (in bucharest day_10)
      (not (friends_met))
    )
    :effect (friends_met)
  )

  (:action meet_friends_day_11
    :parameters ()
    :precondition (and
      (current_day day_11)
      (in bucharest day_11)
      (not (friends_met))
    )
    :effect (friends_met)
  )
)