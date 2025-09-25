(define (domain trip_domain)
  (:requirements :strips)
  (:predicates
    (at ?city ?day)
    (next ?d1 ?d2)
    (conn ?from ?to)
  )

  (:action istanbul_agent_stay
    :parameters (?d1 ?d2)
    :precondition (and (at istanbul ?d1) (next ?d1 ?d2))
    :effect (and (at istanbul ?d2))
  )

  (:action istanbul_agent_fly_ist_amst
    :parameters (?d1 ?d2)
    :precondition (and (at istanbul ?d1) (next ?d1 ?d2) (conn istanbul amsterdam))
    :effect (and (at amsterdam ?d2))
  )

  (:action istanbul_agent_fly_amst_ist
    :parameters (?d1 ?d2)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (conn amsterdam istanbul))
    :effect (and (at istanbul ?d2))
  )

  (:action amsterdam_agent_stay
    :parameters (?d1 ?d2)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2))
    :effect (and (at amsterdam ?d2))
  )

  (:action amsterdam_agent_fly_amst_sant
    :parameters (?d1 ?d2)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (conn amsterdam santorini))
    :effect (and (at santorini ?d2))
  )

  (:action amsterdam_agent_fly_sant_amst
    :parameters (?d1 ?d2)
    :precondition (and (at santorini ?d1) (next ?d1 ?d2) (conn santorini amsterdam))
    :effect (and (at amsterdam ?d2))
  )

  (:action santorini_agent_stay
    :parameters (?d1 ?d2)
    :precondition (and (at santorini ?d1) (next ?d1 ?d2))
    :effect (and (at santorini ?d2))
  )
)