(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (final_day ?d - day)
    (used_start)
    (met_friends)
  )

  (:action start_in_amsterdam
    :parameters ()
    :precondition (and
      (not (used_start))
      (current_day day_1)
      (not (at vilnius day_1))
      (not (at bucharest day_1))
    )
    :effect (and
      (used_start)
      (at amsterdam day_1)
    )
  )

  (:action start_in_vilnius
    :parameters ()
    :precondition (and
      (not (used_start))
      (current_day day_1)
      (not (at amsterdam day_1))
      (not (at bucharest day_1))
    )
    :effect (and
      (used_start)
      (at vilnius day_1)
    )
  )

  (:action start_in_bucharest
    :parameters ()
    :precondition (and
      (not (used_start))
      (current_day day_1)
      (not (at amsterdam day_1))
      (not (at vilnius day_1))
    )
    :effect (and
      (used_start)
      (at bucharest day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (not (at amsterdam ?d2))
      (not (at vilnius ?d2))
      (not (at bucharest ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at amsterdam ?d2))
      (not (at vilnius ?d2))
      (not (at bucharest ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
    )
  )

  (:action meet_friends_day_6
    :parameters ()
    :precondition (and
      (at bucharest day_6)
      (not (met_friends))
    )
    :effect (and
      (met_friends))
  )

  (:action meet_friends_day_7
    :parameters ()
    :precondition (and
      (at bucharest day_7)
      (not (met_friends))
    )
    :effect (and
      (met_friends))
  )

  (:action meet_friends_day_8
    :parameters ()
    :precondition (and
      (at bucharest day_8)
      (not (met_friends))
    )
    :effect (and
      (met_friends))
  )

  (:action meet_friends_day_9
    :parameters ()
    :precondition (and
      (at bucharest day_9)
      (not (met_friends))
    )
    :effect (and
      (met_friends))
  )

  (:action meet_friends_day_10
    :parameters ()
    :precondition (and
      (at bucharest day_10)
      (not (met_friends))
    )
    :effect (and
      (met_friends))
  )

  (:action meet_friends_day_11
    :parameters ()
    :precondition (and
      (at bucharest day_11)
      (not (met_friends))
    )
    :effect (and
      (met_friends))
  )
)