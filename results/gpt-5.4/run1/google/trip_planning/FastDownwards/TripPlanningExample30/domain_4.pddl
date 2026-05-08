(define (domain european_trip_14_days_min_init)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (today ?d - day)
    (next ?d1 - day ?d2 - day)
    (spent ?d - day ?c - city)

    (visited_istanbul)
    (visited_tallinn)
    (visited_zurich)

    (need_istanbul_1)
    (need_istanbul_2)
    (need_istanbul_3)
    (need_istanbul_4)
    (need_istanbul_5)

    (need_tallinn_1)
    (need_tallinn_2)
    (need_tallinn_3)
    (need_tallinn_4)

    (need_zurich_1)
    (need_zurich_2)
    (need_zurich_3)
    (need_zurich_4)
    (need_zurich_5)
    (need_zurich_6)
    (need_zurich_7)

    (show_pending_d1)
    (show_pending_d2)
    (show_pending_d3)
    (show_pending_d4)
    (show_pending_d5)
    (show_pending_d6)
    (show_pending_d7)

    (finished)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (spent ?d ?c)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action stay_last
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (spent ?d ?c)
      (not (today ?d))
      (finished)
    )
  )

  (:action fly_istanbul_tallinn
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at istanbul)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at istanbul))
      (at tallinn)
      (spent ?d tallinn)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_istanbul_zurich
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at istanbul)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at istanbul))
      (at zurich)
      (spent ?d zurich)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_tallinn_istanbul
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at tallinn)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at tallinn))
      (at istanbul)
      (spent ?d istanbul)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_tallinn_zurich
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at tallinn)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at tallinn))
      (at zurich)
      (spent ?d zurich)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_zurich_istanbul
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at zurich)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at zurich))
      (at istanbul)
      (spent ?d istanbul)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_zurich_tallinn
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at zurich)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at zurich))
      (at tallinn)
      (spent ?d tallinn)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action fly_istanbul_tallinn_last
    :parameters (?d - day)
    :precondition (and
      (at istanbul)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (not (at istanbul))
      (at tallinn)
      (spent ?d tallinn)
      (not (today ?d))
      (finished)
    )
  )

  (:action fly_istanbul_zurich_last
    :parameters (?d - day)
    :precondition (and
      (at istanbul)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (not (at istanbul))
      (at zurich)
      (spent ?d zurich)
      (not (today ?d))
      (finished)
    )
  )

  (:action fly_tallinn_istanbul_last
    :parameters (?d - day)
    :precondition (and
      (at tallinn)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (not (at tallinn))
      (at istanbul)
      (spent ?d istanbul)
      (not (today ?d))
      (finished)
    )
  )

  (:action fly_tallinn_zurich_last
    :parameters (?d - day)
    :precondition (and
      (at tallinn)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (not (at tallinn))
      (at zurich)
      (spent ?d zurich)
      (not (today ?d))
      (finished)
    )
  )

  (:action fly_zurich_istanbul_last
    :parameters (?d - day)
    :precondition (and
      (at zurich)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (not (at zurich))
      (at istanbul)
      (spent ?d istanbul)
      (not (today ?d))
      (finished)
    )
  )

  (:action fly_zurich_tallinn_last
    :parameters (?d - day)
    :precondition (and
      (at zurich)
      (today ?d)
      (not (next ?d ?d))
    )
    :effect (and
      (not (at zurich))
      (at tallinn)
      (spent ?d tallinn)
      (not (today ?d))
      (finished)
    )
  )

  (:action mark_visited_istanbul
    :parameters (?d - day)
    :precondition (and
      (spent ?d istanbul)
      (not (visited_istanbul))
    )
    :effect (visited_istanbul)
  )

  (:action mark_visited_tallinn
    :parameters (?d - day)
    :precondition (and
      (spent ?d tallinn)
      (not (visited_tallinn))
    )
    :effect (visited_tallinn)
  )

  (:action mark_visited_zurich
    :parameters (?d - day)
    :precondition (and
      (spent ?d zurich)
      (not (visited_zurich))
    )
    :effect (visited_zurich)
  )

  (:action count_istanbul_1
    :parameters (?d - day)
    :precondition (and (spent ?d istanbul) (need_istanbul_1))
    :effect (and (not (need_istanbul_1)))
  )

  (:action count_istanbul_2
    :parameters (?d - day)
    :precondition (and (spent ?d istanbul) (need_istanbul_2) (not (need_istanbul_1)))
    :effect (and (not (need_istanbul_2)))
  )

  (:action count_istanbul_3
    :parameters (?d - day)
    :precondition (and (spent ?d istanbul) (need_istanbul_3) (not (need_istanbul_2)))
    :effect (and (not (need_istanbul_3)))
  )

  (:action count_istanbul_4
    :parameters (?d - day)
    :precondition (and (spent ?d istanbul) (need_istanbul_4) (not (need_istanbul_3)))
    :effect (and (not (need_istanbul_4)))
  )

  (:action count_istanbul_5
    :parameters (?d - day)
    :precondition (and (spent ?d istanbul) (need_istanbul_5) (not (need_istanbul_4)))
    :effect (and (not (need_istanbul_5)))
  )

  (:action count_tallinn_1
    :parameters (?d - day)
    :precondition (and (spent ?d tallinn) (need_tallinn_1))
    :effect (and (not (need_tallinn_1)))
  )

  (:action count_tallinn_2
    :parameters (?d - day)
    :precondition (and (spent ?d tallinn) (need_tallinn_2) (not (need_tallinn_1)))
    :effect (and (not (need_tallinn_2)))
  )

  (:action count_tallinn_3
    :parameters (?d - day)
    :precondition (and (spent ?d tallinn) (need_tallinn_3) (not (need_tallinn_2)))
    :effect (and (not (need_tallinn_3)))
  )

  (:action count_tallinn_4
    :parameters (?d - day)
    :precondition (and (spent ?d tallinn) (need_tallinn_4) (not (need_tallinn_3)))
    :effect (and (not (need_tallinn_4)))
  )

  (:action count_zurich_1
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_1))
    :effect (and (not (need_zurich_1)))
  )

  (:action count_zurich_2
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_2) (not (need_zurich_1)))
    :effect (and (not (need_zurich_2)))
  )

  (:action count_zurich_3
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_3) (not (need_zurich_2)))
    :effect (and (not (need_zurich_3)))
  )

  (:action count_zurich_4
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_4) (not (need_zurich_3)))
    :effect (and (not (need_zurich_4)))
  )

  (:action count_zurich_5
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_5) (not (need_zurich_4)))
    :effect (and (not (need_zurich_5)))
  )

  (:action count_zurich_6
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_6) (not (need_zurich_5)))
    :effect (and (not (need_zurich_6)))
  )

  (:action count_zurich_7
    :parameters (?d - day)
    :precondition (and (spent ?d zurich) (need_zurich_7) (not (need_zurich_6)))
    :effect (and (not (need_zurich_7)))
  )

  (:action attend_show_d1
    :parameters ()
    :precondition (and (show_pending_d1) (spent d1 zurich))
    :effect (and (not (show_pending_d1)))
  )

  (:action attend_show_d2
    :parameters ()
    :precondition (and (show_pending_d2) (spent d2 zurich))
    :effect (and (not (show_pending_d2)))
  )

  (:action attend_show_d3
    :parameters ()
    :precondition (and (show_pending_d3) (spent d3 zurich))
    :effect (and (not (show_pending_d3)))
  )

  (:action attend_show_d4
    :parameters ()
    :precondition (and (show_pending_d4) (spent d4 zurich))
    :effect (and (not (show_pending_d4)))
  )

  (:action attend_show_d5
    :parameters ()
    :precondition (and (show_pending_d5) (spent d5 zurich))
    :effect (and (not (show_pending_d5)))
  )

  (:action attend_show_d6
    :parameters ()
    :precondition (and (show_pending_d6) (spent d6 zurich))
    :effect (and (not (show_pending_d6)))
  )

  (:action attend_show_d7
    :parameters ()
    :precondition (and (show_pending_d7) (spent d7 zurich))
    :effect (and (not (show_pending_d7)))
  )
)