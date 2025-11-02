(define (domain integrated_trip_direct_flights)
  (:requirements :strips :typing)
  (:types city day person planner)
  (:constants
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    tourist - person
    amsterdam_agent santorini_agent istanbul_agent - planner
  )
  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (is-amsterdam ?c - city)
    (is-santorini ?c - city)
    (is-istanbul ?c - city)
    (visited-relatives)
  )

  (:action amsterdam_agent_stay
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p amsterdam ?d1) (next ?d1 ?d2))
    :effect (and (at ?p amsterdam ?d2))
  )

  (:action istanbul_agent_stay
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p istanbul ?d1) (next ?d1 ?d2))
    :effect (and (at ?p istanbul ?d2))
  )

  (:action santorini_agent_stay
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p santorini ?d1) (next ?d1 ?d2))
    :effect (and (at ?p santorini ?d2))
  )

  (:action amsterdam_agent_fly_to_istanbul
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p amsterdam ?d1) (direct amsterdam istanbul) (next ?d1 ?d2))
    :effect (and (at ?p istanbul ?d2))
  )

  (:action istanbul_agent_fly_to_amsterdam
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p istanbul ?d1) (direct istanbul amsterdam) (next ?d1 ?d2))
    :effect (and (at ?p amsterdam ?d2))
  )

  (:action amsterdam_agent_fly_to_santorini
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p amsterdam ?d1) (direct amsterdam santorini) (next ?d1 ?d2))
    :effect (and (at ?p santorini ?d2))
  )

  (:action santorini_agent_fly_to_amsterdam
    :parameters (?p - person ?d1 ?d2 - day)
    :precondition (and (at ?p santorini ?d1) (direct santorini amsterdam) (next ?d1 ?d2))
    :effect (and (at ?p amsterdam ?d2))
  )

  (:action santorini_agent_visit_relatives_day12
    :parameters (?p - person)
    :precondition (and (at ?p santorini day12))
    :effect (visited-relatives)
  )

  (:action santorini_agent_visit_relatives_day13
    :parameters (?p - person)
    :precondition (and (at ?p santorini day13))
    :effect (visited-relatives)
  )

  (:action santorini_agent_visit_relatives_day14
    :parameters (?p - person)
    :precondition (and (at ?p santorini day14))
    :effect (visited-relatives)
  )
)