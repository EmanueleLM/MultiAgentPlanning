(define (domain symbolic_manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types abstract_type)
  (:predicates 
    (hand ?obj - abstract_type)
    (cats ?obj - abstract_type)
    (sneeze ?obj - abstract_type)
    (spring ?obj - abstract_type)
    (stupendous ?obj - abstract_type)
    (texture ?obj - abstract_type)
    (next ?obj1 - abstract_type ?obj2 - abstract_type)
    (vase ?obj1 - abstract_type ?obj2 - abstract_type)
    (collect ?obj1 - abstract_type ?obj2 - abstract_type)
  )

  (:action paltry
    :parameters (?obj0 - abstract_type ?obj1 - abstract_type ?obj2 - abstract_type)
    :precondition (and (hand ?obj0) (cats ?obj1) (texture ?obj2) (vase ?obj0 ?obj1) (next ?obj1 ?obj2))
    :effect (and (next ?obj0 ?obj2) (not (vase ?obj0 ?obj1)))
  )
  
  (:action sip
    :parameters (?obj0 - abstract_type ?obj1 - abstract_type ?obj2 - abstract_type)
    :precondition (and (hand ?obj0) (cats ?obj1) (texture ?obj2) (next ?obj0 ?obj2) (next ?obj1 ?obj2))
    :effect (and (vase ?obj0 ?obj1) (not (next ?obj0 ?obj2)))
  )
  
  (:action clip
    :parameters (?obj0 - abstract_type ?obj1 - abstract_type ?obj2 - abstract_type)
    :precondition (and (hand ?obj0) (sneeze ?obj1) (texture ?obj2) (next ?obj1 ?obj2) (next ?obj0 ?obj2))
    :effect (and (vase ?obj0 ?obj1) (not (next ?obj0 ?obj2)))
  )
  
  (:action wretched
    :parameters (?obj0 - abstract_type ?obj1 - abstract_type ?obj2 - abstract_type ?obj3 - abstract_type)
    :precondition (and (sneeze ?obj0) (texture ?obj1) (texture ?obj2) (stupendous ?obj3) (next ?obj0 ?obj1) (collect ?obj1 ?obj3) (collect ?obj2 ?obj3))
    :effect (and (next ?obj0 ?obj2) (not (next ?obj0 ?obj1)))
  )
  
  (:action memory
    :parameters (?obj0 - abstract_type ?obj1 - abstract_type ?obj2 - abstract_type)
    :precondition (and (cats ?obj0) (spring ?obj1) (spring ?obj2) (next ?obj0 ?obj1))
    :effect (and (next ?obj0 ?obj2) (not (next ?obj0 ?obj1)))
  )
  
  (:action tightfisted
    :parameters (?obj0 - abstract_type ?obj1 - abstract_type ?obj2 - abstract_type)
    :precondition (and (hand ?obj0) (sneeze ?obj1) (texture ?obj2) (next ?obj1 ?obj2) (vase ?obj0 ?obj1))
    :effect (and (next ?obj0 ?obj2) (not (vase ?obj0 ?obj1)))
  )
)