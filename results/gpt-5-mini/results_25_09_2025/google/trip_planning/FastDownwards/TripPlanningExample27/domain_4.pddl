(define (domain trip_domain)
  (:requirements :strips)
  (:predicates
    (at ?city ?day)
    (next ?d1 ?d2)
    (conn ?from ?to)
  )

  (:action istanbul_agent_stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (at ?city ?d2))
  )

  (:action istanbul_agent_fly_ist_amst
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action istanbul_agent_fly_amst_ist
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action amsterdam_agent_stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (at ?city ?d2))
  )

  (:action amsterdam_agent_fly_amst_sant
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action amsterdam_agent_fly_sant_amst
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (conn ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action santorini_agent_stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (at ?city ?d2))
  )
)