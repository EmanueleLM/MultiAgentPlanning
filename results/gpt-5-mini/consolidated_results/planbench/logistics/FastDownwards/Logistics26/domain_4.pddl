(define (domain Logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    hand cats texture sneeze stupendous stage - obj
  )

  (:predicates
    (vase ?h - hand ?c - cats)
    (next ?x ?y - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
    (succ ?p ?s - stage)
    (used ?s - stage)
  )

  ;; All actions require consuming a strictly ordered stage.
  ;; To execute an action at stage ?s, its predecessor stage ?p must be already used,
  ;; and ?s must not yet be used. Executing the action marks ?s used (monotonic progression).
  (:action paltry
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture ?p - stage ?s - stage)
    :precondition (and
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (used ?s)
    )
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture ?p - stage ?s - stage)
    :precondition (and
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (used ?s)
    )
  )

  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture ?p - stage ?s - stage)
    :precondition (and
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (used ?s)
    )
  )

  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous ?p - stage ?s - stage)
    :precondition (and
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (used ?s)
    )
  )

  (:action memory
    :parameters (?o0 - cats ?o1 - obj ?o2 - obj ?p - stage ?s - stage)
    :precondition (and
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (used ?s)
    )
  )

  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture ?p - stage ?s - stage)
    :precondition (and
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (succ ?p ?s)
      (used ?p)
      (not (used ?s))
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (used ?s)
    )
  )
)