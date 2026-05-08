(define (domain europe_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (current_day ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
    (visited ?c - city)

    (start_pending)
    (processed ?d - day)
  )

  (:action choose_start_lyon
    :parameters ()
    :precondition (and
      (start_pending)
      (current_day d1)
      (not (at lyon))
      (not (at frankfurt))
      (not (at krakow))
    )
    :effect (and
      (at lyon)
      (visited lyon)
      (not (start_pending))
    )
  )

  (:action choose_start_frankfurt
    :parameters ()
    :precondition (and
      (start_pending)
      (current_day d1)
      (not (at lyon))
      (not (at frankfurt))
      (not (at krakow))
    )
    :effect (and
      (at frankfurt)
      (visited frankfurt)
      (not (start_pending))
    )
  )

  (:action choose_start_krakow
    :parameters ()
    :precondition (and
      (start_pending)
      (current_day d1)
      (not (at lyon))
      (not (at frankfurt))
      (not (at krakow))
    )
    :effect (and
      (at krakow)
      (visited krakow)
      (not (start_pending))
    )
  )

  (:action stay_and_advance
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (not (start_pending))
      (not (processed ?d))
      (not (occupied ?d lyon))
      (not (occupied ?d frankfurt))
      (not (occupied ?d krakow))
    )
    :effect (and
      (occupied ?d ?c)
      (visited ?c)
      (processed ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_and_advance
    :parameters (?d - day ?d_next - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct ?from ?to)
      (not (start_pending))
      (not (processed ?d))
      (not (occupied ?d lyon))
      (not (occupied ?d frankfurt))
      (not (occupied ?d krakow))
    )
    :effect (and
      (occupied ?d ?from)
      (visited ?from)
      (processed ?d)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action assign_final_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (not (start_pending))
      (not (processed ?d))
      (not (occupied ?d lyon))
      (not (occupied ?d frankfurt))
      (not (occupied ?d krakow))
    )
    :effect (and
      (occupied ?d ?c)
      (visited ?c)
      (processed ?d)
      (not (current_day ?d))
    )
  )
)