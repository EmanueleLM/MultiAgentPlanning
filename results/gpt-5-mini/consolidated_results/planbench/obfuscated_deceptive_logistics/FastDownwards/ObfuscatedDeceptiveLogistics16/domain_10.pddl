(define (domain obfuscated-deceptive-logistics-16-revised)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
    (next ?a - obj ?b - obj)
  )

  ;; Time-advance action usable to progress the global stage marker by one successor
  (:action orchestrator-advance
    :parameters (?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Actions attributed to planner_alpha (origin: first scenario)
  ;; Note: to preserve multi-valued 'next' relations across combined scenarios, these actions
  ;; add 'next' relations but do not remove arbitrary existing 'next' relations except where
  ;; the original specification required removal of a vase relation (kept).
  (:action planner_alpha-paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action planner_alpha-sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (vase ?o0 ?o1)
      ;; keep previously asserted 'next' facts intact (multivalued), only add vase
    )
  )

  (:action planner_alpha-clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (vase ?o0 ?o1)
    )
  )

  (:action planner_alpha-wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
      ;; original specification removed (next ?o0 ?o1); to preserve multi-valued combination across scenarios
      ;; and avoid cross-scenario invariants, we do not perform a blanket removal here.
    )
  )

  (:action planner_alpha-memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
      ;; original spec removed (next ?o0 ?o1); to avoid creating exclusive invariants across combined inputs,
      ;; this action only adds the new next relation.
    )
  )

  (:action planner_alpha-tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; Actions attributed to planner_beta (origin: second scenario)
  (:action planner_beta-paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  (:action planner_beta-sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (vase ?o0 ?o1)
    )
  )

  (:action planner_beta-clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (vase ?o0 ?o1)
    )
  )

  (:action planner_beta-wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
    )
  )

  (:action planner_beta-memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
    )
  )

  (:action planner_beta-tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
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
      (not (now ?t))
      (now ?t2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)