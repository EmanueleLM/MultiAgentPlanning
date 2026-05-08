(define (domain obfuscated_deceptive_logistics24)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; paltry(o0,o1,o2):
  ;; pre: hand(o0), cats(o1), texture(o2), vase(o0,o1), next(o1,o2)
  ;; add: next(o0,o2)
  ;; del: vase(o0,o1)
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip(o0,o1,o2):
  ;; pre: hand(o0), cats(o1), texture(o2), next(o0,o2), next(o1,o2)
  ;; add: vase(o0,o1)
  ;; del: next(o0,o2)
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip(o0,o1,o2):
  ;; pre: hand(o0), sneeze(o1), texture(o2), next(o1,o2), next(o0,o2)
  ;; add: vase(o0,o1)
  ;; del: next(o0,o2)
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched(o0,o1,o2,o3):
  ;; pre: sneeze(o0), texture(o1), texture(o2), stupendous(o3),
  ;;      next(o0,o1), collect(o1,o3), collect(o2,o3)
  ;; add: next(o0,o2)
  ;; del: next(o0,o1)
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
    :precondition (and
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
    )
  )

  ;; memory(o0,o1,o2):
  ;; pre: cats(o0), spring(o1), spring(o2), next(o0,o1)
  ;; add: next(o0,o2)
  ;; del: next(o0,o1)
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted(o0,o1,o2):
  ;; pre: hand(o0), sneeze(o1), texture(o2), next(o1,o2), vase(o0,o1)
  ;; add: next(o0,o2)
  ;; del: vase(o0,o1)
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

)