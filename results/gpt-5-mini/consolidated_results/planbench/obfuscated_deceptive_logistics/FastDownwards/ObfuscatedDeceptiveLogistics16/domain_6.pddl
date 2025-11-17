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
    (now ?s - stage)
    (holds-next ?a - obj ?b - obj ?s - stage)
  )

  ;; Actions manipulate the explicit timeline: they require (now ?t)
  ;; and a successor (succ ?t ?t2) and move the timeline marker to ?t2.
  ;; All changes to holds-next and vase are explicit. No bookkeeping tokens,
  ;; quotas, or post-hoc penalty actions are present.

  (:action alpha-paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (holds-next ?o1 ?o2 ?t)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (holds-next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )

  (:action alpha-sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (holds-next ?o0 ?o2 ?t)
      (holds-next ?o1 ?o2 ?t)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (vase ?o0 ?o1)
      (holds-next ?o1 ?o2 ?t2)
      (not (holds-next ?o0 ?o2 ?t))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )

  (:action alpha-clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (holds-next ?o1 ?o2 ?t)
      (holds-next ?o0 ?o2 ?t)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (vase ?o0 ?o1)
      (holds-next ?o1 ?o2 ?t2)
      (not (holds-next ?o0 ?o2 ?t))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )

  (:action alpha-wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (holds-next ?o0 ?o1 ?t)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (holds-next ?o0 ?o2 ?t2)
      (not (holds-next ?o0 ?o1 ?t))
    )
  )

  (:action alpha-memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (holds-next ?o0 ?o1 ?t)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (holds-next ?o0 ?o2 ?t2)
      (not (holds-next ?o0 ?o1 ?t))
    )
  )

  (:action alpha-tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (holds-next ?o1 ?o2 ?t)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (holds-next ?o0 ?o2 ?t2)
      (not (vase ?o0 ?o1))
      (not (holds-next ?o1 ?o2 ?t))
    )
  )
)