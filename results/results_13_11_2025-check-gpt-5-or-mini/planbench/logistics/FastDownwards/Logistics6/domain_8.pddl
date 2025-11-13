(define (domain logistics6)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (hand ?x - thing)
    (cats ?x - thing)
    (sneeze ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
    (texture ?x - thing)
    (next ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
    (collect ?x - thing ?y - thing)
  )

  (:action paltry
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2))
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1)))
  )

  (:action sip
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2))
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2)))
  )

  (:action clip
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2))
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2)))
  )

  (:action wretched
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?o3 - thing)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3))
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1)))
  )

  (:action memory
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1))
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1)))
  )

  (:action tightfisted
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1))
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1)))
  )
)