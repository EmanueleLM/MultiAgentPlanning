(define (domain logistics16)
  (:requirements :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  (:action Paltry
    :parameters (?a - object ?b - object ?c - object)
    :precondition (and (hand ?a) (collect ?b ?c) (texture ?b))
    :effect (and (not (next ?b ?c)) (next ?a ?c) (vase ?a ?b))
  )

  (:action Sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (sneeze ?x) (next ?y ?z) (spring ?z))
    :effect (and (not (next ?y ?z)) (next ?x ?z))
  )

  (:action Clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (cats ?x) (texture ?y) (next ?y ?z))
    :effect (and (not (vase ?y ?z)) (vase ?x ?z) (not (next ?y ?z)) (next ?x ?z))
  )

  (:action Wretched
    :parameters (?a - object ?b - object ?c - object ?d - object)
    :precondition (and (hand ?a) (collect ?b ?c) (stupendous ?d))
    :effect (and (not (next ?b ?c)) (next ?a ?c) (not (vase ?b ?d)) (vase ?a ?d))
  )

  (:action Memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (texture ?x) (spring ?y) (next ?y ?z))
    :effect (and (not (next ?y ?z)) (next ?x ?z))
  )

  (:action Tightfisted
    :parameters (?a - object ?b - object ?c - object)
    :precondition (and (hand ?a) (sneeze ?b) (collect ?b ?c))
    :effect (and (not (next ?b ?c)) (next ?a ?c) (vase ?a ?c))
  )
)