(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (meeting_window ?d - day)
    (met_friend)
    (unstarted)
    (classified ?d - day)
    (requires_valencia ?d - day)
    (requires_amsterdam ?d - day)
    (requires_tallinn ?d - day)
  )

  (:action start_in_amsterdam
    :parameters ()
    :precondition (and
      (unstarted)
      (not (at amsterdam day_1))
      (not (at valencia day_1))
      (not (at tallinn day_1))
    )
    :effect (and
      (at amsterdam day_1)
      (not (unstarted))
    )
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (unstarted)
      (not (at amsterdam day_1))
      (not (at valencia day_1))
      (not (at tallinn day_1))
    )
    :effect (and
      (at valencia day_1)
      (not (unstarted))
    )
  )

  (:action start_in_tallinn
    :parameters ()
    :precondition (and
      (unstarted)
      (not (at amsterdam day_1))
      (not (at valencia day_1))
      (not (at tallinn day_1))
    )
    :effect (and
      (at tallinn day_1)
      (not (unstarted))
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (not (at amsterdam ?d2))
      (not (at valencia ?d2))
      (not (at tallinn ?d2))
    )
    :effect (and
      (at ?c ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (at amsterdam ?d2))
      (not (at valencia ?d2))
      (not (at tallinn ?d2))
    )
    :effect (and
      (at ?to ?d2)
    )
  )

  (:action classify_day_as_valencia
    :parameters (?d - day)
    :precondition (and
      (at valencia ?d)
      (not (classified ?d))
      (not (requires_valencia ?d))
      (not (requires_amsterdam ?d))
      (not (requires_tallinn ?d))
    )
    :effect (and
      (classified ?d)
      (requires_valencia ?d)
    )
  )

  (:action classify_day_as_amsterdam
    :parameters (?d - day)
    :precondition (and
      (at amsterdam ?d)
      (not (classified ?d))
      (not (requires_valencia ?d))
      (not (requires_amsterdam ?d))
      (not (requires_tallinn ?d))
    )
    :effect (and
      (classified ?d)
      (requires_amsterdam ?d)
    )
  )

  (:action classify_day_as_tallinn
    :parameters (?d - day)
    :precondition (and
      (at tallinn ?d)
      (not (classified ?d))
      (not (requires_valencia ?d))
      (not (requires_amsterdam ?d))
      (not (requires_tallinn ?d))
    )
    :effect (and
      (classified ?d)
      (requires_tallinn ?d)
    )
  )

  (:action meet_friend_in_tallinn
    :parameters (?d - day)
    :precondition (and
      (at tallinn ?d)
      (meeting_window ?d)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)