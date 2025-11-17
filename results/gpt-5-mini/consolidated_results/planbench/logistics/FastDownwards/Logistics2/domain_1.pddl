(define (domain next-vase-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (cats ?x - obj)
    (collect ?x - obj ?y - obj)
    (hand ?x - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (succ-stage ?s1 - stage ?s2 - stage)
  )

  ; memory(x, y, z)
  ; Requires: cats(x), spring(y), spring(z), next(x,y)
  ; Effects: add next(x,z); delete next(x,y)
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ; sip(h, c, t)
  ; Requires: hand(h), cats(c), texture(t), next(h,t), next(c,t)
  ; Effects: add vase(h,c); delete next(h,t)
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ; paltry(h, c, t)
  ; Requires: hand(h), cats(c), texture(t), vase(h,c), next(c,t)
  ; Effects: add next(h,t); delete vase(h,c)
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ; clip(h, s, t)
  ; Requires: hand(h), sneeze(s), texture(t), next(s,t), next(h,t)
  ; Effects: add vase(h,s); delete next(h,t)
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ; wretched(s, t1, t2, st)
  ; Requires: sneeze(s), texture(t1), texture(t2), stupendous(st),
  ;           next(s,t1), collect(t1,st), collect(t2,st)
  ; Effects: add next(s,t2); delete next(s,t1)
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st)
                       (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ; tightfisted(h, s, t)
  ; Requires: hand(h), sneeze(s), texture(t), next(s,t), vase(h,s)
  ; Effects: add next(h,t); delete vase(h,s)
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)