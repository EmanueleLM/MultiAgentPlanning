(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    stay_count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (stayed ?c - city ?n - stay_count)
    (next_count ?n1 - stay_count ?n2 - stay_count)

    (workshop_window_day ?d - day)
    (workshop_attended)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?d_next - day ?n_from - stay_count ?n_to - stay_count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (stayed ?c ?n_from)
      (next_count ?n_from ?n_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stayed ?c ?n_from))
      (stayed ?c ?n_to)
    )
  )

  (:action stay_day_and_attend_workshop
    :parameters (?d - day ?d_next - day ?n_from - stay_count ?n_to - stay_count)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_window_day ?d)
      (not (workshop_attended))
      (stayed florence ?n_from)
      (next_count ?n_from ?n_to)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stayed florence ?n_from))
      (stayed florence ?n_to)
      (workshop_attended)
    )
  )

  (:action fly_and_stay_day
    :parameters (?from - city ?to - city ?d - day ?d_next - day ?n_from - stay_count ?n_to - stay_count)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d)
      (next_day ?d ?d_next)
      (stayed ?to ?n_from)
      (next_count ?n_from ?n_to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stayed ?to ?n_from))
      (stayed ?to ?n_to)
    )
  )

  (:action fly_to_florence_and_attend_workshop
    :parameters (?from - city ?d - day ?d_next - day ?n_from - stay_count ?n_to - stay_count)
    :precondition (and
      (at ?from)
      (not (at florence))
      (direct ?from florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_window_day ?d)
      (not (workshop_attended))
      (stayed florence ?n_from)
      (next_count ?n_from ?n_to)
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stayed florence ?n_from))
      (stayed florence ?n_to)
      (workshop_attended)
    )
  )
)