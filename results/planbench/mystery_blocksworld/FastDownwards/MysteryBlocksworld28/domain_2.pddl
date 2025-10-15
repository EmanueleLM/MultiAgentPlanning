(define (domain MysteryBlocksworld28)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:predicates
    (cats ?x - block)
    (collect ?x ?y - block)
    (hand ?x - block)
    (next ?x ?y - block)
    (sneeze ?x - block)
    (spring ?x - block)
    (stupendous ?x - block)
    (texture ?x - block)
    (vase ?x ?y - block)
  )

  (:action paltry
    :parameters (?a - block ?b - block ?c - block)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (vase ?a ?b) (next ?b ?c))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )

  (:action sip
    :parameters (?a - block ?b - block ?c - block)
    :precondition (and (hand ?a) (cats ?b) (texture ?c) (next ?a ?c) (next ?b ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  (:action clip
    :parameters (?a - block ?b - block ?c - block)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (next ?a ?c))
    :effect (and (vase ?a ?b) (not (next ?a ?c)))
  )

  (:action wretched
    :parameters (?a - block ?b - block ?c - block ?d - block)
    :precondition (and (sneeze ?a) (texture ?b) (texture ?c) (stupendous ?d) (next ?a ?b) (collect ?b ?d) (collect ?c ?d))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action memory
    :parameters (?a - block ?b - block ?c - block)
    :precondition (and (cats ?a) (spring ?b) (spring ?c) (next ?a ?b))
    :effect (and (next ?a ?c) (not (next ?a ?b)))
  )

  (:action tightfisted
    :parameters (?a - block ?b - block ?c - block)
    :precondition (and (hand ?a) (sneeze ?b) (texture ?c) (next ?b ?c) (vase ?a ?b))
    :effect (and (next ?a ?c) (not (vase ?a ?b)))
  )
)