(define (domain multi_actions)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o ?o2)
    (next ?o ?o2)
    (sneeze ?o)
    (spring ?o)
    (collect ?o ?o2)
    (stupendous ?o)
  )

  ;; paltry: needs hand ?s, cats ?x, texture ?y, vase ?s ?x, next ?x ?y
  ;; effects: add next ?s ?y, delete vase ?s ?x
  (:action paltry
    :parameters (?s ?x ?y)
    :precondition (and (hand ?s) (cats ?x) (texture ?y) (vase ?s ?x) (next ?x ?y))
    :effect (and (next ?s ?y) (not (vase ?s ?x)))
  )

  ;; sip: needs hand ?s, cats ?x, texture ?y, next ?s ?y, next ?x ?y
  ;; effects: add vase ?s ?x, delete next ?s ?y
  (:action sip
    :parameters (?s ?x ?y)
    :precondition (and (hand ?s) (cats ?x) (texture ?y) (next ?s ?y) (next ?x ?y))
    :effect (and (vase ?s ?x) (not (next ?s ?y)))
  )

  ;; clip: needs hand ?s, sneeze ?x, texture ?y, next ?x ?y, next ?s ?y
  ;; effects: add vase ?s ?x, delete next ?s ?y
  (:action clip
    :parameters (?s ?x ?y)
    :precondition (and (hand ?s) (sneeze ?x) (texture ?y) (next ?x ?y) (next ?s ?y))
    :effect (and (vase ?s ?x) (not (next ?s ?y)))
  )

  ;; wretched: needs sneeze ?a, texture ?b, texture ?c, stupendous ?d, next ?a ?b, collect ?b ?d, collect ?c ?d
  ;; effects: add next ?a ?c, delete next ?a ?b
  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ;; memory: needs cats ?a, spring ?b, spring ?c, next ?a ?b
  ;; effects: add next ?a ?c, delete next ?a ?b
  (:action memory
    :parameters (?a ?b ?c)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ;; tightfisted: needs hand ?s, sneeze ?x, texture ?y, next ?x ?y, vase ?s ?x
  ;; effects: add next ?s ?y, delete vase ?s ?x
  (:action tightfisted
    :parameters (?s ?x ?y)
    :precondition (and (hand ?s) (sneeze ?x) (texture ?y) (next ?x ?y) (vase ?s ?x))
    :effect (and (next ?s ?y) (not (vase ?s ?x)))
  )

)