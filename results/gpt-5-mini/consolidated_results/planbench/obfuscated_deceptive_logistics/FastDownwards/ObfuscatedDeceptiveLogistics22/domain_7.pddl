(define (domain obfuscated_deceptive_logistics22)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 ?o2 - obj)
    (next ?o1 ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (now ?t - stage)
    (succ ?t1 ?t2 - stage)
  )

  ;; paltry(object_h, object_c, object_t)
  ;; pre: hand(h), cats(c), texture(t), vase(h,c), next(c,t), now(s) & succ(s,s2)
  ;; add: next(h,t)
  ;; del: vase(h,c)
  ;; advances time from s to s2
  (:action paltry
    :parameters (?h ?c ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; sip(object_h, object_c, object_t)
  ;; pre: hand(h), cats(c), texture(t), next(h,t), next(c,t), now(s) & succ(s,s2)
  ;; add: vase(h,c)
  ;; del: next(h,t)
  ;; advances time
  (:action sip
    :parameters (?h ?c ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; clip(object_h, object_sneeze, object_texture)
  ;; pre: hand(h), sneeze(sn), texture(t), next(sn,t), next(h,t), now(s) & succ(s,s2)
  ;; add: vase(h,sn)
  ;; del: next(h,t)
  ;; advances time
  (:action clip
    :parameters (?h ?sn ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; wretched(a,b,c,stupendous)
  ;; pre: sneeze(a), texture(b), texture(c), stupendous(st), next(a,b), collect(b,st), collect(c,st), now(s) & succ(s,s2)
  ;; add: next(a,c)
  ;; del: next(a,b)
  ;; advances time
  (:action wretched
    :parameters (?a ?b ?c ?st - obj ?s ?s2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?st)
      (next ?a ?b)
      (collect ?b ?st)
      (collect ?c ?st)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; memory(x,s1,s2)
  ;; pre: cats(x), spring(s1), spring(s2), next(x,s1), now(t) & succ(t,t2)
  ;; add: next(x,s2)
  ;; del: next(x,s1)
  ;; advances time
  (:action memory
    :parameters (?x ?s1 ?s2 - obj ?t ?t2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?s1)
      (spring ?s2)
      (next ?x ?s1)
      (now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?s2)
      (not (next ?x ?s1))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; tightfisted(hand, sneeze, texture)
  ;; pre: hand(h), sneeze(sn), texture(t), next(sn,t), vase(h,sn), now(s) & succ(s,s2)
  ;; add: next(h,t)
  ;; del: vase(h,sn)
  ;; advances time
  (:action tightfisted
    :parameters (?h ?sn ?t - obj ?s ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (now ?s))
      (now ?s2)
    )
  )
)