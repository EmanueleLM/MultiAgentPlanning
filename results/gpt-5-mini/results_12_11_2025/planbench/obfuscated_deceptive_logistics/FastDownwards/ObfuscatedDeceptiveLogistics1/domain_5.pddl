(define (domain ObfuscatedDeceptiveLogistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (collect ?a - object ?b - object)
    (stupendous ?o - object)
    (available ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (available ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (available ?t2)
      (not (available ?t1))
    )
  )

  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (available ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (available ?t2)
      (not (available ?t1))
    )
  )

  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (available ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (available ?t2)
      (not (available ?t1))
    )
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (available ?t1)
      (succ ?t1 ?t2)
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
      (available ?t2)
      (not (available ?t1))
    )
  )

  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (available ?t1)
      (succ ?t1 ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (available ?t2)
      (not (available ?t1))
    )
  )

  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (available ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (available ?t2)
      (not (available ?t1))
    )
  )
)