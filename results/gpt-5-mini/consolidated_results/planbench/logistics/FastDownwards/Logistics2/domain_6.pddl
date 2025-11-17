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

  ;; memory(object_0,object_1,object_2):
  ;;   pre: cats object_0, spring object_1, spring object_2, next object_0 object_1
  ;;   eff: add next object_0 object_2; del next object_0 object_1
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  ;; sip(object_0,object_1,object_2):
  ;;   pre: hand object_0, cats object_1, texture object_2, next object_0 object_2, next object_1 object_2
  ;;   eff: add vase object_0 object_1; del next object_0 object_2
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)) (now ?t2) (not (now ?t)))
  )

  ;; paltry(object_0,object_1,object_2):
  ;;   pre: hand object_0, cats object_1, texture object_2, vase object_0 object_1, next object_1 object_2
  ;;   eff: add next object_0 object_2; del vase object_0 object_1
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  ;; clip(object_0,object_1,object_2):
  ;;   pre: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, next object_0 object_2
  ;;   eff: add vase object_0 object_1; del next object_0 object_2
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)) (now ?t2) (not (now ?t)))
  )

  ;; wretched(object_0,object_1,object_2,object_3):
  ;;   pre: sneeze object_0, texture object_1, texture object_2, stupendous object_3,
  ;;        next object_0 object_1, collect object_1 object_3, collect object_2 object_3
  ;;   eff: add next object_0 object_2; del next object_0 object_1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  ;; tightfisted(object_0,object_1,object_2):
  ;;   pre: hand object_0, sneeze object_1, texture object_2, next object_1 object_2, vase object_0 object_1
  ;;   eff: add next object_0 object_2; del vase object_0 object_1
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )
)