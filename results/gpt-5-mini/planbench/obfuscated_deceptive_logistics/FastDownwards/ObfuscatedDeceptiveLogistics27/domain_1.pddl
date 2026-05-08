(define (domain orchestrator-domain)
  :requirements :strips :typing :negative-preconditions
  :types obj

  :predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)

  ;; paltry(A,B,C)
  (:action planner_paltry
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (hand ?A)
      (cats ?B)
      (texture ?C)
      (vase ?A ?B)
      (next ?B ?C)
    )
    :effect (and
      (not (vase ?A ?B))
      (next ?A ?C)
    )
  )

  ;; sip(A,B,C)
  (:action planner_sip
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (hand ?A)
      (cats ?B)
      (texture ?C)
      (next ?A ?C)
      (next ?B ?C)
    )
    :effect (and
      (vase ?A ?B)
      (not (next ?A ?C))
    )
  )

  ;; clip(A,B,C)
  (:action planner_clip
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (hand ?A)
      (sneeze ?B)
      (texture ?C)
      (next ?B ?C)
      (next ?A ?C)
    )
    :effect (and
      (vase ?A ?B)
      (not (next ?A ?C))
    )
  )

  ;; wretched(A,B,C,D)
  (:action planner_wretched
    :parameters (?A - obj ?B - obj ?C - obj ?D - obj)
    :precondition (and
      (sneeze ?A)
      (texture ?B)
      (texture ?C)
      (stupendous ?D)
      (next ?A ?B)
      (collect ?B ?D)
      (collect ?C ?D)
    )
    :effect (and
      (not (next ?A ?B))
      (next ?A ?C)
    )
  )

  ;; memory(A,B,C)
  (:action planner_memory
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (cats ?A)
      (spring ?B)
      (spring ?C)
      (next ?A ?B)
    )
    :effect (and
      (not (next ?A ?B))
      (next ?A ?C)
    )
  )

  ;; tightfisted(A,B,C)
  (:action planner_tightfisted
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (hand ?A)
      (sneeze ?B)
      (texture ?C)
      (next ?B ?C)
      (vase ?A ?B)
    )
    :effect (and
      (not (vase ?A ?B))
      (next ?A ?C)
    )
  )
)