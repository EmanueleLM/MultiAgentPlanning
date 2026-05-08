(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (visited_all_days)

    (in_oslo)
    (in_dublin)
    (in_valencia)

    (valencia_window_day ?d - day)
    (has_valencia_window_visit)
  )

  (:action start_in_oslo
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (and
      (at oslo)
    )
  )

  (:action start_in_dublin
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (and
      (at dublin)
    )
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (and
      (at valencia)
    )
  )

  (:action spend_day_in_oslo_from_oslo
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at oslo)
      (not (in_oslo))
    )
    :effect (and
      (in_oslo)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action spend_day_in_oslo_from_dublin
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at dublin)
      (direct dublin oslo)
      (not (in_oslo))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (in_oslo)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action spend_day_in_dublin_from_dublin
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at dublin)
      (not (in_dublin))
    )
    :effect (and
      (in_dublin)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action spend_day_in_dublin_from_oslo
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at oslo)
      (direct oslo dublin)
      (not (in_dublin))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (in_dublin)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action spend_day_in_dublin_from_valencia
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at valencia)
      (direct valencia dublin)
      (not (in_dublin))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (in_dublin)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action spend_day_in_valencia_from_valencia
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at valencia)
      (not (in_valencia))
    )
    :effect (and
      (in_valencia)
      (not (current_day ?d))
      (current_day ?dnext)
      (when_dummy)
    )
  )

  (:action spend_day_in_valencia_from_dublin
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at dublin)
      (direct dublin valencia)
      (not (in_valencia))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (in_valencia)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action spend_last_day_in_oslo_from_oslo
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at oslo)
      (not (in_oslo))
    )
    :effect (and
      (in_oslo)
      (not (current_day ?d))
      (visited_all_days)
    )
  )

  (:action spend_last_day_in_oslo_from_dublin
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at dublin)
      (direct dublin oslo)
      (not (in_oslo))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (in_oslo)
      (not (current_day ?d))
      (visited_all_days)
    )
  )

  (:action spend_last_day_in_dublin_from_dublin
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at dublin)
      (not (in_dublin))
    )
    :effect (and
      (in_dublin)
      (not (current_day ?d))
      (visited_all_days)
    )
  )

  (:action spend_last_day_in_dublin_from_oslo
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at oslo)
      (direct oslo dublin)
      (not (in_dublin))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (in_dublin)
      (not (current_day ?d))
      (visited_all_days)
    )
  )

  (:action spend_last_day_in_dublin_from_valencia
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at valencia)
      (direct valencia dublin)
      (not (in_dublin))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (in_dublin)
      (not (current_day ?d))
      (visited_all_days)
    )
  )

  (:action spend_last_day_in_valencia_from_valencia
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at valencia)
      (not (in_valencia))
    )
    :effect (and
      (in_valencia)
      (not (current_day ?d))
      (visited_all_days)
    )
  )

  (:action spend_last_day_in_valencia_from_dublin
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at dublin)
      (direct dublin valencia)
      (not (in_valencia))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (in_valencia)
      (not (current_day ?d))
      (visited_all_days)
    )
  )
)