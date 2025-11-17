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
    (at-stage ?x - obj ?s - stage)
    (succ-stage ?s1 - stage ?s2 - stage)
  )

  ;; memory(x, y, z, stg, stg2)
  ;; Requires: cats(x), spring(y), spring(z), next(x,y), at-stage(x,stg), succ-stage(stg,stg2)
  ;; Effects: add next(x,z); delete next(x,y); move x to stg2
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?stg - stage ?stg2 - stage)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y)
                       (at-stage ?x ?stg) (succ-stage ?stg ?stg2))
    :effect (and (next ?x ?z) (not (next ?x ?y))
                 (at-stage ?x ?stg2) (not (at-stage ?x ?stg)))
  )

  ;; sip(h, c, t, stg, stg2)
  ;; Requires: hand(h), cats(c), texture(t), next(h,t), next(c,t), at-stage(h,stg), succ-stage(stg,stg2)
  ;; Effects: add vase(h,c); delete next(h,t); move h to stg2
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?stg - stage ?stg2 - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t)
                       (at-stage ?h ?stg) (succ-stage ?stg ?stg2))
    :effect (and (vase ?h ?c) (not (next ?h ?t))
                 (at-stage ?h ?stg2) (not (at-stage ?h ?stg)))
  )

  ;; paltry(h, c, t, stg, stg2)
  ;; Requires: hand(h), cats(c), texture(t), vase(h,c), next(c,t), at-stage(h,stg), succ-stage(stg,stg2)
  ;; Effects: add next(h,t); delete vase(h,c); move h to stg2
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?stg - stage ?stg2 - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t)
                       (at-stage ?h ?stg) (succ-stage ?stg ?stg2))
    :effect (and (next ?h ?t) (not (vase ?h ?c))
                 (at-stage ?h ?stg2) (not (at-stage ?h ?stg)))
  )

  ;; clip(h, s, t, stg, stg2)
  ;; Requires: hand(h), sneeze(s), texture(t), next(s,t), next(h,t), at-stage(h,stg), succ-stage(stg,stg2)
  ;; Effects: add vase(h,s); delete next(h,t); move h to stg2
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj ?stg - stage ?stg2 - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t)
                       (at-stage ?h ?stg) (succ-stage ?stg ?stg2))
    :effect (and (vase ?h ?s) (not (next ?h ?t))
                 (at-stage ?h ?stg2) (not (at-stage ?h ?stg)))
  )

  ;; wretched(s, t1, t2, st_obj, stg, stg2)
  ;; Requires: sneeze(s), texture(t1), texture(t2), stupendous(st_obj),
  ;;           next(s,t1), collect(t1,st_obj), collect(t2,st_obj),
  ;;           at-stage(s,stg), succ-stage(stg,stg2)
  ;; Effects: add next(s,t2); delete next(s,t1); move s to stg2
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st_obj - obj ?stg - stage ?stg2 - stage)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st_obj)
                       (next ?s ?t1) (collect ?t1 ?st_obj) (collect ?t2 ?st_obj)
                       (at-stage ?s ?stg) (succ-stage ?stg ?stg2))
    :effect (and (next ?s ?t2) (not (next ?s ?t1))
                 (at-stage ?s ?stg2) (not (at-stage ?s ?stg)))
  )

  ;; tightfisted(h, s, t, stg, stg2)
  ;; Requires: hand(h), sneeze(s), texture(t), next(s,t), vase(h,s), at-stage(h,stg), succ-stage(stg,stg2)
  ;; Effects: add next(h,t); delete vase(h,s); move h to stg2
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj ?stg - stage ?stg2 - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s)
                       (at-stage ?h ?stg) (succ-stage ?stg ?stg2))
    :effect (and (next ?h ?t) (not (vase ?h ?s))
                 (at-stage ?h ?stg2) (not (at-stage ?h ?stg)))
  )
)