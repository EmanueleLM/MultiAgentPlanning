(define (domain trip_domain)
  (:requirements :strips)
  (:predicates
    (at ?city ?day)
    (next ?d1 ?d2)
    (conn ?from ?to)
    (free ?day)
  )

  (:action istanbul_agent_stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?city ?d2) (not (free ?d2)))
  )

  (:action istanbul_agent_fly
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )

  (:action amsterdam_agent_stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?city ?d2) (not (free ?d2)))
  )

  (:action amsterdam_agent_fly
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )

  (:action santorini_agent_stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?city ?d2) (not (free ?d2)))
  )

  (:action santorini_agent_fly
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )
)