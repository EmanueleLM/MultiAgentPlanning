(define (domain european_trip_17_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (lyon_count ?n - count)
    (zurich_count ?n - count)
    (rome_count ?n - count)

    (lyon_succ ?n1 - count ?n2 - count)
    (zurich_succ ?n1 - count ?n2 - count)
    (rome_succ ?n1 - count ?n2 - count)

    (wedding_satisfied)
  )

  (:action stay_in_lyon_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (lyon_count ?n1)
      (lyon_succ ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (lyon_count ?n1))
      (lyon_count ?n2)
    )
  )

  (:action stay_in_rome_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at rome)
      (rome_count ?n1)
      (rome_succ ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (rome_count ?n1))
      (rome_count ?n2)
    )
  )

  (:action stay_in_zurich_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at zurich)
      (zurich_count ?n1)
      (zurich_succ ?n1 ?n2)
      (not (wedding_satisfied))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (zurich_count ?n1))
      (zurich_count ?n2)
      (wedding_satisfied)
    )
  )

  (:action stay_in_zurich_and_advance_after_wedding
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at zurich)
      (zurich_count ?n1)
      (zurich_succ ?n1 ?n2)
      (wedding_satisfied)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (zurich_count ?n1))
      (zurich_count ?n2)
    )
  )

  (:action fly_rome_to_lyon_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at rome)
      (direct_flight rome lyon)
      (lyon_count ?n1)
      (lyon_succ ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at rome))
      (at lyon)
      (not (lyon_count ?n1))
      (lyon_count ?n2)
    )
  )

  (:action fly_lyon_to_rome_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at lyon)
      (direct_flight lyon rome)
      (rome_count ?n1)
      (rome_succ ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at lyon))
      (at rome)
      (not (rome_count ?n1))
      (rome_count ?n2)
    )
  )

  (:action fly_rome_to_zurich_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at rome)
      (direct_flight rome zurich)
      (zurich_count ?n1)
      (zurich_succ ?n1 ?n2)
      (not (wedding_satisfied))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at rome))
      (at zurich)
      (not (zurich_count ?n1))
      (zurich_count ?n2)
      (wedding_satisfied)
    )
  )

  (:action fly_rome_to_zurich_and_advance_after_wedding
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at rome)
      (direct_flight rome zurich)
      (zurich_count ?n1)
      (zurich_succ ?n1 ?n2)
      (wedding_satisfied)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at rome))
      (at zurich)
      (not (zurich_count ?n1))
      (zurich_count ?n2)
    )
  )

  (:action fly_zurich_to_rome_and_advance
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at zurich)
      (direct_flight zurich rome)
      (rome_count ?n1)
      (rome_succ ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at zurich))
      (at rome)
      (not (rome_count ?n1))
      (rome_count ?n2)
    )
  )
)