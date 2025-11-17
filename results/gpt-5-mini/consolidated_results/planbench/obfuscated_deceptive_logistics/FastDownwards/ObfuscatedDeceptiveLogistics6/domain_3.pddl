(define (domain ObfuscatedDeceptiveLogistics6)
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
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?from - stage ?to - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?from)
      (succ ?from ?to)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (current ?to)
      (not (current ?from))
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object ?from - stage ?to - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?from)
      (succ ?from ?to)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (current ?to)
      (not (current ?from))
    )
  )

  (:action clip
    :parameters (?h - object ?s - object ?t - object ?from - stage ?to - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
      (current ?from)
      (succ ?from ?to)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
      (current ?to)
      (not (current ?from))
    )
  )

  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?sp - object ?from - stage ?to - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?sp)
      (next ?s ?t1)
      (collect ?t1 ?sp)
      (collect ?t2 ?sp)
      (current ?from)
      (succ ?from ?to)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
      (current ?to)
      (not (current ?from))
    )
  )

  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object ?from - stage ?to - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current ?from)
      (succ ?from ?to)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (current ?to)
      (not (current ?from))
    )
  )

  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object ?from - stage ?to - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
      (current ?from)
      (succ ?from ?to)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
      (current ?to)
      (not (current ?from))
    )
  )
)