(define (domain MysteryBlocksworld22)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x ?y - object)
    (next ?x ?y - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (spring ?x - object)
    (collect ?x ?y - object)
  )

  ; Action: paltry object_0 object_1 object_2
  ; Preconditions: hand obj0, cats obj1, texture obj2, vase obj0 obj1, next obj1 obj2
  ; Effects: add next obj0 obj2, del vase obj0 obj1
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: sip object_0 object_1 object_2
  ; Preconditions: hand obj0, cats obj1, texture obj2, next obj0 obj2, next obj1 obj2
  ; Effects: add vase obj0 obj1, del next obj0 obj2
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: clip object_0 object_1 object_2
  ; Preconditions: hand obj0, sneeze obj1, texture obj2, next obj1 obj2, next obj0 obj2
  ; Effects: add vase obj0 obj1, del next obj0 obj2
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: wretched object_0 object_1 object_2 object_3
  ; Preconditions: sneeze obj0, texture obj1, texture obj2, stupendous obj3,
  ;                next obj0 obj1, collect obj1 obj3, collect obj2 obj3
  ; Effects: add next obj0 obj2, del next obj0 obj1
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
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

  ; Action: memory object_0 object_1 object_2
  ; Preconditions: cats obj0, spring obj1, spring obj2, next obj0 obj1
  ; Effects: add next obj0 obj2, del next obj0 obj1
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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

  ; Action: tightfisted object_0 object_1 object_2
  ; Preconditions: hand obj0, sneeze obj1, texture obj2, next obj1 obj2, vase obj0 obj1
  ; Effects: add next obj0 obj2, del vase obj0 obj1
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object)
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