(define (domain logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj hand cat sneeze stupendous)

  (:predicates
    ;; retained unary predicates (kept as facts in :init where needed)
    (texture ?x - obj)
    (spring ?x - obj)

    ;; binary relations
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; paltry: hand O0 (typed), cats O1 (typed), texture O2 (predicate), vase O0 O1, next O1 O2
  ;; effects: add next O0 O2, remove vase O0 O1
  (:action paltry
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip: hand O0 (typed), cats O1 (typed), texture O2 (predicate), next O0 O2, next O1 O2
  ;; effects: add vase O0 O1, remove next O0 O2
  (:action sip
    :parameters (?o0 - hand ?o1 - cat ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip: hand O0 (typed), sneeze O1 (typed), texture O2 (predicate), next O1 O2, next O0 O2
  ;; effects: add vase O0 O1, remove next O0 O2
  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj)
    :precondition (and
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched: sneeze O0 (typed), texture O1 (predicate), texture O2 (predicate), stupendous O3 (typed),
  ;;            next O0 O1, collect O1 O3, collect O2 O3
  ;; effects: add next O0 O2, remove next O0 O1
  (:action wretched
    :parameters (?o0 - sneeze ?o1 - obj ?o2 - obj ?o3 - stupendous)
    :precondition (and
      (texture ?o1)
      (texture ?o2)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory: cats O0 (typed), spring O1 (predicate), spring O2 (predicate), next O0 O1
  ;; effects: add next O0 O2, remove next O0 O1
  (:action memory
    :parameters (?o0 - cat ?o1 - obj ?o2 - obj)
    :precondition (and
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted: hand O0 (typed), sneeze O1 (typed), texture O2 (predicate), next O1 O2, vase O0 O1
  ;; effects: add next O0 O2, remove vase O0 O1
  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - obj)
    :precondition (and
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