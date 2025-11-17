(define (domain obfuscated-deceptive-logistics-16)
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
    (holds-next ?a - obj ?b - obj ?s - stage)
  )

  ; Actions attributed to planner_alpha. Each action consumes a specific stage ?t and
  ; produces holds-next at the immediate successor ?t2. All required preconditions and
  ; deletions are explicit; there are no bookkeeping tokens or slack actions.

  (:action alpha-paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (holds-next ?o1 ?o2 ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (holds-next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )

  (:action alpha-sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (holds-next ?o0 ?o2 ?t)
      (holds-next ?o1 ?o2 ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (holds-next ?o1 ?o2 ?t2)
      (not (holds-next ?o0 ?o2 ?t))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )

  (:action alpha-clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (holds-next ?o1 ?o2 ?t)
      (holds-next ?o0 ?o2 ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (holds-next ?o1 ?o2 ?t2)
      (not (holds-next ?o0 ?o2 ?t))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )

  (:action alpha-wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (holds-next ?o0 ?o1 ?t)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (succ ?t ?t2)
    )
    :effect (and
      (holds-next ?o0 ?o2 ?t2)
      (not (holds-next ?o0 ?o1 ?t))
    )
  )

  (:action alpha-memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (holds-next ?o0 ?o1 ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (holds-next ?o0 ?o2 ?t2)
      (not (holds-next ?o0 ?o1 ?t))
    )
  )

  (:action alpha-tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (holds-next ?o1 ?o2 ?t)
      (vase ?o0 ?o1)
      (succ ?t ?t2)
    )
    :effect (and
      (holds-next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )
)