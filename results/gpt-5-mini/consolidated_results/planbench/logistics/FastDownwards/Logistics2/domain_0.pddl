; DOMAIN: next-vase-domain
; Comment: This domain encodes the normalized action schemas and predicates
; from the environment and the auditor's normalization. No action schemas
; were changed. The auditor recommended plan corrections (see per-problem
; comments below), but action preconditions/effects remain as specified:
; memory, sip, paltry, clip, wretched, tightfisted.
; Requirements limited to :strips to remain compatible with FastDownward.
(define (domain next-vase-domain)
  (:requirements :strips)
  (:predicates
    (cats ?x)
    (collect ?x ?y)
    (hand ?x)
    (next ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (vase ?x ?y)
  )

  ; memory(x, y, z)
  ; Requires: cats(x), spring(y), spring(z), next(x,y)
  ; Effects: add next(x,z); delete next(x,y)
  (:action memory
    :parameters (?x ?y ?z)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ; sip(h, c, t)
  ; Requires: hand(h), cats(c), texture(t), next(h,t), next(c,t)
  ; Effects: add vase(h,c); delete next(h,t)
  (:action sip
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ; paltry(h, c, t)
  ; Requires: hand(h), cats(c), texture(t), vase(h,c), next(c,t)
  ; Effects: add next(h,t); delete vase(h,c)
  (:action paltry
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ; clip(h, s, t)
  ; Requires: hand(h), sneeze(s), texture(t), next(s,t), next(h,t)
  ; Effects: add vase(h,s); delete next(h,t)
  (:action clip
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ; wretched(s, t1, t2, st)
  ; Requires: sneeze(s), texture(t1), texture(t2), stupendous(st),
  ;           next(s,t1), collect(t1,st), collect(t2,st)
  ; Effects: add next(s,t2); delete next(s,t1)
  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st)
                       (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ; tightfisted(h, s, t)
  ; Requires: hand(h), sneeze(s), texture(t), next(s,t), vase(h,s)
  ; Effects: add next(h,t); delete vase(h,s)
  (:action tightfisted
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)