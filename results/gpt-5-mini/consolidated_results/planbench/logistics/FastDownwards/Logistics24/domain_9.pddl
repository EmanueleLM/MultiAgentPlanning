(define (domain Logistics24)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?o1 ?o2 - obj)
    (spring ?o - obj)
    (succ ?s1 ?s2 - stage)
    (now ?s - stage)
  )

  (:action paltry_manipa
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action sip_manipa
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action clip_manipa
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action wretched_manipb
    :parameters (?o0 ?o1 ?o2 ?o3 - obj ?t ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
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
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action memory_manipb
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action tightfisted_manipb
    :parameters (?o0 ?o1 ?o2 - obj ?t ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (now ?t))
      (now ?t2)
    )
  )
)