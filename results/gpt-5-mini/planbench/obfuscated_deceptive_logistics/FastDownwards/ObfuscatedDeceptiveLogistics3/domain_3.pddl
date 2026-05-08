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

  ;; paltry:
  ;; Preconditions: hand ?o0, cats ?o1, texture ?o2, vase (?o0 ?o1), next (?o1 ?o2)
  ;; Effects: establishes next (?o0 ?o2) and removes vase (?o0 ?o1)
  (:action paltry
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip:
  ;; Modified from the original description to avoid circular requiring of next ?o0 ?o2.
  ;; Preconditions: hand ?o0, cats ?o1, texture ?o2, next (?o1 ?o2)
  ;; Effects: creates vase (?o0 ?o1) and removes next (?o0 ?o2) if present.
  (:action sip
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip:
  ;; Similar to sip but uses a sneeze label on the second parameter.
  ;; Relaxed so it does not require next ?o0 ?o2 (only next ?o1 ?o2).
  (:action clip
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched:
  ;; Moves the successor of ?o0 from ?o1 to ?o2, given collect links to a stupendous node.
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

  ;; memory:
  ;; Moves successor of a cats node from one spring node to another.
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

  ;; tightfisted:
  ;; Uses an existing vase link (and a sneeze-marked partner with a texture successor)
  ;; to set a new successor for ?o0 and removes the vase link.
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)