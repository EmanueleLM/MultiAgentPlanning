(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (visited_all_days)
    (day_spent_in ?d - day ?c - city)
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
    :effect (at oslo)
  )

  (:action start_in_dublin
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (at dublin)
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (at valencia)
  )

  (:action spend_day_in_oslo_from_oslo
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at oslo)
      (not (day_spent_in ?d oslo))
    )
    :effect (and
      (day_spent_in ?d oslo)
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
      (not (day_spent_in ?d oslo))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (day_spent_in ?d oslo)
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
      (not (day_spent_in ?d dublin))
    )
    :effect (and
      (day_spent_in ?d dublin)
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
      (not (day_spent_in ?d dublin))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (day_spent_in ?d dublin)
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
      (not (day_spent_in ?d dublin))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (day_spent_in ?d dublin)
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
      (not (day_spent_in ?d valencia))
    )
    :effect (and
      (day_spent_in ?d valencia)
      (not (current_day ?d))
      (current_day ?dnext)
      (has_valencia_window_visit)
    )
  )

  (:action spend_day_in_valencia_from_dublin
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at dublin)
      (direct dublin valencia)
      (not (day_spent_in ?d valencia))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (day_spent_in ?d valencia)
      (not (current_day ?d))
      (current_day ?dnext)
      (has_valencia_window_visit)
    )
  )

  (:action spend_last_day_in_oslo_from_oslo
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at oslo)
      (not (day_spent_in ?d oslo))
    )
    :effect (and
      (day_spent_in ?d oslo)
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
      (not (day_spent_in ?d oslo))
    )
    :effect (and
      (not (at dublin))
      (at oslo)
      (day_spent_in ?d oslo)
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
      (not (day_spent_in ?d dublin))
    )
    :effect (and
      (day_spent_in ?d dublin)
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
      (not (day_spent_in ?d dublin))
    )
    :effect (and
      (not (at oslo))
      (at dublin)
      (day_spent_in ?d dublin)
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
      (not (day_spent_in ?d dublin))
    )
    :effect (and
      (not (at valencia))
      (at dublin)
      (day_spent_in ?d dublin)
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
      (valencia_window_day ?d)
      (not (day_spent_in ?d valencia))
    )
    :effect (and
      (day_spent_in ?d valencia)
      (has_valencia_window_visit)
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
      (valencia_window_day ?d)
      (not (day_spent_in ?d valencia))
    )
    :effect (and
      (not (at dublin))
      (at valencia)
      (day_spent_in ?d valencia)
      (has_valencia_window_visit)
      (not (current_day ?d))
      (visited_all_days)
    )
  )
)