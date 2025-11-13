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
    ;; explicit discrete stage/time control to enforce contiguous, ordered action execution
    (now ?t - stage)
    (succ ?t1 ?t2 - stage)
  )

  ;; paltry(h,c,t) : requires hand(h), cats(c), texture(t), vase(h,c), next(c,t)
  ;; effects: add next(h,t), del vase(h,c), advance time
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

  ;; sip(h,c,t) : requires hand(h), cats(c), texture(t), next(h,t), next(c,t)
  ;; effects: add vase(h,c), del next(h,t), advance time
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

  ;; clip(h,sneeze_obj,t) : requires hand(h), sneeze(sneeze_obj), texture(t), next(sneeze_obj,t), next(h,t)
  ;; effects: add vase(h,sneeze_obj), del next(h,t), advance time
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

  ;; wretched(a,b,c,stup) : requires sneeze(a), texture(b), texture(c), stupendous(stup),
  ;;                         next(a,b), collect(b,stup), collect(c,stup)
  ;; effects: add next(a,c), del next(a,b), advance time
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

  ;; memory(cats_obj,s1,s2) : requires cats(cats_obj), spring(s1), spring(s2), next(cats_obj,s1)
  ;; effects: add next(cats_obj,s2), del next(cats_obj,s1), advance time
  (:action memory
    :parameters (?c ?s1 ?s2 - obj ?stg ?stg2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (now ?stg)
      (succ ?stg ?stg2)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (now ?stg))
      (now ?stg2)
    )
  )

  ;; tightfisted(h,sneeze_obj,t) : requires hand(h), sneeze(sneeze_obj), texture(t), next(sneeze_obj,t), vase(h,sneeze_obj)
  ;; effects: add next(h,t), del vase(h,sneeze_obj), advance time
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