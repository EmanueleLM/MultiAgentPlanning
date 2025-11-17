(define (domain orchestrated-collection)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o1 ?o2)
    (next ?o1 ?o2)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?o1 ?o2)
    (spring ?o)
  )

  ; paltry: requires hand O0, cats O1, texture O2, vase(O0,O1), next(O1,O2)
  ; effects: add next(O0,O2), delete vase(O0,O1)
  (:action paltry
    :parameters (?o0 ?o1 ?o2)
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

  ; sip: requires hand O0, cats O1, texture O2, next(O0,O2), next(O1,O2)
  ; effects: add vase(O0,O1), delete next(O0,O2)
  (:action sip
    :parameters (?o0 ?o1 ?o2)
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

  ; clip: requires hand O0, sneeze O1, texture O2, next(O1,O2), next(O0,O2)
  ; effects: add vase(O0,O1), delete next(O0,O2)
  (:action clip
    :parameters (?o0 ?o1 ?o2)
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

  ; wretched: requires sneeze O0, texture O1, texture O2, stupendous O3,
  ;           next(O0,O1), collect(O1,O3), collect(O2,O3)
  ; effects: add next(O0,O2), delete next(O0,O1)
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
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

  ; memory: requires cats O0, spring O1, spring O2, next(O0,O1)
  ; effects: add next(O0,O2), delete next(O0,O1)
  (:action memory
    :parameters (?o0 ?o1 ?o2)
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

  ; tightfisted: requires hand O0, sneeze O1, texture O2, next(O1,O2), vase(O0,O1)
  ; effects: add next(O0,O2), delete vase(O0,O1)
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2)
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