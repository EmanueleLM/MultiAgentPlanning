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
    ;; explicit discrete-stage progression predicates
    (available ?s - stage)   ;; the current available stage token
    (succ ?s1 - stage ?s2 - stage) ;; successor relation between stages
  )

  ;; All actions require occupying a current stage and advance to its successor.
  ;; paltry object_0 object_1 object_2.
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

  ;; sip object_0 object_1 object_2.
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

  ;; clip object_0 object_1 object_2.
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

  ;; wretched object_0 object_1 object_2 object_3.
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

  ;; memory object_0 object_1 object_2.
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

  ;; tightfisted object_0 object_1 object_2.
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