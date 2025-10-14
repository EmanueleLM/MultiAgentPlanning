(define (domain multi_agent_domain)
  (:requirements :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  (:action paltry
    :parameters (?p - obj ?q - obj ?r - obj)
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
    :parameters (?p - obj ?q - obj ?r - obj)
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
    :parameters (?p - obj ?q - obj ?r - obj)
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

  (:action wretched
    :parameters (?p - obj ?q - obj ?r - obj ?s - obj)
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
    :parameters (?p - obj ?q - obj ?r - obj)
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
    :parameters (?p - obj ?q - obj ?r - obj)
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