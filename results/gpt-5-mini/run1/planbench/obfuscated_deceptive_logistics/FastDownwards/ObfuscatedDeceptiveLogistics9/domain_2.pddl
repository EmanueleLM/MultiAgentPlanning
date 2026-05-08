(define (domain obfuscated_deceptive_logistics9)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
  )

  ;; paltry: params (?h ?c ?t) correspond to object_0, object_1, object_2 pattern
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; sip: requires next ?h ?t and next ?c ?t, produces vase ?h ?c and removes next ?h ?t
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; clip: requires sneeze ?s and next ?s ?t and next ?h ?t, produces vase ?h ?s and removes next ?h ?t
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; wretched: uses sneeze ?s0, textures ?t1 ?t2, stupendous ?st and collect relationships;
  ;; transforms next ?s0 ?t1 into next ?s0 ?t2
  (:action wretched
    :parameters (?s0 - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and
      (sneeze ?s0)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s0 ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (next ?s0 ?t2)
      (not (next ?s0 ?t1))
    )
  )

  ;; memory: converts next ?c ?sp1 into next ?c ?sp2 when cats and springs present
  (:action memory
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  ;; tightfisted: requires vase ?h ?s and next ?s ?t and produces next ?h ?t, removing the vase
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)