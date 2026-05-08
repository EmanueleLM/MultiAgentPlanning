(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; object-level relations from the specification
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)
    (spring ?o - obj)

    ;; explicit discrete stages and occupancy to enforce ordering/contiguity
    (stage-succ ?s1 - stage ?s2 - stage)   ;; stage ordering: ?s1 predecessor of ?s2
    (used-stage ?s - stage)               ;; marks that a stage slot is already occupied
  )

  ;; Generic pattern: every domain action must occupy a fresh stage slot ?s
  ;; and requires that its predecessor stage ?sp has been used, preventing reordering
  ;; and enforcing contiguous usage of stages (no slack reuse).

  (:action paltry
    :parameters (?sp - stage ?s - stage ?x - obj ?y - obj ?z - obj)
    :precondition (and
      (stage-succ ?sp ?s) (used-stage ?sp) (not (used-stage ?s))
      (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (used-stage ?s)
    )
  )

  (:action sip
    :parameters (?sp - stage ?s - stage ?x - obj ?y - obj ?z - obj)
    :precondition (and
      (stage-succ ?sp ?s) (used-stage ?sp) (not (used-stage ?s))
      (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (used-stage ?s)
    )
  )

  (:action clip
    :parameters (?sp - stage ?s - stage ?x - obj ?y - obj ?z - obj)
    :precondition (and
      (stage-succ ?sp ?s) (used-stage ?sp) (not (used-stage ?s))
      (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (used-stage ?s)
    )
  )

  (:action wretched
    :parameters (?sp - stage ?s - stage ?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
      (stage-succ ?sp ?s) (used-stage ?sp) (not (used-stage ?s))
      (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w)
      (next ?x ?y) (collect ?y ?w) (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (used-stage ?s)
    )
  )

  (:action memory
    :parameters (?sp - stage ?s - stage ?x - obj ?y - obj ?z - obj)
    :precondition (and
      (stage-succ ?sp ?s) (used-stage ?sp) (not (used-stage ?s))
      (cats ?x) (spring ?y) (spring ?z) (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (used-stage ?s)
    )
  )

  (:action tightfisted
    :parameters (?sp - stage ?s - stage ?x - obj ?y - obj ?z - obj)
    :precondition (and
      (stage-succ ?sp ?s) (used-stage ?sp) (not (used-stage ?s))
      (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (used-stage ?s)
    )
  )
)