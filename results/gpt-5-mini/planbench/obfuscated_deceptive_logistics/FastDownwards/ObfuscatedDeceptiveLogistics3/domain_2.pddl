(define (domain obfuscated_deceptive_logistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry: moves ?o0 to successor ?o2 while consuming the vase relation to ?o1.
  ;; It now requires and removes any existing successor of ?o0 to keep the successor relation functional.
  (:action paltry
    :parameters (?o0 ?o1 ?o2 ?o_old - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (next ?o0 ?o_old)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (next ?o0 ?o_old))
    )
  )

  ;; sip: creates a vase link between ?o0 and ?o1, consumes the current successor of ?o0.
  (:action sip
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip: similar to sip but triggered by sneeze on ?o1.
  (:action clip
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched: move successor of ?o0 from ?o1 to ?o2, requires two texture nodes and collects linking to a stupendous node.
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - obj)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory: move successor of ?o0 from ?o1 to ?o2, requires two spring nodes.
  (:action memory
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted: similar to paltry in that it creates a successor for ?o0 and consumes the vase relation;
  ;; also consumes any existing successor of ?o0 to maintain successor uniqueness.
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 ?o_old - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (next ?o0 ?o_old)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (next ?o0 ?o_old))
    )
  )
)