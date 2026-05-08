(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (collect ?x ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry: parameters (?a ?b ?c)
  ;; pre: hand ?a, cats ?b, texture ?c, vase ?a ?b, next ?b ?c
  ;; add: next ?a ?c
  ;; del: vase ?a ?b
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; sip: parameters (?a ?b ?c)
  ;; pre: hand ?a, cats ?b, texture ?c, next ?a ?c, next ?b ?c
  ;; add: vase ?a ?b
  ;; del: next ?a ?c
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; clip: parameters (?a ?b ?c)
  ;; pre: hand ?a, sneeze ?b, texture ?c, next ?b ?c, next ?a ?c
  ;; add: vase ?a ?b
  ;; del: next ?a ?c
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; wretched: parameters (?a ?b ?c ?d)
  ;; pre: sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; add: next ?a ?c
  ;; del: next ?a ?b
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
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

  ;; memory: parameters (?a ?b ?c)
  ;; pre: cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; add: next ?a ?c
  ;; del: next ?a ?b
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj)
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

  ;; tightfisted: parameters (?a ?b ?c)
  ;; pre: hand ?a, sneeze ?b, texture ?c, next ?b ?c, vase ?a ?b
  ;; add: next ?a ?c
  ;; del: vase ?a ?b
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
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