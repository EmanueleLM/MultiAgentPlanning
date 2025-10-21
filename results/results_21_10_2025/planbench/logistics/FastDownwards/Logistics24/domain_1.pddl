(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    ;; unary predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)

    ;; binary relations
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (collect ?x ?y - object)
  )

  ;; paltry: requires hand(h), cats(c), texture(t), vase(h,c), next(c,t)
  ;; effects: add next(h,t), delete vase(h,c)
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
      (not (vase ?h ?c))
      (next ?h ?t)
    )
  )

  ;; sip: requires hand(h), cats(c), texture(t), next(h,t), next(c,t)
  ;; effects: add vase(h,c), delete next(h,t)
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

  ;; clip: requires hand(h), sneeze(c), texture(t), next(c,t), next(h,t)
  ;; effects: add vase(h,c), delete next(h,t)
  (:action clip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (hand ?h)
      (sneeze ?c)
      (texture ?t)
      (next ?c ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; wretched: requires sneeze(s), texture(t1), texture(t2), stupendous(st),
  ;;            next(s,t1), collect(t1,st), collect(t2,st)
  ;; effects: add next(s,t2), delete next(s,t1)
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?st - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
    )
    :effect (and
      (not (next ?s ?t1))
      (next ?s ?t2)
    )
  )

  ;; memory: requires cats(c), spring(s1), spring(s2), next(c,s1)
  ;; effects: add next(c,s2), delete next(c,s1)
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (not (next ?c ?s1))
      (next ?c ?s2)
    )
  )

  ;; tightfisted: requires hand(h), sneeze(s), texture(t), next(s,t), vase(h,s)
  ;; effects: add next(h,t), delete vase(h,s)
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
      (not (vase ?h ?s))
      (next ?h ?t)
    )
  )
)