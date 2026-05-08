(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d - day ?nd - day)
    (current_day ?d - day)
    (current_city ?c - city)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (start_chosen)

    (rk_yes ?d - day)
    (rk_no ?d - day)
    (po_yes ?d - day)
    (po_no ?d - day)
    (mi_yes ?d - day)
    (mi_no ?d - day)

    (rk1 ?d1 - day)
    (rk2 ?d1 - day ?d2 - day)
    (rk3 ?d1 - day ?d2 - day ?d3 - day)
    (rk4 ?d1 - day ?d2 - day ?d3 - day ?d4 - day)
    (rk5 ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?d5 - day)
    (rk6 ?d1 - day ?d2 - day ?d3 - day ?d4 - day ?d5 - day ?d6 - day)

    (po1 ?d1 - day)
    (po2 ?d1 - day ?d2 - day)

    (mi1 ?d1 - day)
    (mi2 ?d1 - day ?d2 - day)
    (mi3 ?d1 - day ?d2 - day ?d3 - day)
    (mi4 ?d1 - day ?d2 - day ?d3 - day ?d4 - day)
  )

  (:action initialize_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (not (start_chosen))
    )
    :effect (and
      (start_chosen)
      (current_city ?c)
      (assigned day_1)
      (at ?c day_1)

      (when_dummy_not_used)
    )
  )

  (:action mark_day_1_reykjavik
    :parameters ()
    :precondition (and
      (assigned day_1)
      (at reykjavik day_1)
      (not (rk_yes day_1))
      (not (rk_no day_1))
    )
    :effect (and
      (rk_yes day_1)
      (rk1 day_1)
    )
  )

  (:action mark_day_1_not_reykjavik
    :parameters ()
    :precondition (and
      (assigned day_1)
      (not (at reykjavik day_1))
      (not (rk_yes day_1))
      (not (rk_no day_1))
    )
    :effect (and
      (rk_no day_1)
    )
  )

  (:action mark_day_1_porto
    :parameters ()
    :precondition (and
      (assigned day_1)
      (at porto day_1)
      (not (po_yes day_1))
      (not (po_no day_1))
    )
    :effect (and
      (po_yes day_1)
      (po1 day_1)
    )
  )

  (:action mark_day_1_not_porto
    :parameters ()
    :precondition (and
      (assigned day_1)
      (not (at porto day_1))
      (not (po_yes day_1))
      (not (po_no day_1))
    )
    :effect (and
      (po_no day_1)
    )
  )

  (:action mark_day_1_milan
    :parameters ()
    :precondition (and
      (assigned day_1)
      (at milan day_1)
      (not (mi_yes day_1))
      (not (mi_no day_1))
    )
    :effect (and
      (mi_yes day_1)
      (mi1 day_1)
    )
  )

  (:action mark_day_1_not_milan
    :parameters ()
    :precondition (and
      (assigned day_1)
      (not (at milan day_1))
      (not (mi_yes day_1))
      (not (mi_no day_1))
    )
    :effect (and
      (mi_no day_1)
    )
  )

  (:action stay_to_next_day
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (current_city ?c)
      (assigned ?d)
      (not (assigned ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (assigned ?nd)
      (at ?c ?nd)
    )
  )

  (:action fly_to_next_day
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (current_city ?from)
      (direct ?from ?to)
      (assigned ?d)
      (not (assigned ?nd))
      (not (current_city ?to))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (current_city ?from))
      (current_city ?to)
      (assigned ?nd)
      (at ?to ?nd)
    )
  )

  (:action mark_reykjavik_yes
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (at reykjavik ?d)
      (not (rk_yes ?d))
      (not (rk_no ?d))
    )
    :effect (and
      (rk_yes ?d)
      (rk1 ?d)
    )
  )

  (:action mark_reykjavik_no
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (not (at reykjavik ?d))
      (not (rk_yes ?d))
      (not (rk_no ?d))
    )
    :effect (and
      (rk_no ?d)
    )
  )

  (:action mark_porto_yes
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (at porto ?d)
      (not (po_yes ?d))
      (not (po_no ?d))
    )
    :effect (and
      (po_yes ?d)
      (po1 ?d)
    )
  )

  (:action mark_porto_no
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (not (at porto ?d))
      (not (po_yes ?d))
      (not (po_no ?d))
    )
    :effect (and
      (po_no ?d)
    )
  )

  (:action mark_milan_yes
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (at milan ?d)
      (not (mi_yes ?d))
      (not (mi_no ?d))
    )
    :effect (and
      (mi_yes ?d)
      (mi1 ?d)
    )
  )

  (:action mark_milan_no
    :parameters (?d - day)
    :precondition (and
      (assigned ?d)
      (not (at milan ?d))
      (not (mi_yes ?d))
      (not (mi_no ?d))
    )
    :effect (and
      (mi_no ?d)
    )
  )

  (:action extend_rk_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (rk1 ?d1)
      (rk_yes ?d2)
      (not (rk2 ?d1 ?d2))
    )
    :effect (and
      (rk2 ?d1 ?d2)
    )
  )

  (:action extend_rk_to_3
    :parameters (?d1 - day ?d2 - day ?d3 - day)
    :precondition (and
      (rk2 ?d1 ?d2)
      (rk_yes ?d3)
      (not (rk3 ?d1 ?d2 ?d3))
    )
    :effect (and
      (rk3 ?d1 ?d2 ?d3)
    )
  )

  (:action extend_rk_to_4
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day)
    :precondition (and
      (rk3 ?d1 ?d2 ?d3)
      (rk_yes ?d4)
      (not (rk4 ?d1 ?d2 ?d3 ?d4))
    )
    :effect (and
      (rk4 ?d1 ?d2 ?d3 ?d4)
    )
  )

  (:action extend_rk_to_5
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day ?d5 - day)
    :precondition (and
      (rk4 ?d1 ?d2 ?d3 ?d4)
      (rk_yes ?d5)
      (not (rk5 ?d1 ?d2 ?d3 ?d4 ?d5))
    )
    :effect (and
      (rk5 ?d1 ?d2 ?d3 ?d4 ?d5)
    )
  )

  (:action extend_rk_to_6
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day ?d5 - day ?d6 - day)
    :precondition (and
      (rk5 ?d1 ?d2 ?d3 ?d4 ?d5)
      (rk_yes ?d6)
      (not (rk6 ?d1 ?d2 ?d3 ?d4 ?d5 ?d6))
    )
    :effect (and
      (rk6 ?d1 ?d2 ?d3 ?d4 ?d5 ?d6)
    )
  )

  (:action extend_po_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (po1 ?d1)
      (po_yes ?d2)
      (not (po2 ?d1 ?d2))
    )
    :effect (and
      (po2 ?d1 ?d2)
    )
  )

  (:action extend_mi_to_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (mi1 ?d1)
      (mi_yes ?d2)
      (not (mi2 ?d1 ?d2))
    )
    :effect (and
      (mi2 ?d1 ?d2)
    )
  )

  (:action extend_mi_to_3
    :parameters (?d1 - day ?d2 - day ?d3 - day)
    :precondition (and
      (mi2 ?d1 ?d2)
      (mi_yes ?d3)
      (not (mi3 ?d1 ?d2 ?d3))
    )
    :effect (and
      (mi3 ?d1 ?d2 ?d3)
    )
  )

  (:action extend_mi_to_4
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day)
    :precondition (and
      (mi3 ?d1 ?d2 ?d3)
      (mi_yes ?d4)
      (not (mi4 ?d1 ?d2 ?d3 ?d4))
    )
    :effect (and
      (mi4 ?d1 ?d2 ?d3 ?d4)
    )
  )
)