(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    riga_count
    manchester_count
    split_count
  )

  (:predicates
    (at_day ?d - day ?c - city)
    (planned ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (riga_level ?n - riga_count)
    (next_riga ?n1 - riga_count ?n2 - riga_count)

    (manchester_level ?n - manchester_count)
    (next_manchester ?n1 - manchester_count ?n2 - manchester_count)

    (split_level ?n - split_count)
    (next_split ?n1 - split_count ?n2 - split_count)
  )

  (:action start_in_riga
    :parameters ()
    :precondition (and
      (not (planned d1))
      (riga_level r0)
    )
    :effect (and
      (planned d1)
      (at_day d1 riga)
      (not (riga_level r0))
      (riga_level r1)
    )
  )

  (:action start_in_manchester
    :parameters ()
    :precondition (and
      (not (planned d1))
      (manchester_level m0)
    )
    :effect (and
      (planned d1)
      (at_day d1 manchester)
      (not (manchester_level m0))
      (manchester_level m1)
    )
  )

  (:action start_in_split
    :parameters ()
    :precondition (and
      (not (planned d1))
      (split_level s0)
    )
    :effect (and
      (planned d1)
      (at_day d1 split)
      (not (split_level s0))
      (split_level s1)
    )
  )

  (:action stay_in_riga
    :parameters (?d1 - day ?d2 - day ?r_from - riga_count ?r_to - riga_count)
    :precondition (and
      (next_day ?d1 ?d2)
      (planned ?d1)
      (at_day ?d1 riga)
      (not (planned ?d2))
      (riga_level ?r_from)
      (next_riga ?r_from ?r_to)
    )
    :effect (and
      (planned ?d2)
      (at_day ?d2 riga)
      (not (riga_level ?r_from))
      (riga_level ?r_to)
    )
  )

  (:action stay_in_manchester
    :parameters (?d1 - day ?d2 - day ?m_from - manchester_count ?m_to - manchester_count)
    :precondition (and
      (next_day ?d1 ?d2)
      (planned ?d1)
      (at_day ?d1 manchester)
      (not (planned ?d2))
      (manchester_level ?m_from)
      (next_manchester ?m_from ?m_to)
    )
    :effect (and
      (planned ?d2)
      (at_day ?d2 manchester)
      (not (manchester_level ?m_from))
      (manchester_level ?m_to)
    )
  )

  (:action stay_in_split
    :parameters (?d1 - day ?d2 - day ?s_from - split_count ?s_to - split_count)
    :precondition (and
      (next_day ?d1 ?d2)
      (planned ?d1)
      (at_day ?d1 split)
      (not (planned ?d2))
      (split_level ?s_from)
      (next_split ?s_from ?s_to)
    )
    :effect (and
      (planned ?d2)
      (at_day ?d2 split)
      (not (split_level ?s_from))
      (split_level ?s_to)
    )
  )

  (:action fly_riga_to_manchester
    :parameters (?d1 - day ?d2 - day ?m_from - manchester_count ?m_to - manchester_count)
    :precondition (and
      (next_day ?d1 ?d2)
      (planned ?d1)
      (at_day ?d1 riga)
      (not (planned ?d2))
      (direct_flight riga manchester)
      (manchester_level ?m_from)
      (next_manchester ?m_from ?m_to)
    )
    :effect (and
      (planned ?d2)
      (at_day ?d2 manchester)
      (not (manchester_level ?m_from))
      (manchester_level ?m_to)
    )
  )

  (:action fly_manchester_to_riga
    :parameters (?d1 - day ?d2 - day ?r_from - riga_count ?r_to - riga_count)
    :precondition (and
      (next_day ?d1 ?d2)
      (planned ?d1)
      (at_day ?d1 manchester)
      (not (planned ?d2))
      (direct_flight manchester riga)
      (riga_level ?r_from)
      (next_riga ?r_from ?r_to)
    )
    :effect (and
      (planned ?d2)
      (at_day ?d2 riga)
      (not (riga_level ?r_from))
      (riga_level ?r_to)
    )
  )

  (:action fly_manchester_to_split
    :parameters (?d1 - day ?d2 - day ?s_from - split_count ?s_to - split_count)
    :precondition (and
      (next_day ?d1 ?d2)
      (planned ?d1)
      (at_day ?d1 manchester)
      (not (planned ?d2))
      (direct_flight manchester split)
      (split_level ?s_from)
      (next_split ?s_from ?s_to)
    )
    :effect (and
      (planned ?d2)
      (at_day ?d2 split)
      (not (split_level ?s_from))
      (split_level ?s_to)
    )
  )
)