(define (domain logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; paltry: requires hand, cats, texture, vase(a,b) and next(b,c)
  ;; effects: create next(a,c) and remove vase(a,b); advance global stage marker
  (:action paltry
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; sip: requires hand, cats, texture, next(a,c) and next(b,c)
  ;; effects: create vase(a,b) and remove next(a,c); advance stage
  (:action sip
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; clip: requires hand, sneeze, texture, next(b,c) and next(a,c)
  ;; effects: create vase(a,b) and remove next(a,c); advance stage
  (:action clip
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; wretched: requires sneeze(a), texture(b), texture(c), stupendous(d), next(a,b), collect(b,d), collect(c,d)
  ;; effects: create next(a,c) and remove next(a,b); advance stage
  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; memory: requires cats(a), spring(b), spring(c), next(a,b)
  ;; effects: create next(a,c) and remove next(a,b); advance stage
  (:action memory
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; tightfisted: requires hand(a), sneeze(b), texture(c), next(b,c), vase(a,b)
  ;; effects: create next(a,c) and remove vase(a,b); advance stage
  (:action tightfisted
    :parameters (?a - object ?b - object ?c - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)