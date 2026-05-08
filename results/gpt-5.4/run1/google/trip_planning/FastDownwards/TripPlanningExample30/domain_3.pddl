(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day staycount
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (spent ?d - day ?c - city)
    (show_day ?d - day)
    (show_attended ?d - day)
    (istanbul_count ?n - staycount)
    (tallinn_count ?n - staycount)
    (zurich_count ?n - staycount)
    (next_count ?n1 - staycount ?n2 - staycount)
    (visited_istanbul)
    (visited_tallinn)
    (visited_zurich)
    (counted_istanbul ?d - day)
    (counted_tallinn ?d - day)
    (counted_zurich ?d - day)
    (finished)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d2)
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_last
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (not (next_day ?d ?d))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (finished)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d)
      (next_day ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_last
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d)
      (not (next_day ?d ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d ?to)
      (not (current_day ?d))
      (finished)
    )
  )

  (:action attend_show
    :parameters (?d - day)
    :precondition (and
      (show_day ?d)
      (spent ?d zurich)
      (not (show_attended ?d))
    )
    :effect (show_attended ?d)
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

  (:action count_istanbul_day
    :parameters (?d - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (spent ?d istanbul)
      (istanbul_count ?n1)
      (next_count ?n1 ?n2)
      (not (counted_istanbul ?d))
    )
    :effect (and
      (not (istanbul_count ?n1))
      (istanbul_count ?n2)
      (counted_istanbul ?d)
    )
  )

  (:action count_tallinn_day
    :parameters (?d - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (spent ?d tallinn)
      (tallinn_count ?n1)
      (next_count ?n1 ?n2)
      (not (counted_tallinn ?d))
    )
    :effect (and
      (not (tallinn_count ?n1))
      (tallinn_count ?n2)
      (counted_tallinn ?d)
    )
  )

  (:action count_zurich_day
    :parameters (?d - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (spent ?d zurich)
      (zurich_count ?n1)
      (next_count ?n1 ?n2)
      (not (counted_zurich ?d))
    )
    :effect (and
      (not (zurich_count ?n1))
      (zurich_count ?n2)
      (counted_zurich ?d)
    )
  )
)