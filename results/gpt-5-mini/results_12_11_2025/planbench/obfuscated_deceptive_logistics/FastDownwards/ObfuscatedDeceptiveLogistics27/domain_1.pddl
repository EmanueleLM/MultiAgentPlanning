(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?h - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
  )

  ;; paltry(h,a,b): requires hand h, cats a, texture b, vase h a, next a b
  ;; effects: add next h b, remove vase h a
  (:action paltry
    :parameters (?h - obj ?a - obj ?b - obj)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
      (vase ?h ?a)
      (next ?a ?b)
    )
    :effect (and
      (next ?h ?b)
      (not (vase ?h ?a))
    )
  )

  ;; sip(h,a,b): requires hand h, cats a, texture b, next h b, next a b
  ;; effects: add vase h a, remove next h b
  (:action sip
    :parameters (?h - obj ?a - obj ?b - obj)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
      (next ?h ?b)
      (next ?a ?b)
    )
    :effect (and
      (vase ?h ?a)
      (not (next ?h ?b))
    )
  )

  ;; clip(h,s,t): requires hand h, sneeze s, texture t, next s t, next h t
  ;; effects: add vase h s, remove next h t
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

  ;; wretched(s, t1, t2, u): requires sneeze s, texture t1, texture t2, stupendous u,
  ;;                       next s t1, collect t1 u, collect t2 u
  ;; effects: add next s t2, remove next s t1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?u - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?u)
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  ;; memory(c, s1, s2): requires cats c, spring s1, spring s2, next c s1
  ;; effects: add next c s2, remove next c s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
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

  ;; tightfisted(h, s, t): requires hand h, sneeze s, texture t, next s t, vase h s
  ;; effects: add next h t, remove vase h s
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