(define (domain jack_of_all_trades_trip)
  (:requirements :typing :negative-preconditions :strips)
  (:types city day slot)
  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (day_assigned ?d - day)
    (flight ?from - city ?to - city)
    (slot_of ?s - slot ?c - city)
    (filled ?s - slot)
  )

  ;; stay in the same city for the next day: consumes one slot of that city
  (:action assign_stay
    :parameters (?d1 - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?d1 ?c)
      (next_day ?d1 ?d2)
      (not (day_assigned ?d2))
      (slot_of ?s ?c)
      (not (filled ?s))
    )
    :effect (and
      (assigned ?d2 ?c)
      (day_assigned ?d2)
      (filled ?s)
    )
  )

  ;; commute by direct flight between cities between consecutive days: consumes one slot in destination city
  (:action assign_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?s - slot)
    :precondition (and
      (assigned ?d1 ?from)
      (next_day ?d1 ?d2)
      (not (day_assigned ?d2))
      (flight ?from ?to)
      (slot_of ?s ?to)
      (not (filled ?s))
    )
    :effect (and
      (assigned ?d2 ?to)
      (day_assigned ?d2)
      (filled ?s)
    )
  )
)