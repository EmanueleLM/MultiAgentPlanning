(define (domain ObfuscatedDeceptiveLogistics7)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    ;; temporal progression predicates
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Every action consumes the current stage and advances to a successor stage.
  ;; This enforces a discrete, acyclic ordering of actions and prevents oscillation
  ;; by making time progress strictly along succ links.

  ;; paltry: requires hand(o0), cats(o1), texture(o2), vase(o0,o1), next(o1,o2)
  ;; effects: add next(o0,o2), delete vase(o0,o1), advance stage
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      ;; advance time
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; sip: requires hand(o0), cats(o1), texture(o2), next(o0,o2), next(o1,o2)
  ;; effects: add vase(o0,o1), delete next(o0,o2), advance stage
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      ;; advance time
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; clip: requires hand(o0), sneeze(o1), texture(o2), next(o1,o2), next(o0,o2)
  ;; effects: add vase(o0,o1), delete next(o0,o2), advance stage
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      ;; advance time
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; wretched: requires sneeze(o0), texture(o1), texture(o2), stupendous(o3),
  ;;           next(o0,o1), collect(o1,o3), collect(o2,o3)
  ;; effects: add next(o0,o2), delete next(o0,o1), advance stage
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      ;; advance time
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; memory: requires cats(o0), spring(o1), spring(o2), next(o0,o1)
  ;; effects: add next(o0,o2), delete next(o0,o1), advance stage
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      ;; advance time
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; tightfisted: requires hand(o0), sneeze(o1), texture(o2), next(o1,o2), vase(o0,o1)
  ;; effects: add next(o0,o2), delete vase(o0,o1), advance stage
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      ;; advance time
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)