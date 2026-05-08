(define (domain european_trip_16_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (today ?d - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)

    (valencia_count ?n - count)
    (split_count ?n - count)
    (lyon_count ?n - count)
    (next_count ?n1 - count ?n2 - count)
  )

  (:action choose_start_valencia
    :parameters ()
    :precondition (and
      (today day_1)
      (not (assigned day_1))
      (valencia_count c0)
      (split_count c0)
      (lyon_count c0)
    )
    :effect (and
      (at valencia day_1)
      (assigned day_1)
      (not (valencia_count c0))
      (valencia_count c1)
    )
  )

  (:action choose_start_split
    :parameters ()
    :precondition (and
      (today day_1)
      (not (assigned day_1))
      (valencia_count c0)
      (split_count c0)
      (lyon_count c0)
    )
    :effect (and
      (at split day_1)
      (assigned day_1)
      (not (split_count c0))
      (split_count c1)
    )
  )

  (:action choose_start_lyon
    :parameters ()
    :precondition (and
      (today day_1)
      (not (assigned day_1))
      (valencia_count c0)
      (split_count c0)
      (lyon_count c0)
    )
    :effect (and
      (at lyon day_1)
      (assigned day_1)
      (not (lyon_count c0))
      (lyon_count c1)
    )
  )

  (:action stay_to_next_day_valencia
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at valencia ?d1)
      (not (assigned ?d2))
      (valencia_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at valencia ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (valencia_count ?n1))
      (valencia_count ?n2)
    )
  )

  (:action stay_to_next_day_split
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at split ?d1)
      (not (assigned ?d2))
      (split_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at split ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (split_count ?n1))
      (split_count ?n2)
    )
  )

  (:action stay_to_next_day_lyon
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at lyon ?d1)
      (not (assigned ?d2))
      (lyon_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (lyon_count ?n1))
      (lyon_count ?n2)
    )
  )

  (:action fly_valencia_to_lyon
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at valencia ?d1)
      (direct valencia lyon)
      (not (assigned ?d2))
      (lyon_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (lyon_count ?n1))
      (lyon_count ?n2)
    )
  )

  (:action fly_lyon_to_valencia
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at lyon ?d1)
      (direct lyon valencia)
      (not (assigned ?d2))
      (valencia_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at valencia ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (valencia_count ?n1))
      (valencia_count ?n2)
    )
  )

  (:action fly_lyon_to_split
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at lyon ?d1)
      (direct lyon split)
      (not (assigned ?d2))
      (split_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at split ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (split_count ?n1))
      (split_count ?n2)
    )
  )

  (:action fly_split_to_lyon
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (today ?d1)
      (next_day ?d1 ?d2)
      (at split ?d1)
      (direct split lyon)
      (not (assigned ?d2))
      (lyon_count ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (at lyon ?d2)
      (assigned ?d2)
      (not (today ?d1))
      (today ?d2)
      (not (lyon_count ?n1))
      (lyon_count ?n2)
    )
  )
)