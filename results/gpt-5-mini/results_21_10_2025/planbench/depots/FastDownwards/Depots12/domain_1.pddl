(define (domain orchestrated)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (collect ?x ?y)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
  )

  ;; paltry(x0,x1,x2): pre hand(x0), cats(x1), texture(x2), vase(x0,x1), next(x1,x2).
  ;; effects: add next(x0,x2), del vase(x0,x1).
  (:action paltry
    :parameters (?a ?b ?c)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (vase ?a ?b) (next ?b ?c))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  ;; sip(x0,x1,x2): pre hand(x0), cats(x1), texture(x2), next(x0,x2), next(x1,x2).
  ;; effects: add vase(x0,x1), del next(x0,x2).
  (:action sip
    :parameters (?a ?b ?c)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (next ?a ?c) (next ?b ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  ;; clip(x0,x1,x2): pre hand(x0), sneeze(x1), texture(x2), next(x1,x2), next(x0,x2).
  ;; effects: add vase(x0,x1), del next(x0,x2).
  (:action clip
    :parameters (?a ?b ?c)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (next ?a ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  ;; memory(x0,x1,x2): pre cats(x0), spring(x1), spring(x2), next(x0,x1).
  ;; effects: add next(x0,x2), del next(x0,x1).
  (:action memory
    :parameters (?a ?b ?c)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  ;; tightfisted(x0,x1,x2): pre hand(x0), sneeze(x1), texture(x2), next(x1,x2), vase(x0,x1).
  ;; effects: add next(x0,x2), del vase(x0,x1).
  (:action tightfisted
    :parameters (?a ?b ?c)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (vase ?a ?b))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  ;; wretched(x0,x1,x2,x3): pre sneeze(x0), texture(x1), texture(x2), stupendous(x3), next(x0,x1), collect(x1,x3), collect(x2,x3).
  ;; effects: add next(x0,x2), del next(x0,x1).
  (:action wretched
    :parameters (?a ?b ?c ?d)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )
)