(define (domain obfuscated_deceptive_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (next ?from - object ?to - object)
    (vase ?a - object ?b - object)
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires (hand h) (cats c) (texture t) (vase h c) (next c t)
  ;; effect: add (next h t), delete (vase h c), advance stage (strict successor)
  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; sip: requires (hand h) (cats c) (texture t) (next h t) (next c t)
  ;; effect: add (vase h c), delete (next h t), advance stage
  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; clip: requires (hand h) (sneeze sne) (texture t) (next sne t) (next h t)
  ;; effect: add (vase h sne), delete (next h t), advance stage
  (:action clip
    :parameters (?h - object ?sne - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sne)
      (texture ?t)
      (next ?sne ?t)
      (next ?h ?t)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sne)
      (not (next ?h ?t))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; wretched: requires (sneeze s) (texture t1) (texture t2) (stupendous st)
  ;;           (next s t1) (collect t1 st) (collect t2 st)
  ;; effect: add (next s t2), delete (next s t1), advance stage
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?st - object ?ss - stage ?ss2 - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (current-stage ?ss)
      (succ ?ss ?ss2)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
      (not (current-stage ?ss))
      (current-stage ?ss2)
    )
  )

  ;; memory: requires (cats c) (spring s1) (spring s2) (next c s1)
  ;; effect: add (next c s2), delete (next c s1), advance stage
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?stg - stage ?stg2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current-stage ?stg)
      (succ ?stg ?stg2)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current-stage ?stg))
      (current-stage ?stg2)
    )
  )

  ;; tightfisted: requires (hand h) (sneeze sne) (texture t) (next sne t) (vase h sne)
  ;; effect: add (next h t), delete (vase h sne), advance stage
  (:action tightfisted
    :parameters (?h - object ?sne - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sne)
      (texture ?t)
      (next ?sne ?t)
      (vase ?h ?sne)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sne))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)