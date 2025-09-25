(define (domain trip_domain)
  (:requirements :strips)
  (:predicates
    (at ?city ?day)
    (next ?d1 ?d2)
    (conn ?from ?to)
  )

  ;; ISTANBUL AGENT actions (stay in Istanbul or fly between Istanbul and Amsterdam)
  (:action istanbul_agent_stay
    :parameters (?d1 ?d2)
    :precondition (and (at istanbul ?d1) (next ?d1 ?d2))
    :effect (and (not (at istanbul ?d1)) (at istanbul ?d2))
  )

  (:action istanbul_agent_fly_ist_amst
    :parameters (?d1 ?d2)
    :precondition (and (at istanbul ?d1) (next ?d1 ?d2) (conn istanbul amsterdam))
    :effect (and (not (at istanbul ?d1)) (at amsterdam ?d2))
  )

  (:action istanbul_agent_fly_amst_ist
    :parameters (?d1 ?d2)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (conn amsterdam istanbul))
    :effect (and (not (at amsterdam ?d1)) (at istanbul ?d2))
  )

  ;; AMSTERDAM AGENT actions (stay in Amsterdam or fly between Amsterdam and Santorini)
  (:action amsterdam_agent_stay
    :parameters (?d1 ?d2)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2))
    :effect (and (not (at amsterdam ?d1)) (at amsterdam ?d2))
  )

  (:action amsterdam_agent_fly_amst_sant
    :parameters (?d1 ?d2)
    :precondition (and (at amsterdam ?d1) (next ?d1 ?d2) (conn amsterdam santorini))
    :effect (and (not (at amsterdam ?d1)) (at santorini ?d2))
  )

  (:action amsterdam_agent_fly_sant_amst
    :parameters (?d1 ?d2)
    :precondition (and (at santorini ?d1) (next ?d1 ?d2) (conn santorini amsterdam))
    :effect (and (not (at santorini ?d1)) (at amsterdam ?d2))
  )

  ;; SANTORINI AGENT actions (stay in Santorini)
  (:action santorini_agent_stay
    :parameters (?d1 ?d2)
    :precondition (and (at santorini ?d1) (next ?d1 ?d2))
    :effect (and (not (at santorini ?d1)) (at santorini ?d2))
  )
)