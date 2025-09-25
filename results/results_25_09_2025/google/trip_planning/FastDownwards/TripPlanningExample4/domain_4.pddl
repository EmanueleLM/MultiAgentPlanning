(define (domain trip-orchestration)
  (:requirements :strips :typing)
  (:types city day)
  (:constants
    tallinn seville munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  (:predicates
    (at ?c - city ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (met-friend)
  )
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2) (not (at ?c ?d1)))
  )
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct-flight ?from ?to) (next ?d1 ?d2))
    :effect (and (at ?to ?d2) (not (at ?from ?d1)))
  )
  (:action meet-friend-day11
    :parameters ()
    :precondition (and (at tallinn day11))
    :effect (met-friend)
  )
  (:action meet-friend-day12
    :parameters ()
    :precondition (and (at tallinn day12))
    :effect (met-friend)
  )
)