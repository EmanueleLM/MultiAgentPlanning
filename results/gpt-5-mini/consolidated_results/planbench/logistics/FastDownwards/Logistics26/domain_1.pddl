(define (domain Logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x ?y - obj)
    (next ?x ?y - obj)
    (collect ?x ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ; paltry: parameters preserved in original order (object_0 object_1 object_2)
  (:action paltry
    :parameters (?o0 ?o1 ?o2 - obj)
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

  ; sip: parameters (object_0 object_1 object_2)
  (:action sip
    :parameters (?o0 ?o1 ?o2 - obj)
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

  ; clip: parameters (object_0 object_1 object_2)
  (:action clip
    :parameters (?o0 ?o1 ?o2 - obj)
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

  ; wretched: parameters (object_0 object_1 object_2 object_3)
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3 - obj)
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

  ; memory: parameters (object_0 object_1 object_2)
  (:action memory
    :parameters (?o0 ?o1 ?o2 - obj)
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

  ; tightfisted: parameters (object_0 object_1 object_2)
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2 - obj)
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