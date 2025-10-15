(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry(A,B,C)
  ;; requires: hand A, cats B, texture C, vase A B, next B C
  ;; yields: next A C
  ;; deletes: vase A B
  (:action paltry
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (hand ?A)
      (cats ?B)
      (texture ?C)
      (vase ?A ?B)
      (next ?B ?C)
    )
    :effect (and
      (next ?A ?C)
      (not (vase ?A ?B))
    )
  )

  ;; sip(A,B,C)
  ;; requires: hand A, cats B, texture C, next A C, next B C
  ;; yields: vase A B
  ;; deletes: next A C
  (:action sip
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
  ;; requires: hand A, sneeze B, texture C, next B C, next A C
  ;; yields: vase A B
  ;; deletes: next A C
  (:action clip
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
  ;; requires: sneeze A, texture B, texture C, stupendous D, next A B, collect B D, collect C D
  ;; yields: next A C
  ;; deletes: next A B
  (:action wretched
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
      (next ?A ?C)
      (not (next ?A ?B))
    )
  )

  ;; memory(A,B,C)
  ;; requires: cats A, spring B, spring C, next A B
  ;; yields: next A C
  ;; deletes: next A B
  (:action memory
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (cats ?A)
      (spring ?B)
      (spring ?C)
      (next ?A ?B)
    )
    :effect (and
      (next ?A ?C)
      (not (next ?A ?B))
    )
  )

  ;; tightfisted(A,B,C)
  ;; requires: hand A, sneeze B, texture C, next B C, vase A B
  ;; yields: next A C
  ;; deletes: vase A B
  (:action tightfisted
    :parameters (?A - obj ?B - obj ?C - obj)
    :precondition (and
      (hand ?A)
      (sneeze ?B)
      (texture ?C)
      (next ?B ?C)
      (vase ?A ?B)
    )
    :effect (and
      (next ?A ?C)
      (not (vase ?A ?B))
    )
  )

)