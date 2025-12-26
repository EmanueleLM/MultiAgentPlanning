(define (domain ObfuscatedDeceptiveLogistics13)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    o
  )
  (:predicates
    (hand ?o - o)
    (cats ?o - o)
    (texture ?o - o)
    (sneeze ?o - o)
    (stupendous ?o - o)
    (spring ?o - o)
    (vase ?o1 - o ?o2 - o)
    (next ?o1 - o ?o2 - o)
    (collect ?o1 - o ?o2 - o)
  )
  (:functions
    (total-cost) - number
  )

  ; Action Paltry(o0, o1, o2): PRE: hand(o0), cats(o1), texture(o2), vase(o0, o1), next(o1, o2). EFF: next(o0, o2), NOT vase(o0, o1).
  (:action Paltry
    :parameters (?o0 - o ?o1 - o ?o2 - o)
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
      (increase (total-cost) 1)
    )
  )

  ; Action Sip(o0, o1, o2): PRE: hand(o0), cats(o1), texture(o2), next(o0, o2), next(o1, o2). EFF: vase(o0, o1), NOT next(o0, o2).
  (:action Sip
    :parameters (?o0 - o ?o1 - o ?o2 - o)
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
      (increase (total-cost) 1)
    )
  )

  ; Action Clip(o0, o1, o2): PRE: hand(o0), sneeze(o1), texture(o2), next(o1, o2), next(o0, o2). EFF: vase(o0, o1), NOT next(o0, o2).
  (:action Clip
    :parameters (?o0 - o ?o1 - o ?o2 - o)
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
      (increase (total-cost) 1)
    )
  )

  ; Action Wretched(o0, o1, o2, o3): PRE: sneeze(o0), texture(o1), texture(o2), stupendous(o3), next(o0, o1), collect(o1, o3), collect(o2, o3). EFF: next(o0, o2), NOT next(o0, o1).
  (:action Wretched
    :parameters (?o0 - o ?o1 - o ?o2 - o ?o3 - o)
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
      (increase (total-cost) 1)
    )
  )

  ; Action Memory(o0, o1, o2): PRE: cats(o0), spring(o1), spring(o2), next(o0, o1). EFF: next(o0, o2), NOT next(o0, o1).
  (:action Memory
    :parameters (?o0 - o ?o1 - o ?o2 - o)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (increase (total-cost) 1)
    )
  )

  ; Action Tightfisted(o0, o1, o2): PRE: hand(o0), sneeze(o1), texture(o2), next(o1, o2), vase(o0, o1). EFF: next(o0, o2), NOT vase(o0, o1).
  (:action Tightfisted
    :parameters (?o0 - o ?o1 - o ?o2 - o)
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
      (increase (total-cost) 1)
    )
  )
)