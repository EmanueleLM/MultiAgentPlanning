(define (domain next-vase-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (cats ?x - obj)
    (collect ?x - obj ?y - obj)
    (hand ?x - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (now ?t - stage)
    (succ ?t - stage ?t2 - stage)
  )

  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)) (now ?t2) (not (now ?t)))
  )

  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)) (now ?t2) (not (now ?t)))
  )

  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )
)