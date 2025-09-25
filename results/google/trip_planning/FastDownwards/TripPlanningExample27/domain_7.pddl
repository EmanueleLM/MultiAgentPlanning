(define (domain trip_domain)
  (:requirements :typing :strips)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (conn ?from - city ?to - city)
  )

  (:action istanbul_agent_stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?city ?d1)) (at ?city ?d2))
  )

  (:action istanbul_agent_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action amsterdam_agent_stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?city ?d1)) (at ?city ?d2))
  )

  (:action amsterdam_agent_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action santorini_agent_stay
    :parameters (?city - city ?d1 - day ?d2 - day)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?city ?d1)) (at ?city ?d2))
  )

  (:action santorini_agent_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )
)