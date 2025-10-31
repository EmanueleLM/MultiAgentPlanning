(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)    ; agent ?a is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)           ; temporal ordering of days
    (direct ?c1 - city ?c2 - city)       ; direct flight allowed between cities
  )

  ;; --- Actions for agent1 ---
  (:action stay_agent1
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at agent1 ?c ?d1) (next ?d1 ?d2))
    :effect (and (at agent1 ?c ?d2))
  )
  (:action travel_agent1
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at agent1 ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at agent1 ?to ?d2))
  )

  ;; --- Actions for agent2 ---
  (:action stay_agent2
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at agent2 ?c ?d1) (next ?d1 ?d2))
    :effect (and (at agent2 ?c ?d2))
  )
  (:action travel_agent2
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at agent2 ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at agent2 ?to ?d2))
  )

  ;; --- Actions for agent3 ---
  (:action stay_agent3
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at agent3 ?c ?d1) (next ?d1 ?d2))
    :effect (and (at agent3 ?c ?d2))
  )
  (:action travel_agent3
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at agent3 ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (at agent3 ?to ?d2))
  )
)