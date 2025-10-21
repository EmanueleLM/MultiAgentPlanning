(define (domain mysteryblocksworld7)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o0 - object ?o1 - object)
    (next ?o0 - object ?o1 - object)
    (collect ?o0 - object ?o1 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  ;--- Actions for scenarioA (prefixed scenarioA-) ---
  (:action scenarioA-paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  (:action scenarioA-sip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action scenarioA-clip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action scenarioA-wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action scenarioA-memory
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action scenarioA-tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;--- Actions for scenarioB (prefixed scenarioB-) ---
  (:action scenarioB-paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  (:action scenarioB-sip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action scenarioB-clip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action scenarioB-wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action scenarioB-memory
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action scenarioB-tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)