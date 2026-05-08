(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (hand ?x - thing)
    (cats ?x - thing)
    (sneeze ?x - thing)
    (texture ?x - thing)
    (stupendous ?x - thing)
    (spring ?x - thing)
    (collect ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
    (next ?x - thing ?y - thing)
  )

  ;; paltry: requires hand ?a, cats ?b, texture ?c, vase ?a ?b, next ?b ?c
  ;; adds next ?a ?c and deletes vase ?a ?b
  (:action paltry
    :parameters (?a - thing ?b - thing ?c - thing)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  ;; sip: requires hand ?a, cats ?b, texture ?c, next ?a ?c, next ?b ?c
  ;; adds vase ?a ?b and deletes next ?a ?c
  (:action sip
    :parameters (?a - thing ?b - thing ?c - thing)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; clip: requires hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c
  ;; adds vase ?a ?b and deletes next ?a ?c
  (:action clip
    :parameters (?a - thing ?b - thing ?c - thing)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  ;; wretched: requires sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; adds next ?a ?c and deletes next ?a ?b
  (:action wretched
    :parameters (?a - thing ?b - thing ?c - thing ?d - thing)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory: requires cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; adds next ?a ?c and deletes next ?a ?b
  (:action memory
    :parameters (?a - thing ?b - thing ?c - thing)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; tightfisted: requires hand ?a, sneeze ?b, texture ?c, next ?b ?c, vase ?a ?b
  ;; adds next ?a ?c and deletes vase ?a ?b
  (:action tightfisted
    :parameters (?a - thing ?b - thing ?c - thing)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )
)