(define (domain obfuscated-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o0 - obj ?o1 - obj)
    (next ?o0 - obj ?o1 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?o0 - obj ?o1 - obj)
    (stupendous ?o - obj)

    ;; discrete stage/time model enforcing contiguous progression
    (succ ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; paltry:
  ;; pre: hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ;; add: next o0 o2
  ;; del: vase o0 o1
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; sip:
  ;; pre: hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ;; add: vase o0 o1
  ;; del: next o0 o2
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; clip:
  ;; pre: hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ;; add: vase o0 o1
  ;; del: next o0 o2
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; wretched:
  ;; pre: sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3
  ;; add: next o0 o2
  ;; del: next o0 o1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
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
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; memory:
  ;; pre: cats o0, spring o1, spring o2, next o0 o1
  ;; add: next o0 o2
  ;; del: next o0 o1
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; tightfisted:
  ;; pre: hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ;; add: next o0 o2
  ;; del: vase o0 o1
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current ?s))
      (current ?s2)
    )
  )
)