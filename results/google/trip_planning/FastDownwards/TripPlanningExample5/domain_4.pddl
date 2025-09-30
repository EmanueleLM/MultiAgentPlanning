(define (domain trip16)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:functions (total-cost))
  (:constants
    porto oslo dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (attended ?d - day)
  )

  (:action fly_porto_oslo
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at porto ?d1) (next ?d1 ?d2))
    :effect (and (at oslo ?d2) (increase (total-cost) 1))
  )

  (:action fly_oslo_porto
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at oslo ?d1) (next ?d1 ?d2))
    :effect (and (at porto ?d2) (increase (total-cost) 1))
  )

  (:action fly_oslo_dubrovnik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at oslo ?d1) (next ?d1 ?d2))
    :effect (and (at dubrovnik ?d2) (increase (total-cost) 1))
  )

  (:action fly_dubrovnik_oslo
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at dubrovnik ?d1) (next ?d1 ?d2))
    :effect (and (at oslo ?d2) (increase (total-cost) 1))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2) (increase (total-cost) 1))
  )

  (:action attend_day12
    :parameters ()
    :precondition (and (at dubrovnik day12))
    :effect (and (attended day12) (increase (total-cost) 1))
  )

  (:action attend_day16
    :parameters ()
    :precondition (and (at dubrovnik day16))
    :effect (and (attended day16) (increase (total-cost) 1))
  )
)