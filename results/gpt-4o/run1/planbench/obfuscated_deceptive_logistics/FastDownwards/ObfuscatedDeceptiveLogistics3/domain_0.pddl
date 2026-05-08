(define (domain object_manipulation)
    (:requirements :strips :typing :negative-preconditions)
    (:types generic_object)
    (:predicates
      (hand ?x - generic_object)
      (cats ?x - generic_object)
      (texture ?x - generic_object)
      (vase ?x - generic_object ?y - generic_object)
      (next ?x - generic_object ?y - generic_object)
      (sneeze ?x - generic_object)
      (collect ?x - generic_object ?y - generic_object)
      (spring ?x - generic_object)
      (stupendous ?x - generic_object)
    )
    
    (:action paltry
      :parameters (?o0 - generic_object ?o1 - generic_object ?o2 - generic_object)
      :precondition (and 
        (hand ?o0)
        (cats ?o1)
        (texture ?o2)
        (vase ?o0 ?o1)
        (next ?o1 ?o2)
      )
      :effect (and
        (next ?o0 ?o2)
        (not (vase ?o0 ?o1))
      )
    )

    (:action sip
      :parameters (?o0 - generic_object ?o1 - generic_object ?o2 - generic_object)
      :precondition (and 
        (hand ?o0)
        (cats ?o1)
        (texture ?o2)
        (next ?o0 ?o2)
        (next ?o1 ?o2)
      )
      :effect (and
        (vase ?o0 ?o1)
        (not (next ?o0 ?o2))
      )
    )

    (:action clip
      :parameters (?o0 - generic_object ?o1 - generic_object ?o2 - generic_object)
      :precondition (and
        (hand ?o0)
        (sneeze ?o1)
        (texture ?o2)
        (next ?o1 ?o2)
        (next ?o0 ?o2)
      )
      :effect (and
        (vase ?o0 ?o1)
        (not (next ?o0 ?o2))
      )
    )

    (:action wretched
      :parameters (?o0 - generic_object ?o1 - generic_object ?o2 - generic_object ?o3 - generic_object)
      :precondition (and
        (sneeze ?o0)
        (texture ?o1)
        (texture ?o2)
        (stupendous ?o3)
        (next ?o0 ?o1)
        (collect ?o1 ?o3)
        (collect ?o2 ?o3)
      )
      :effect (and
        (next ?o0 ?o2)
        (not (next ?o0 ?o1))
      )
    )

    (:action memory
      :parameters (?o0 - generic_object ?o1 - generic_object ?o2 - generic_object)
      :precondition (and
        (cats ?o0)
        (spring ?o1)
        (spring ?o2)
        (next ?o0 ?o1)
      )
      :effect (and
        (next ?o0 ?o2)
        (not (next ?o0 ?o1))
      )
    )

    (:action tightfisted
      :parameters (?o0 - generic_object ?o1 - generic_object ?o2 - generic_object)
      :precondition (and
        (hand ?o0)
        (sneeze ?o1)
        (texture ?o2)
        (next ?o1 ?o2)
        (vase ?o0 ?o1)
      )
      :effect (and
        (next ?o0 ?o2)
        (not (vase ?o0 ?o1))
      )
    )
  )