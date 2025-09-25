(define (domain trip_domain)
  (:requirements :typing :strips)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (conn ?from - city ?to - city)
    (free ?d - day)
  )

  (:action istanbul_agent_stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?city ?d2) (not (free ?d2)))
  )

  (:action istanbul_agent_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )

  (:action amsterdam_agent_stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?city ?d2) (not (free ?d2)))
  )

  (:action amsterdam_agent_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )

  (:action santorini_agent_stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?city ?d2) (not (free ?d2)))
  )

  (:action santorini_agent_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )
)