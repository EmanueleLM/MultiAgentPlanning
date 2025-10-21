(define (domain multiagent-domain)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?p - object ?q - object)
    (next ?p - object ?q - object)
    (sneeze ?o - object)
    (collect ?p - object ?q - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;; Actions from agent_alpha
  (:action paltry
    :parameters (?p - object ?q - object ?r - object)
    :precondition (and
      (hand ?p)
      (cats ?q)
      (texture ?r)
      (vase ?p ?q)
      (next ?q ?r)
    )
    :effect (and
      (next ?p ?r)
      (not (vase ?p ?q))
    )
  )

  (:action sip
    :parameters (?p - object ?q - object ?r - object)
    :precondition (and
      (hand ?p)
      (cats ?q)
      (texture ?r)
      (next ?p ?r)
      (next ?q ?r)
    )
    :effect (and
      (vase ?p ?q)
      (not (next ?p ?r))
    )
  )

  (:action clip
    :parameters (?p - object ?q - object ?r - object)
    :precondition (and
      (hand ?p)
      (sneeze ?q)
      (texture ?r)
      (next ?q ?r)
      (next ?p ?r)
    )
    :effect (and
      (vase ?p ?q)
      (not (next ?p ?r))
    )
  )

  ;; Actions from agent_beta
  (:action wretched
    :parameters (?p - object ?q - object ?r - object ?s - object)
    :precondition (and
      (sneeze ?p)
      (texture ?q)
      (texture ?r)
      (stupendous ?s)
      (next ?p ?q)
      (collect ?q ?s)
      (collect ?r ?s)
    )
    :effect (and
      (next ?p ?r)
      (not (next ?p ?q))
    )
  )

  (:action memory
    :parameters (?p - object ?q - object ?r - object)
    :precondition (and
      (cats ?p)
      (spring ?q)
      (spring ?r)
      (next ?p ?q)
    )
    :effect (and
      (next ?p ?r)
      (not (next ?p ?q))
    )
  )

  (:action tightfisted
    :parameters (?p - object ?q - object ?r - object)
    :precondition (and
      (hand ?p)
      (sneeze ?q)
      (texture ?r)
      (next ?q ?r)
      (vase ?p ?q)
    )
    :effect (and
      (next ?p ?r)
      (not (vase ?p ?q))
    )
  )
)