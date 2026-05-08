(define (domain obfuscated_deceptive_logistics_8)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (next ?o1 ?o2 - obj)
    (vase ?o1 ?o2 - obj)
    (collect ?o1 ?o2 - obj)
  )

  (:action paltry
    :parameters (?agent - obj ?city - obj ?sub - obj)
    :precondition (and (hand ?agent) (cats ?city) (texture ?sub) (vase ?agent ?city) (next ?city ?sub))
    :effect (and (next ?agent ?sub) (not (vase ?agent ?city)))
  )

  (:action sip
    :parameters (?agent - obj ?city - obj ?sub - obj)
    :precondition (and (hand ?agent) (cats ?city) (texture ?sub) (next ?agent ?sub) (next ?city ?sub))
    :effect (and (vase ?agent ?city) (not (next ?agent ?sub)))
  )

  (:action clip
    :parameters (?agent - obj ?city - obj ?sub - obj)
    :precondition (and (hand ?agent) (sneeze ?city) (texture ?sub) (next ?city ?sub) (next ?agent ?sub))
    :effect (and (vase ?agent ?city) (not (next ?agent ?sub)))
  )

  (:action wretched
    :parameters (?city - obj ?sub1 - obj ?sub2 - obj ?group - obj)
    :precondition (and (sneeze ?city) (texture ?sub1) (texture ?sub2) (stupendous ?group) (next ?city ?sub1) (collect ?sub1 ?group) (collect ?sub2 ?group))
    :effect (and (next ?city ?sub2) (not (next ?city ?sub1)))
  )

  (:action memory
    :parameters (?city - obj ?spring1 - obj ?spring2 - obj)
    :precondition (and (cats ?city) (spring ?spring1) (spring ?spring2) (next ?city ?spring1))
    :effect (and (next ?city ?spring2) (not (next ?city ?spring1)))
  )

  (:action tightfisted
    :parameters (?agent - obj ?city - obj ?sub - obj)
    :precondition (and (hand ?agent) (sneeze ?city) (texture ?sub) (next ?city ?sub) (vase ?agent ?city))
    :effect (and (next ?agent ?sub) (not (vase ?agent ?city)))
  )
)