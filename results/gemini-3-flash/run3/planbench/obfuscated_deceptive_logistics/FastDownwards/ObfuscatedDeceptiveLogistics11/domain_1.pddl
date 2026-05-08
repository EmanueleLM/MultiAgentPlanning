(define (domain obfuscated_deceptive_logistics_11)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (hand ?v - obj)
    (cats ?d - obj)
    (sneeze ?d - obj)
    (texture ?l - obj)
    (spring ?l - obj)
    (stupendous ?z - obj)
    (collect ?l ?z - obj)
    (next ?obj1 ?obj2 - obj)
    (vase ?v ?d - obj)
  )

  (:action paltry
    :parameters (?v ?d ?l - obj)
    :precondition (and (hand ?v) (cats ?d) (texture ?l) (vase ?v ?d) (next ?d ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?d)))
  )

  (:action sip
    :parameters (?v ?d ?l - obj)
    :precondition (and (hand ?v) (cats ?d) (texture ?l) (next ?v ?l) (next ?d ?l))
    :effect (and (vase ?v ?d) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v ?d ?l - obj)
    :precondition (and (hand ?v) (sneeze ?d) (texture ?l) (next ?d ?l) (next ?v ?l))
    :effect (and (vase ?v ?d) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?d ?l1 ?l2 ?z - obj)
    :precondition (and (sneeze ?d) (texture ?l1) (texture ?l2) (stupendous ?z) (next ?d ?l1) (collect ?l1 ?z) (collect ?l2 ?z))
    :effect (and (next ?d ?l2) (not (next ?d ?l1)))
  )

  (:action memory
    :parameters (?d ?l1 ?l2 - obj)
    :precondition (and (cats ?d) (spring ?l1) (spring ?l2) (next ?d ?l1))
    :effect (and (next ?d ?l2) (not (next ?d ?l1)))
  )

  (:action tightfisted
    :parameters (?v ?d ?l - obj)
    :precondition (and (hand ?v) (sneeze ?d) (texture ?l) (next ?d ?l) (vase ?v ?d))
    :effect (and (next ?v ?l) (not (vase ?v ?d)))
  )
)