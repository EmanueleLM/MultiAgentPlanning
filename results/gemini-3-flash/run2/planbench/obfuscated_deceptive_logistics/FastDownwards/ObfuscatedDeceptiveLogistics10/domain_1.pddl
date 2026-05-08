(define (domain deceptive_logistics_10)
  (:requirements :strips :typing)
  (:types
    carrier package group - object
    vehicle location - carrier
  )
  (:predicates
    (hand ?v - vehicle)
    (cats ?l - location)
    (sneeze ?l - location)
    (texture ?p - package)
    (spring ?p - package)
    (stupendous ?g - group)
    (collect ?p - package ?g - group)
    (vase ?v - vehicle ?l - location)
    (next ?c - carrier ?p - package)
  )

  (:action paltry
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and (hand ?v) (cats ?l) (texture ?p) (vase ?v ?l) (next ?l ?p))
    :effect (and (next ?v ?p) (not (vase ?v ?l)))
  )

  (:action sip
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and (hand ?v) (cats ?l) (texture ?p) (next ?v ?p) (next ?l ?p))
    :effect (and (vase ?v ?l) (not (next ?v ?p)))
  )

  (:action clip
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and (hand ?v) (sneeze ?l) (texture ?p) (next ?l ?p) (next ?v ?p))
    :effect (and (vase ?v ?l) (not (next ?v ?p)))
  )

  (:action wretched
    :parameters (?l - location ?p1 - package ?p2 - package ?g - group)
    :precondition (and (sneeze ?l) (texture ?p1) (texture ?p2) (stupendous ?g) (next ?l ?p1) (collect ?p1 ?g) (collect ?p2 ?g))
    :effect (and (next ?l ?p2) (not (next ?l ?p1)))
  )

  (:action memory
    :parameters (?l - location ?p1 - package ?p2 - package)
    :precondition (and (cats ?l) (spring ?p1) (spring ?p2) (next ?l ?p1))
    :effect (and (next ?l ?p2) (not (next ?l ?p1)))
  )

  (:action tightfisted
    :parameters (?v - vehicle ?l - location ?p - package)
    :precondition (and (hand ?v) (sneeze ?l) (texture ?p) (next ?l ?p) (vase ?v ?l))
    :effect (and (next ?v ?p) (not (vase ?v ?l)))
  )
)