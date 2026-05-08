(define (domain orchestrator)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (next ?a ?b)
    (vase ?a ?b)
    (collect ?a ?b)
  )

  ;; paltry: requires hand, cats, texture, vase(h,c), next(c,t)
  ;; effect: set next(h,t), remove vase(h,c)
  (:action paltry
    :parameters (?h ?c ?t)
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

  ;; sip: requires hand, cats, texture, next(h,t), next(c,t)
  ;; effect: set vase(h,c), remove next(h,t)
  (:action sip
    :parameters (?h ?c ?t)
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

  ;; clip: requires hand, sneeze, texture, next(s,t), next(h,t)
  ;; effect: set vase(h,s), remove next(h,t)
  (:action clip
    :parameters (?h ?s ?t)
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

  ;; wretched: requires sneeze(s), texture t1, texture t2, stupendous st,
  ;;            next(s,t1), collect(t1,st), collect(t2,st)
  ;; effect: set next(s,t2), remove next(s,t1)
  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
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
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; memory: requires cats(c), spring s1, spring s2, next(c,s1)
  ;; effect: set next(c,s2), remove next(c,s1)
  (:action memory
    :parameters (?c ?s1 ?s2)
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

  ;; tightfisted: requires hand(h), sneeze(s), texture t, next(s,t), vase(h,s)
  ;; effect: set next(h,t), remove vase(h,s)
  (:action tightfisted
    :parameters (?h ?s ?t)
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