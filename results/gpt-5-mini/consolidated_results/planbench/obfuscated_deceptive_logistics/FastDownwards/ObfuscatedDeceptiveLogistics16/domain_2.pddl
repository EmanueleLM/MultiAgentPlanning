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
    ;; time / stage modeling
    (succ ?s1 - stage ?s2 - stage)            ; immediate successor relation between stages
    (holds-next ?a - obj ?b - obj ?s - stage) ; temporalized 'next' fact at a specific stage
  )

  ;; All actions attributed to planner_alpha (prefixed with alpha-).
  ;; Each action explicitly requires a stage parameter ?t and the immediate successor ?t2.
  ;; Preconditions refer to holds-next at stage ?t. Effects add holds-next facts at ?t2
  ;; when the human specification declared a resulting 'next' fact, and remove the input
  ;; holds-next at ?t when the human specification declared that 'next' fact becomes false.
  ;; Static fluents (hand, cats, texture, etc.) remain unchanged unless explicitly added/removed.

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
      ;; new next becomes true at successor stage
      (holds-next ?o0 ?o2 ?t2)
      ;; vase removed as specified
      (not (vase ?o0 ?o1))
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
      ;; sip removes the specific holds-next (?o0 ?o2) that it required
      (not (holds-next ?o0 ?o2 ?t))
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
      ;; clip removes the specific holds-next (?o0 ?o2) that it required
      (not (holds-next ?o0 ?o2 ?t))
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
      ;; result: next o0 o2 becomes true at successor stage
      (holds-next ?o0 ?o2 ?t2)
      ;; and the previous next o0 o1 becomes false (deleted for stage ?t)
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
    )
  )
)