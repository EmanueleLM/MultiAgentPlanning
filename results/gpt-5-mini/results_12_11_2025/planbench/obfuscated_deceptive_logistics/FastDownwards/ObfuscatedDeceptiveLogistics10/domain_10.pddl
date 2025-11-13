(define (domain ObfuscatedDeceptiveLogistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (succ ?t1 - time ?t2 - time)
    (last-time ?t - time)
  )

  ;; paltry: preconditions: hand a, cats b, texture c, vase a b, next b c
  ;; effects: add next a c, del vase a b
  (:action paltry
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
      (last-time ?pt)
      (succ ?pt ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (last-time ?pt))
      (last-time ?t)
    )
  )

  ;; sip: preconditions: hand a, cats b, texture c, next a c, next b c
  ;; effects: add vase a b, del next a c
  (:action sip
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
      (last-time ?pt)
      (succ ?pt ?t)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (last-time ?pt))
      (last-time ?t)
    )
  )

  ;; clip: preconditions: hand a, sneeze b, texture c, next b c, next a c
  ;; effects: add vase a b, del next a c
  (:action clip
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
      (last-time ?pt)
      (succ ?pt ?t)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
      (not (last-time ?pt))
      (last-time ?t)
    )
  )

  ;; wretched: preconditions: sneeze a, texture b, texture c, stupendous d,
  ;; next a b, collect b d, collect c d
  ;; effects: add next a c, del next a b
  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object ?pt - time ?t - time)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (last-time ?pt)
      (succ ?pt ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (last-time ?pt))
      (last-time ?t)
    )
  )

  ;; memory: preconditions: cats a, spring b, spring c, next a b
  ;; effects: add next a c, del next a b
  (:action memory
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (last-time ?pt)
      (succ ?pt ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (last-time ?pt))
      (last-time ?t)
    )
  )

  ;; tightfisted: preconditions: hand a, sneeze b, texture c, next b c, vase a b
  ;; effects: add next a c, del vase a b
  (:action tightfisted
    :parameters (?a - object ?b - object ?c - object ?pt - time ?t - time)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
      (last-time ?pt)
      (succ ?pt ?t)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
      (not (last-time ?pt))
      (last-time ?t)
    )
  )
)