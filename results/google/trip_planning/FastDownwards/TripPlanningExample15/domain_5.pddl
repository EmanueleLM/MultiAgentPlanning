(define (domain multiagent-trip)
  (:requirements :typing :negative-preconditions :fluents)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
    (assigned ?d - day)
    (wedding ?c - city ?d - day)
  )
  (:functions
    (days-in ?c - city)
    (total-assigned)
  )

  (:action berlin_agent_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and (at berlin ?d) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and (at berlin ?d2) (assigned ?d2)
                 (increase (days-in berlin) 1)
                 (increase (total-assigned) 1))
  )

  (:action berlin_agent_fly
    :parameters (?d - day ?d2 - day ?to - city)
    :precondition (and (at berlin ?d) (next ?d ?d2) (flight berlin ?to) (not (assigned ?d2)))
    :effect (and (at ?to ?d2) (assigned ?d2)
                 (increase (days-in ?to) 1)
                 (increase (total-assigned) 1))
  )

  (:action porto_agent_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and (at porto ?d) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and (at porto ?d2) (assigned ?d2)
                 (increase (days-in porto) 1)
                 (increase (total-assigned) 1))
  )

  (:action porto_agent_fly
    :parameters (?d - day ?d2 - day ?to - city)
    :precondition (and (at porto ?d) (next ?d ?d2) (flight porto ?to) (not (assigned ?d2)))
    :effect (and (at ?to ?d2) (assigned ?d2)
                 (increase (days-in ?to) 1)
                 (increase (total-assigned) 1))
  )

  (:action krakow_agent_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and (at krakow ?d) (next ?d ?d2) (not (assigned ?d2)))
    :effect (and (at krakow ?d2) (assigned ?d2)
                 (increase (days-in krakow) 1)
                 (increase (total-assigned) 1))
  )

  (:action krakow_agent_fly
    :parameters (?d - day ?d2 - day ?to - city)
    :precondition (and (at krakow ?d) (next ?d ?d2) (flight krakow ?to) (not (assigned ?d2)))
    :effect (and (at ?to ?d2) (assigned ?d2)
                 (increase (days-in ?to) 1)
                 (increase (total-assigned) 1))
  )
)