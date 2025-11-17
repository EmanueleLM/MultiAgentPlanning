(define (domain next-vase-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

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
  )

  ;; memory(x,y,z)
  ;; Pre: cats(x), spring(y), spring(z), next(x,y)
  ;; Eff: add next(x,z), del next(x,y)
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; sip(h,c,t)
  ;; Pre: hand(h), cats(c), texture(t), next(h,t), next(c,t)
  ;; Eff: add vase(h,c), del next(h,t)
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; paltry(h,c,t)
  ;; Pre: hand(h), cats(c), texture(t), vase(h,c), next(c,t)
  ;; Eff: add next(h,t), del vase(h,c)
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; clip(h,s,t)
  ;; Pre: hand(h), sneeze(s), texture(t), next(s,t), next(h,t)
  ;; Eff: add vase(h,s), del next(h,t)
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched(s,t1,t2,o)
  ;; Pre: sneeze(s), texture(t1), texture(t2), stupendous(o), next(s,t1), collect(t1,o), collect(t2,o)
  ;; Eff: add next(s,t2), del next(s,t1)
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?o - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?o)
                       (next ?s ?t1) (collect ?t1 ?o) (collect ?t2 ?o))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; tightfisted(h,s,t)
  ;; Pre: hand(h), sneeze(s), texture(t), next(s,t), vase(h,s)
  ;; Eff: add next(h,t), del vase(h,s)
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)