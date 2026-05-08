(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (at ?c - city ?d - day)
    (free ?d - day)

    (current_day ?d - day)
    (started)
    (finished)

    (need_rk_6)
    (need_rk_5)
    (need_rk_4)
    (need_rk_3)
    (need_rk_2)
    (need_rk_1)

    (need_mi_4)
    (need_mi_3)
    (need_mi_2)
    (need_mi_1)

    (need_po_2)
    (need_po_1)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (not (started))
      (current_day day_1)
      (free day_1)
    )
    :effect (and
      (started)
      (at ?c day_1)
      (not (free day_1))
      (when_rk_start ?c)
      (when_mi_start ?c)
      (when_po_start ?c))
  )

  (:action stay
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at ?c ?d)
      (free ?nd)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at ?c ?nd)
      (not (free ?nd))
      (when_rk_stay ?c)
      (when_mi_stay ?c)
      (when_po_stay ?c))
  )

  (:action fly
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at ?from ?d)
      (direct ?from ?to)
      (free ?nd)
      (not (finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at ?to ?nd)
      (not (free ?nd))
      (when_rk_fly ?to)
      (when_mi_fly ?to)
      (when_po_fly ?to))
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day day_10)
      (at porto day_10)
      (at porto day_9)
      (need_rk_1)
      (need_mi_1)
      (need_po_1)
      (not (finished))
    )
    :effect (finished)
  )
)