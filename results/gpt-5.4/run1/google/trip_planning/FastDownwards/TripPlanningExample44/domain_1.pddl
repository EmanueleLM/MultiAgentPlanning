(define (domain european_trip_17_days_compact)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)

    (remaining_rome ?n - count)
    (remaining_lyon ?n - count)
    (remaining_zurich ?n - count)
    (pred_count ?from - count ?to - count)

    (goal_day ?d - day)
    (wedding_window ?d - day)
    (wedding_attended)

    (direct ?from - city ?to - city)
  )

  (:action stay_rome
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at rome)
      (remaining_rome ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_rome ?n))
      (remaining_rome ?n1)
    )
  )

  (:action stay_lyon
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at lyon)
      (remaining_lyon ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_lyon ?n))
      (remaining_lyon ?n1)
    )
  )

  (:action stay_zurich
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (remaining_zurich ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_zurich ?n))
      (remaining_zurich ?n1)
    )
  )

  (:action fly_rome_lyon
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at rome)
      (direct rome lyon)
      (remaining_lyon ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at rome))
      (at lyon)
      (not (remaining_lyon ?n))
      (remaining_lyon ?n1)
    )
  )

  (:action fly_lyon_rome
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at lyon)
      (direct lyon rome)
      (remaining_rome ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at lyon))
      (at rome)
      (not (remaining_rome ?n))
      (remaining_rome ?n1)
    )
  )

  (:action fly_rome_zurich
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at rome)
      (direct rome zurich)
      (remaining_zurich ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at rome))
      (at zurich)
      (not (remaining_zurich ?n))
      (remaining_zurich ?n1)
    )
  )

  (:action fly_zurich_rome
    :parameters (?d1 - day ?d2 - day ?n ?n1 - count)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at zurich)
      (direct zurich rome)
      (remaining_rome ?n)
      (pred_count ?n ?n1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at zurich))
      (at rome)
      (not (remaining_rome ?n))
      (remaining_rome ?n1)
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (at zurich)
      (current_day ?d)
      (wedding_window ?d)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )
)