(define (domain MysteryBlocksworld9)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing)
  (:predicates
    (hand ?x - thing)
    (cats ?x - thing)
    (texture ?x - thing)
    (vase ?x - thing ?y - thing)
    (next ?x - thing ?y - thing)
    (collect ?x - thing ?y - thing)
    (sneeze ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
  )

  (:action paltry_p1
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action paltry_p2
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action paltry_orchestrator
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action sip_p1
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action sip_p2
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action sip_orchestrator
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action clip_p1
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action clip_p2
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action clip_orchestrator
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  (:action wretched_p1
    :parameters (?x - thing ?y - thing ?z - thing ?w - thing)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action wretched_p2
    :parameters (?x - thing ?y - thing ?z - thing ?w - thing)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action wretched_orchestrator
    :parameters (?x - thing ?y - thing ?z - thing ?w - thing)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action memory_p1
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action memory_p2
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action memory_orchestrator
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  (:action tightfisted_p1
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action tightfisted_p2
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  (:action tightfisted_orchestrator
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)