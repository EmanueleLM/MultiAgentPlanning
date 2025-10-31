(define (domain trip_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person loc day level)

  (:predicates
    (at ?p - person ?l - loc)
    (connected ?from ?to - loc)
    (day-available ?d - day)
    (stayed ?l - loc ?lvl - level)
    (next-level ?from - level ?to - level)
  )

  (:action fly_direct
    :parameters (?p - person ?from - loc ?to - loc)
    :precondition (and (at ?p ?from) (connected ?from ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action riga_agent_stay_riga
    :parameters (?p - person ?d - day ?fromlvl - level ?tolvl - level)
    :precondition (and (at ?p riga) (stayed riga ?fromlvl) (next-level ?fromlvl ?tolvl) (day-available ?d))
    :effect (and (not (day-available ?d)) (not (stayed riga ?fromlvl)) (stayed riga ?tolvl))
  )

  (:action manchester_agent_stay_manchester
    :parameters (?p - person ?d - day ?fromlvl - level ?tolvl - level)
    :precondition (and (at ?p manchester) (stayed manchester ?fromlvl) (next-level ?fromlvl ?tolvl) (day-available ?d))
    :effect (and (not (day-available ?d)) (not (stayed manchester ?fromlvl)) (stayed manchester ?tolvl))
  )

  (:action split_agent_stay_split
    :parameters (?p - person ?d - day ?fromlvl - level ?tolvl - level)
    :precondition (and (at ?p split) (stayed split ?fromlvl) (next-level ?fromlvl ?tolvl) (day-available ?d))
    :effect (and (not (day-available ?d)) (not (stayed split ?fromlvl)) (stayed split ?tolvl))
  )
)