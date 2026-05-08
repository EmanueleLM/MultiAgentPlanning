(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day fr_count fl_count va_count
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (at ?c - city ?d - day)
    (assigned ?d - day)
    (start_choice_open)
    (valencia_window_satisfied)

    (fr_rank ?r - fr_count)
    (fr_next ?r1 - fr_count ?r2 - fr_count)

    (fl_rank ?r - fl_count)
    (fl_next ?r1 - fl_count ?r2 - fl_count)

    (va_rank ?r - va_count)
    (va_next ?r1 - va_count ?r2 - va_count)
  )

  (:action initialize_day1_frankfurt
    :parameters (?fr0 - fr_count ?fr1 - fr_count)
    :precondition (and
      (start_choice_open)
      (fr_rank ?fr0)
      (fr_next ?fr0 ?fr1)
    )
    :effect (and
      (not (start_choice_open))
      (assigned d1)
      (at frankfurt d1)
      (not (fr_rank ?fr0))
      (fr_rank ?fr1)
    )
  )

  (:action initialize_day1_florence
    :parameters (?fl0 - fl_count ?fl1 - fl_count)
    :precondition (and
      (start_choice_open)
      (fl_rank ?fl0)
      (fl_next ?fl0 ?fl1)
    )
    :effect (and
      (not (start_choice_open))
      (assigned d1)
      (at florence d1)
      (not (fl_rank ?fl0))
      (fl_rank ?fl1)
    )
  )

  (:action initialize_day1_valencia
    :parameters (?va0 - va_count ?va1 - va_count)
    :precondition (and
      (start_choice_open)
      (va_rank ?va0)
      (va_next ?va0 ?va1)
      (not (valencia_window_satisfied))
    )
    :effect (and
      (not (start_choice_open))
      (assigned d1)
      (at valencia d1)
      (valencia_window_satisfied)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action stay_frankfurt
    :parameters (?d1 - day ?d2 - day ?fr0 - fr_count ?fr1 - fr_count)
    :precondition (and
      (assigned ?d1)
      (at frankfurt ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (fr_rank ?fr0)
      (fr_next ?fr0 ?fr1)
    )
    :effect (and
      (assigned ?d2)
      (at frankfurt ?d2)
      (not (fr_rank ?fr0))
      (fr_rank ?fr1)
    )
  )

  (:action stay_florence
    :parameters (?d1 - day ?d2 - day ?fl0 - fl_count ?fl1 - fl_count)
    :precondition (and
      (assigned ?d1)
      (at florence ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (fl_rank ?fl0)
      (fl_next ?fl0 ?fl1)
    )
    :effect (and
      (assigned ?d2)
      (at florence ?d2)
      (not (fl_rank ?fl0))
      (fl_rank ?fl1)
    )
  )

  (:action stay_valencia_day2
    :parameters (?va0 - va_count ?va1 - va_count)
    :precondition (and
      (assigned d1)
      (at valencia d1)
      (next_day d1 d2)
      (not (assigned d2))
      (va_rank ?va0)
      (va_next ?va0 ?va1)
      (not (valencia_window_satisfied))
    )
    :effect (and
      (assigned d2)
      (at valencia d2)
      (valencia_window_satisfied)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action stay_valencia_after_window
    :parameters (?d1 - day ?d2 - day ?va0 - va_count ?va1 - va_count)
    :precondition (and
      (assigned ?d1)
      (at valencia ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (not (valencia_window_satisfied))
      (not (next_day d1 ?d2))
      (va_rank ?va0)
      (va_next ?va0 ?va1)
    )
    :effect (and
      (assigned ?d2)
      (at valencia ?d2)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action stay_valencia_window_already_satisfied
    :parameters (?d1 - day ?d2 - day ?va0 - va_count ?va1 - va_count)
    :precondition (and
      (assigned ?d1)
      (at valencia ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (valencia_window_satisfied)
      (va_rank ?va0)
      (va_next ?va0 ?va1)
    )
    :effect (and
      (assigned ?d2)
      (at valencia ?d2)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action fly_frankfurt_to_florence
    :parameters (?d1 - day ?d2 - day ?fl0 - fl_count ?fl1 - fl_count)
    :precondition (and
      (assigned ?d1)
      (at frankfurt ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (direct_flight frankfurt florence)
      (fl_rank ?fl0)
      (fl_next ?fl0 ?fl1)
    )
    :effect (and
      (assigned ?d2)
      (at florence ?d2)
      (not (fl_rank ?fl0))
      (fl_rank ?fl1)
    )
  )

  (:action fly_florence_to_frankfurt
    :parameters (?d1 - day ?d2 - day ?fr0 - fr_count ?fr1 - fr_count)
    :precondition (and
      (assigned ?d1)
      (at florence ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (direct_flight florence frankfurt)
      (fr_rank ?fr0)
      (fr_next ?fr0 ?fr1)
    )
    :effect (and
      (assigned ?d2)
      (at frankfurt ?d2)
      (not (fr_rank ?fr0))
      (fr_rank ?fr1)
    )
  )

  (:action fly_frankfurt_to_valencia_day2
    :parameters (?va0 - va_count ?va1 - va_count)
    :precondition (and
      (assigned d1)
      (at frankfurt d1)
      (next_day d1 d2)
      (not (assigned d2))
      (direct_flight frankfurt valencia)
      (va_rank ?va0)
      (va_next ?va0 ?va1)
      (not (valencia_window_satisfied))
    )
    :effect (and
      (assigned d2)
      (at valencia d2)
      (valencia_window_satisfied)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action fly_frankfurt_to_valencia_after_window
    :parameters (?d1 - day ?d2 - day ?va0 - va_count ?va1 - va_count)
    :precondition (and
      (assigned ?d1)
      (at frankfurt ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (direct_flight frankfurt valencia)
      (not (valencia_window_satisfied))
      (not (next_day d1 ?d2))
      (va_rank ?va0)
      (va_next ?va0 ?va1)
    )
    :effect (and
      (assigned ?d2)
      (at valencia ?d2)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action fly_frankfurt_to_valencia_window_already_satisfied
    :parameters (?d1 - day ?d2 - day ?va0 - va_count ?va1 - va_count)
    :precondition (and
      (assigned ?d1)
      (at frankfurt ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (direct_flight frankfurt valencia)
      (valencia_window_satisfied)
      (va_rank ?va0)
      (va_next ?va0 ?va1)
    )
    :effect (and
      (assigned ?d2)
      (at valencia ?d2)
      (not (va_rank ?va0))
      (va_rank ?va1)
    )
  )

  (:action fly_valencia_to_frankfurt
    :parameters (?d1 - day ?d2 - day ?fr0 - fr_count ?fr1 - fr_count)
    :precondition (and
      (assigned ?d1)
      (at valencia ?d1)
      (next_day ?d1 ?d2)
      (not (assigned ?d2))
      (direct_flight valencia frankfurt)
      (fr_rank ?fr0)
      (fr_next ?fr0 ?fr1)
    )
    :effect (and
      (assigned ?d2)
      (at frankfurt ?d2)
      (not (fr_rank ?fr0))
      (fr_rank ?fr1)
    )
  )
)