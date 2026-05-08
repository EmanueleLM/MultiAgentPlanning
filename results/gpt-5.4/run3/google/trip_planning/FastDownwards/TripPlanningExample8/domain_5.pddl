(define (domain trip_planning_example8)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:constants athens zurich krakow - city)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?dn - day)
    (direct ?from - city ?to - city)
    (visited_athens_on ?d - day)
    (need_athens_day_1)
    (need_athens_day_2)
    (need_athens_day_3)
    (need_athens_day_4)
    (need_athens_day_5)
    (need_athens_day_6)
    (need_athens_day_7)
    (need_zurich_day_1)
    (need_zurich_day_2)
    (need_zurich_day_3)
    (need_zurich_day_4)
    (need_zurich_day_5)
    (need_krakow_day_1)
    (need_krakow_day_2)
    (need_krakow_day_3)
    (need_krakow_day_4)
    (need_krakow_day_5)
    (need_krakow_day_6)
  )

  (:action stay_athens
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at athens))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (visited_athens_on ?d)
        (not (need_athens_day_1))
        (not (need_athens_day_2))
        (not (need_athens_day_3))
        (not (need_athens_day_4))
        (not (need_athens_day_5))
        (not (need_athens_day_6))
        (not (need_athens_day_7))
      )
  )

  (:action stay_zurich
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at zurich))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_zurich_day_1))
        (not (need_zurich_day_2))
        (not (need_zurich_day_3))
        (not (need_zurich_day_4))
        (not (need_zurich_day_5))
      )
  )

  (:action stay_krakow
    :parameters (?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at krakow))
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (not (need_krakow_day_1))
        (not (need_krakow_day_2))
        (not (need_krakow_day_3))
        (not (need_krakow_day_4))
        (not (need_krakow_day_5))
        (not (need_krakow_day_6))
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition
      (and
        (current_day ?d)
        (at ?from)
        (direct ?from ?to)
        (not (= ?from ?to)))
    :effect
      (and
        (not (at ?from))
        (at ?to))
  )
)