(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step_count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (count_istanbul ?n - step_count)
    (count_tallinn ?n - step_count)
    (count_zurich ?n - step_count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - step_count)
    (is_show_day ?d - day)
    (is_not_show_day ?d - day)
    (conn ?c1 ?c2 - city)
  )

  ;; Travel between cities. Does not advance the day.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (conn ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Spend a day in Istanbul. Only possible if it's not a show day in Zurich.
  (:action stay_istanbul
    :parameters (?d - day ?nd - day ?c - step_count ?nc - step_count)
    :precondition (and
      (at istanbul)
      (current_day ?d)
      (next_day ?d ?nd)
      (is_not_show_day ?d)
      (count_istanbul ?c)
      (next_count ?c ?nc)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (count_istanbul ?c))
      (count_istanbul ?nc)
    )
  )

  ;; Spend a day in Tallinn. Only possible if it's not a show day in Zurich.
  (:action stay_tallinn
    :parameters (?d - day ?nd - day ?c - step_count ?nc - step_count)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?nd)
      (is_not_show_day ?d)
      (count_tallinn ?c)
      (next_count ?c ?nc)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (count_tallinn ?c))
      (count_tallinn ?nc)
    )
  )

  ;; Spend a day in Zurich. Possible on any day.
  (:action stay_zurich
    :parameters (?d - day ?nd - day ?c - step_count ?nc - step_count)
    :precondition (and
      (at zurich)
      (current_day ?d)
      (next_day ?d ?nd)
      (count_zurich ?c)
      (next_count ?c ?nc)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (count_zurich ?c))
      (count_zurich ?nc)
    )
  )
)