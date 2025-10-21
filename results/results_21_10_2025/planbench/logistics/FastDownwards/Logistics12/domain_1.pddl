(define (domain Logistics12-domain)
  :requirements :strips :typing :negative-preconditions
  :types object

  :predicates
    (cats ?o - object)
    (collect ?o1 - object ?o2 - object)
    (hand ?o - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
  )

  ; paltry: needs hand H, cats C, texture T, vase(H,C), next(C,T). Adds next(H,T), removes vase(H,C).
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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

  ; sip: needs hand H, cats C, texture T, next(H,T), next(C,T). Adds vase(H,C), removes next(H,T).
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
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

  ; clip: needs hand H, sneeze S, texture T, next(S,T), next(H,T). Adds vase(H,S), removes next(H,T).
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
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

  ; wretched: needs sneeze S0, texture T1, texture T2, stupendous ST3, next(S0,T1), collect(T1,ST3), collect(T2,ST3).
  ; Adds next(S0,T2), removes next(S0,T1).
  (:action wretched
    :parameters (?s0 - object ?t1 - object ?t2 - object ?st3 - object)
    :precondition (and
      (sneeze ?s0)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st3)
      (next ?s0 ?t1)
      (collect ?t1 ?st3)
      (collect ?t2 ?st3)
    )
    :effect (and
      (next ?s0 ?t2)
      (not (next ?s0 ?t1))
    )
  )

  ; memory: needs cats C, spring S1, spring S2, next(C,S1). Adds next(C,S2), removes next(C,S1).
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ; tightfisted: needs hand H, sneeze S, texture T, next(S,T), vase(H,S). Adds next(H,T), removes vase(H,S).
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
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