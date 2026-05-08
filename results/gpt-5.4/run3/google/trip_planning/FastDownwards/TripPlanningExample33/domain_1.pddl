(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:constants
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (current_day ?d - day)
    (direct_flight ?from - city ?to - city)
    (meeting_window ?d - day)
    (met_friend)
    (b_count ?n - count)
    (k_count ?n - count)
    (r_count ?n - count)
    (next_count ?n1 - count ?n2 - count)
  )

  (:action choose_start_barcelona
    :parameters ()
    :precondition (and
      (not (assigned day_1))
      (b_count c0)
      (k_count c0)
      (r_count c0)
    )
    :effect (and
      (at barcelona day_1)
      (assigned day_1)
      (current_day day_1)
      (not (b_count c0))
      (b_count c1)
    )
  )

  (:action choose_start_krakow
    :parameters ()
    :precondition (and
      (not (assigned day_1))
      (b_count c0)
      (k_count c0)
      (r_count c0)
    )
    :effect (and
      (at krakow day_1)
      (assigned day_1)
      (current_day day_1)
      (not (k_count c0))
      (k_count c1)
    )
  )

  (:action choose_start_rome
    :parameters ()
    :precondition (and
      (not (assigned day_1))
      (b_count c0)
      (k_count c0)
      (r_count c0)
    )
    :effect (and
      (at rome day_1)
      (assigned day_1)
      (current_day day_1)
      (not (r_count c0))
      (r_count c1)
    )
  )

  (:action stay_to_next_day_barcelona
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at barcelona ?d1)
      (not (assigned ?d2))
      (b_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at barcelona ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (b_count ?n1))
      (b_count ?n2)
    )
  )

  (:action stay_to_next_day_krakow
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at krakow ?d1)
      (not (assigned ?d2))
      (k_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (k_count ?n1))
      (k_count ?n2)
    )
  )

  (:action stay_to_next_day_rome
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at rome ?d1)
      (not (assigned ?d2))
      (r_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at rome ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (r_count ?n1))
      (r_count ?n2)
    )
  )

  (:action fly_to_next_day_barcelona_to_krakow
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at barcelona ?d1)
      (direct_flight barcelona krakow)
      (not (assigned ?d2))
      (k_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at krakow ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (k_count ?n1))
      (k_count ?n2)
    )
  )

  (:action fly_to_next_day_krakow_to_barcelona
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at krakow ?d1)
      (direct_flight krakow barcelona)
      (not (assigned ?d2))
      (b_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at barcelona ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (b_count ?n1))
      (b_count ?n2)
    )
  )

  (:action fly_to_next_day_barcelona_to_rome
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at barcelona ?d1)
      (direct_flight barcelona rome)
      (not (assigned ?d2))
      (r_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at rome ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (r_count ?n1))
      (r_count ?n2)
    )
  )

  (:action fly_to_next_day_rome_to_barcelona
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at rome ?d1)
      (direct_flight rome barcelona)
      (not (assigned ?d2))
      (b_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at barcelona ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (b_count ?n1))
      (b_count ?n2)
    )
  )

  (:action mark_met_friend
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (at krakow ?d)
      (meeting_window ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)