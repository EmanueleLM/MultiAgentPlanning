(define (domain trip_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person loc day)

  (:constants riga manchester split - loc)

  (:predicates
    (at ?p - person ?l - loc)
    (visited ?l - loc)
    (days ?d - day)
    (connected ?from ?to - loc)
    (next-day ?from ?to - day)
  )

  (:action fly_direct
    :parameters (?p - person ?from - loc ?to - loc)
    :precondition (and (at ?p ?from) (connected ?from ?to) (not (visited ?to)))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action riga_agent_stay_riga
    :parameters (?p - person ?before - day ?after - day)
    :precondition (and (at ?p riga) (not (visited riga)) (days ?before) (next-day ?before ?after))
    :effect (and (visited riga) (not (days ?before)) (days ?after))
  )

  (:action manchester_agent_stay_manchester
    :parameters (?p - person ?before - day ?after - day)
    :precondition (and (at ?p manchester) (not (visited manchester)) (days ?before) (next-day ?before ?after))
    :effect (and (visited manchester) (not (days ?before)) (days ?after))
  )

  (:action split_agent_stay_split
    :parameters (?p - person ?before - day ?after - day)
    :precondition (and (at ?p split) (not (visited split)) (days ?before) (next-day ?before ?after))
    :effect (and (visited split) (not (days ?before)) (days ?after))
  )
)