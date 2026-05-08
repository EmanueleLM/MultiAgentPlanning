(define (domain trip16)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:constants
    porto oslo dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (attended ?d - day)
  )

  (:action fly_porto_oslo_agentA
    :parameters (?d - day ?d2 - day)
    :precondition (and (at porto ?d) (next ?d ?d2))
    :effect (and (not (at porto ?d)) (at oslo ?d2))
  )

  (:action fly_oslo_dubrovnik_agentB
    :parameters (?d - day ?d2 - day)
    :precondition (and (at oslo ?d) (next ?d ?d2))
    :effect (and (not (at oslo ?d)) (at dubrovnik ?d2))
  )

  (:action fly_dubrovnik_oslo_agentB
    :parameters (?d - day ?d2 - day)
    :precondition (and (at dubrovnik ?d) (next ?d ?d2))
    :effect (and (not (at dubrovnik ?d)) (at oslo ?d2))
  )

  (:action stay_agentC
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2))
  )

  (:action attend_agentC_day12
    :parameters ()
    :precondition (and (at dubrovnik day12))
    :effect (and (attended day12))
  )

  (:action attend_agentC_day16
    :parameters ()
    :precondition (and (at dubrovnik day16))
    :effect (and (attended day16))
  )
)