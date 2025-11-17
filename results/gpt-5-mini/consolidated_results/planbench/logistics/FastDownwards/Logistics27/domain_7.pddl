(define (domain logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    ;; discrete stage marker and strict successor relation to enforce contiguous, stepwise execution
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; All actions require the current stage and a successor stage. Effects move the current marker
  ;; to the successor to enforce contiguous occupancy of stages and prevent oscillation or
  ;; delayed bookkeeping. Preconditions and effects strictly mirror the human specification.

  (:action paltry
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action sip
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action clip
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action memory
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action tightfisted
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)