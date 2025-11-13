(define (domain Depots4)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing)
  (:predicates
    (cats ?x - thing)
    (hand ?x - thing)
    (sneeze ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
    (texture ?x - thing)
    (collect ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
    (next ?x - thing ?y - thing)
    (cur ?s - thing)
    (succ ?s1 - thing ?s2 - thing)
  )

  (:action paltry
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?s - thing ?s2 - thing)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (cur ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (cur ?s))
      (cur ?s2))
  )

  (:action sip
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?s - thing ?s2 - thing)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (cur ?s)
      (succ ?s ?s2))
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (cur ?s))
      (cur ?s2))
  )

  (:action clip
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?s - thing ?s2 - thing)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (cur ?s)
      (succ ?s ?s2))
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (cur ?s))
      (cur ?s2))
  )

  (:action wretched
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?o3 - thing ?s - thing ?s2 - thing)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (cur ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (cur ?s))
      (cur ?s2))
  )

  (:action memory
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?s - thing ?s2 - thing)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (cur ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (cur ?s))
      (cur ?s2))
  )

  (:action tightfisted
    :parameters (?o0 - thing ?o1 - thing ?o2 - thing ?s - thing ?s2 - thing)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (cur ?s)
      (succ ?s ?s2))
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (cur ?s))
      (cur ?s2))
  )
)