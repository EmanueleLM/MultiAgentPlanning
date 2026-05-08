(define (domain obfuscated_logistics)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?obj - object)
    (cats ?obj - object)
    (texture ?obj - object)
    (sneeze ?obj - object)
    (spring ?obj - object)
    (stupendous ?obj - object)
    (vase ?obj1 ?obj2 - object)
    (next ?obj1 ?obj2 - object)
    (collect ?obj1 ?obj2 - object)
  )

  (:action paltry
    :parameters (?v - object ?c - object ?l - object)
    :precondition (and (hand ?v) (cats ?c) (texture ?l) (vase ?v ?c) (next ?c ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?c)))
  )

  (:action sip
    :parameters (?v - object ?c - object ?l - object)
    :precondition (and (hand ?v) (cats ?c) (texture ?l) (next ?v ?l) (next ?c ?l))
    :effect (and (vase ?v ?c) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v - object ?c - object ?l - object)
    :precondition (and (hand ?v) (sneeze ?c) (texture ?l) (next ?c ?l) (next ?v ?l))
    :effect (and (vase ?v ?c) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?c - object ?l1 - object ?l2 - object ?a - object)
    :precondition (and (sneeze ?c) (texture ?l1) (texture ?l2) (stupendous ?a)
                       (next ?c ?l1) (collect ?l1 ?a) (collect ?l2 ?a))
    :effect (and (next ?c ?l2) (not (next ?c ?l1)))
  )

  (:action memory
    :parameters (?c - object ?l1 - object ?l2 - object)
    :precondition (and (cats ?c) (spring ?l1) (spring ?l2) (next ?c ?l1))
    :effect (and (next ?c ?l2) (not (next ?c ?l1)))
  )

  (:action tightfisted
    :parameters (?v - object ?c - object ?l - object)
    :precondition (and (hand ?v) (sneeze ?c) (texture ?l) (next ?c ?l) (vase ?v ?c))
    :effect (and (next ?v ?l) (not (vase ?v ?c)))
  )
)