(define (domain object-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj time)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
    (now ?t - time)
    (succ ?t - time ?t2 - time)
  )

  ;; Agent A actions: paltry, sip, clip
  (:action agentA_paltry
    :parameters (?t - time ?t2 - time ?hand - obj ?cat - obj ?tex - obj)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?hand)
      (cats ?cat)
      (texture ?tex)
      (vase ?hand ?cat)
      (next ?cat ?tex)
      ;; parameter distinctness
      (not (= ?hand ?cat))
      (not (= ?hand ?tex))
      (not (= ?cat ?tex))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (next ?hand ?tex)
      (not (vase ?hand ?cat))
    )
  )

  (:action agentA_sip
    :parameters (?t - time ?t2 - time ?hand - obj ?cat - obj ?tex - obj)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?hand)
      (cats ?cat)
      (texture ?tex)
      (next ?hand ?tex)
      (next ?cat ?tex)
      ;; parameter distinctness
      (not (= ?hand ?cat))
      (not (= ?hand ?tex))
      (not (= ?cat ?tex))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (vase ?hand ?cat)
      (not (next ?hand ?tex))
    )
  )

  (:action agentA_clip
    :parameters (?t - time ?t2 - time ?hand - obj ?sneezeSub - obj ?tex - obj)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?hand)
      (sneeze ?sneezeSub)
      (texture ?tex)
      (next ?sneezeSub ?tex)
      (next ?hand ?tex)
      ;; parameter distinctness
      (not (= ?hand ?sneezeSub))
      (not (= ?hand ?tex))
      (not (= ?sneezeSub ?tex))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (vase ?hand ?sneezeSub)
      (not (next ?hand ?tex))
    )
  )

  ;; Agent B actions: wretched, memory, tightfisted
  (:action agentB_wretched
    :parameters (?t - time ?t2 - time ?A - obj ?B - obj ?C - obj ?D - obj)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (sneeze ?A)
      (texture ?B)
      (texture ?C)
      (stupendous ?D)
      (next ?A ?B)
      (collect ?B ?D)
      (collect ?C ?D)
      ;; avoid trivial duplicate
      (not (= ?A ?B))
      (not (= ?A ?C))
      (not (= ?B ?C))
      (not (= ?A ?D))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (next ?A ?C)
      (not (next ?A ?B))
    )
  )

  (:action agentB_memory
    :parameters (?t - time ?t2 - time ?X - obj ?Y - obj ?Z - obj)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (cats ?X)
      (spring ?Y)
      (spring ?Z)
      (next ?X ?Y)
      ;; distinctness
      (not (= ?X ?Y))
      (not (= ?X ?Z))
      (not (= ?Y ?Z))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (next ?X ?Z)
      (not (next ?X ?Y))
    )
  )

  (:action agentB_tightfisted
    :parameters (?t - time ?t2 - time ?H - obj ?S - obj ?T - obj)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?H)
      (sneeze ?S)
      (texture ?T)
      (next ?S ?T)
      (vase ?H ?S)
      ;; distinctness
      (not (= ?H ?S))
      (not (= ?H ?T))
      (not (= ?S ?T))
    )
    :effect (and
      (not (now ?t))
      (now ?t2)
      (next ?H ?T)
      (not (vase ?H ?S))
    )
  )
)