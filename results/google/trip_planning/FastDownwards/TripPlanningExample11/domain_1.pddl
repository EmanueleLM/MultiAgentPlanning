(define (domain trip-planning)
  (:requirements :strips :typing)
  (:types city day)
  (:constants day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day)

  (:predicates
    (not_started)
    (current ?d - day)
    (at ?c - city)
    (at_day ?c - city ?d - day)
    (visited ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action traveler_start
    :parameters (?c - city)
    :precondition (and (not_started))
    :effect (and
      (not (not_started))
      (current day1)
      (at ?c)
      (at_day ?c day1)
      (visited ?c)
    )
  )

  (:action traveler_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (at ?c) (next ?d1 ?d2))
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (at ?c)
      (at_day ?c ?d2)
      (visited ?c)
    )
  )

  (:action flight_network_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (at ?from) (direct_flight ?from ?to) (next ?d1 ?d2))
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (at_day ?to ?d2)
      (visited ?to)
    )
  )
)