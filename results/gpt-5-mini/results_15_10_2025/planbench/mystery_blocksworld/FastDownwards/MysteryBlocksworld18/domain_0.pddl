(define (domain multi_agent_domain)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?h ?c)
    (next ?a ?b)
    (sneeze ?o)
    (collect ?a ?b)
    (spring ?o)
    (stupendous ?o)
  )

  ;; paltry requires: hand OBJ0, cats OBJ1, texture OBJ2, vase OBJ0 OBJ1, next OBJ1 OBJ2.
  ;; Effect: make next OBJ0 OBJ2 true and vase OBJ0 OBJ1 false
  (:action paltry
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; sip requires: hand OBJ0, cats OBJ1, texture OBJ2, next OBJ0 OBJ2, next OBJ1 OBJ2.
  ;; Effect: make vase OBJ0 OBJ1 true and make next OBJ0 OBJ2 false
  (:action sip
    :parameters (?h ?c ?t)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; clip requires: hand OBJ0, sneeze OBJ1, texture OBJ2, next OBJ1 OBJ2, next OBJ0 OBJ2.
  ;; Effect: make vase OBJ0 OBJ1 true and make next OBJ0 OBJ2 false
  (:action clip
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched requires: sneeze OBJ0, texture OBJ1, texture OBJ2, stupendous OBJ3, next OBJ0 OBJ1, collect OBJ1 OBJ3, collect OBJ2 OBJ3.
  ;; Effect: make next OBJ0 OBJ2 true and make next OBJ0 OBJ1 false
  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; memory requires: cats OBJ0, spring OBJ1, spring OBJ2, next OBJ0 OBJ1.
  ;; Effect: make next OBJ0 OBJ2 true and make next OBJ0 OBJ1 false
  (:action memory
    :parameters (?c ?sp1 ?sp2)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  ;; tightfisted requires: hand OBJ0, sneeze OBJ1, texture OBJ2, next OBJ1 OBJ2, vase OBJ0 OBJ1.
  ;; Effect: make next OBJ0 OBJ2 true and make vase OBJ0 OBJ1 false
  (:action tightfisted
    :parameters (?h ?s ?t)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)