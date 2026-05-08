(define (domain european_trip_15_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day visit_count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (vienna_count ?v - visit_count)
    (next_vienna_count ?from - visit_count ?to - visit_count)

    (vilnius_count ?v - visit_count)
    (next_vilnius_count ?from - visit_count ?to - visit_count)

    (valencia_count ?v - visit_count)
    (next_valencia_count ?from - visit_count ?to - visit_count)

    (conference_day_9_done)
    (conference_day_15_done)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_in_vienna
    :parameters (?d - day ?dnext - day ?v_from - visit_count ?v_to - visit_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at vienna)
      (vienna_count ?v_from)
      (next_vienna_count ?v_from ?v_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (vienna_count ?v_from))
      (vienna_count ?v_to)
    )
  )

  (:action stay_in_vilnius
    :parameters (?d - day ?dnext - day ?v_from - visit_count ?v_to - visit_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at vilnius)
      (vilnius_count ?v_from)
      (next_vilnius_count ?v_from ?v_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (vilnius_count ?v_from))
      (vilnius_count ?v_to)
    )
  )

  (:action stay_in_valencia_nonconference
    :parameters (?d - day ?dnext - day ?v_from - visit_count ?v_to - visit_count)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at valencia)
      (valencia_count ?v_from)
      (next_valencia_count ?v_from ?v_to)
      (not (current_day day_9))
      (not (current_day day_15))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (valencia_count ?v_from))
      (valencia_count ?v_to)
    )
  )

  (:action stay_in_valencia_day_9
    :parameters (?v_from - visit_count ?v_to - visit_count)
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (at valencia)
      (valencia_count ?v_from)
      (next_valencia_count ?v_from ?v_to)
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (not (valencia_count ?v_from))
      (valencia_count ?v_to)
      (conference_day_9_done)
    )
  )

  (:action stay_in_valencia_day_15
    :parameters (?v_from - visit_count ?v_to - visit_count)
    :precondition (and
      (current_day day_15)
      (next_day day_15 day_16)
      (at valencia)
      (valencia_count ?v_from)
      (next_valencia_count ?v_from ?v_to)
    )
    :effect (and
      (not (current_day day_15))
      (current_day day_16)
      (not (valencia_count ?v_from))
      (valencia_count ?v_to)
      (conference_day_15_done)
    )
  )
)