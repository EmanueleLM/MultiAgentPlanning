(define (domain trip-domain)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day agent)
  (:constants istanbul budapest dubrovnik - city
              day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
              istanbul_agent budapest_agent dubrovnik_agent orchestrator - agent)
  (:predicates
    (at ?c - city)
    (free-day ?d - day)
    (stayed ?c - city ?d - day)
  )
  (:action stay_dubrovnik_by_dubrovnik_agent
    :parameters (?d - day)
    :precondition (and (at dubrovnik) (free-day ?d))
    :effect (and (stayed dubrovnik ?d) (not (free-day ?d)))
  )
  (:action stay_istanbul_by_istanbul_agent
    :parameters (?d - day)
    :precondition (and (at istanbul) (free-day ?d))
    :effect (and (stayed istanbul ?d) (not (free-day ?d)))
  )
  (:action stay_budapest_by_budapest_agent
    :parameters (?d - day)
    :precondition (and (at budapest) (free-day ?d))
    :effect (and (stayed budapest ?d) (not (free-day ?d)))
  )
  (:action fly_dubrovnik_to_istanbul_by_dubrovnik_agent
    :parameters ()
    :precondition (and (at dubrovnik))
    :effect (and (not (at dubrovnik)) (at istanbul))
  )
  (:action fly_istanbul_to_budapest_by_istanbul_agent
    :parameters ()
    :precondition (and (at istanbul))
    :effect (and (not (at istanbul)) (at budapest))
  )
  (:action fly_budapest_to_istanbul_by_budapest_agent
    :parameters ()
    :precondition (and (at budapest))
    :effect (and (not (at budapest)) (at istanbul))
  )
)