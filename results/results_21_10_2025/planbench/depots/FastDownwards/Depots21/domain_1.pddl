(define (domain depots21)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (spring ?x - obj)
    (collect ?x ?y - obj)
  )

  ;; paltry: hand o0, cats o1, texture o2, vase o0 o1, next o1 o2 -> add next o0 o2, del vase o0 o1
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

  ;; sip: hand o0, cats o1, texture o2, next o0 o2, next o1 o2 -> add vase o0 o1, del next o0 o2
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

  ;; clip: hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2 -> add vase o0 o1, del next o0 o2
  (:action clip
    :parameters (?h - obj ?s - obj ?b - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?b)
      (next ?s ?b)
      (next ?h ?b)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?b))
    )
  )

  ;; wretched: sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3
  ;; -> add next o0 o2, del next o0 o1
  (:action wretched
    :parameters (?s - obj ?a - obj ?b - obj ?c - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?a)
      (texture ?b)
      (stupendous ?c)
      (next ?s ?a)
      (collect ?a ?c)
      (collect ?b ?c)
    )
    :effect (and
      (next ?s ?b)
      (not (next ?s ?a))
    )
  )

  ;; memory: cats o0, spring o1, spring o2, next o0 o1 -> add next o0 o2, del next o0 o1
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

  ;; tightfisted: hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1 -> add next o0 o2, del vase o0 o1
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?b - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?b)
      (next ?s ?b)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?b)
      (not (vase ?h ?s))
    )
  )

)