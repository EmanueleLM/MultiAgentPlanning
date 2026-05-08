(define (domain european_trip_13_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count_stockholm
    count_athens
    count_mykonos
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (at ?c - city ?d - day)

    (current_day ?d - day)
    (processed ?d - day)
    (trip_complete)

    (stockholm_count ?s - count_stockholm)
    (athens_count ?a - count_athens)
    (mykonos_count ?m - count_mykonos)

    (next_stockholm ?from - count_stockholm ?to - count_stockholm)
    (next_athens ?from - count_athens ?to - count_athens)
    (next_mykonos ?from - count_mykonos ?to - count_mykonos)

    (counted ?d - day)
  )

  (:action count_day_in_stockholm
    :parameters (?d - day ?s_from - count_stockholm ?s_to - count_stockholm)
    :precondition (and
      (current_day ?d)
      (at stockholm ?d)
      (not (counted ?d))
      (stockholm_count ?s_from)
      (next_stockholm ?s_from ?s_to)
    )
    :effect (and
      (not (stockholm_count ?s_from))
      (stockholm_count ?s_to)
      (counted ?d)
    )
  )

  (:action count_day_in_athens
    :parameters (?d - day ?a_from - count_athens ?a_to - count_athens)
    :precondition (and
      (current_day ?d)
      (at athens ?d)
      (not (counted ?d))
      (athens_count ?a_from)
      (next_athens ?a_from ?a_to)
    )
    :effect (and
      (not (athens_count ?a_from))
      (athens_count ?a_to)
      (counted ?d)
    )
  )

  (:action count_day_in_mykonos
    :parameters (?d - day ?m_from - count_mykonos ?m_to - count_mykonos)
    :precondition (and
      (current_day ?d)
      (at mykonos ?d)
      (not (counted ?d))
      (mykonos_count ?m_from)
      (next_mykonos ?m_from ?m_to)
    )
    :effect (and
      (not (mykonos_count ?m_from))
      (mykonos_count ?m_to)
      (counted ?d)
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (counted ?d1)
      (at ?c ?d1)
      (not (processed ?d1))
      (not (at stockholm ?d2))
      (not (at athens ?d2))
      (not (at mykonos ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (processed ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (counted ?d1)
      (at ?from ?d1)
      (direct_flight ?from ?to)
      (not (processed ?d1))
      (not (at stockholm ?d2))
      (not (at athens ?d2))
      (not (at mykonos ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (processed ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action finalize_last_day
    :parameters ()
    :precondition (and
      (current_day d13)
      (counted d13)
      (not (processed d13))
    )
    :effect (and
      (processed d13)
      (not (current_day d13))
      (trip_complete)
    )
  )
)