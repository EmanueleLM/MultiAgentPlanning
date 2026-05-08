(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (direct_flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (occupied ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c ?d)
      (next_day ?d ?dnext)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?c ?dnext)
      (occupied ?dnext)
    )
  )

  (:action fly
    :parameters (?cfrom - city ?cto - city ?d - day ?dnext - day)
    :precondition (and
      (at ?cfrom ?d)
      (next_day ?d ?dnext)
      (direct_flight ?cfrom ?cto)
      (not (occupied ?dnext))
    )
    :effect (and
      (at ?cto ?dnext)
      (occupied ?dnext)
    )
  )
)