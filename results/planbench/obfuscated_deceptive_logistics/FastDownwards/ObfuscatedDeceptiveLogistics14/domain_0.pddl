(define (domain multi-agent-next)
  (:requirements :strips :typing)
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

  ;; paltry requires hand obj0, cats obj1, texture obj2, vase obj0 obj1, next obj1 obj2;
  ;; paltry makes next obj0 obj2 true and makes vase obj0 obj1 false.
  (:action paltry
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (cats ?obj1)
      (texture ?obj2)
      (vase ?obj0 ?obj1)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (vase ?obj0 ?obj1))
    )
  )

  ;; sip requires hand obj0, cats obj1, texture obj2, next obj0 obj2, next obj1 obj2;
  ;; sip makes vase obj0 obj1 true and makes next obj0 obj2 false.
  (:action sip
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (cats ?obj1)
      (texture ?obj2)
      (next ?obj0 ?obj2)
      (next ?obj1 ?obj2)
    )
    :effect (and
      (vase ?obj0 ?obj1)
      (not (next ?obj0 ?obj2))
    )
  )

  ;; clip requires hand obj0, sneeze obj1, texture obj2, next obj1 obj2, next obj0 obj2;
  ;; clip makes vase obj0 obj1 true and makes next obj0 obj2 false.
  (:action clip
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (sneeze ?obj1)
      (texture ?obj2)
      (next ?obj1 ?obj2)
      (next ?obj0 ?obj2)
    )
    :effect (and
      (vase ?obj0 ?obj1)
      (not (next ?obj0 ?obj2))
    )
  )

  ;; wretched requires sneeze obj0, texture obj1, texture obj2, stupendous obj3, next obj0 obj1,
  ;; collect obj1 obj3, collect obj2 obj3; wretched makes next obj0 obj2 true and makes next obj0 obj1 false.
  (:action wretched
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object ?obj3 - object)
    :precondition (and
      (sneeze ?obj0)
      (texture ?obj1)
      (texture ?obj2)
      (stupendous ?obj3)
      (next ?obj0 ?obj1)
      (collect ?obj1 ?obj3)
      (collect ?obj2 ?obj3)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (next ?obj0 ?obj1))
    )
  )

  ;; memory requires cats obj0, spring obj1, spring obj2, next obj0 obj1;
  ;; memory makes next obj0 obj2 true and makes next obj0 obj1 false.
  (:action memory
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (cats ?obj0)
      (spring ?obj1)
      (spring ?obj2)
      (next ?obj0 ?obj1)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (next ?obj0 ?obj1))
    )
  )

  ;; tightfisted requires hand obj0, sneeze obj1, texture obj2, next obj1 obj2, vase obj0 obj1;
  ;; tightfisted makes next obj0 obj2 true and makes vase obj0 obj1 false.
  (:action tightfisted
    :parameters (?obj0 - object ?obj1 - object ?obj2 - object)
    :precondition (and
      (hand ?obj0)
      (sneeze ?obj1)
      (texture ?obj2)
      (next ?obj1 ?obj2)
      (vase ?obj0 ?obj1)
    )
    :effect (and
      (next ?obj0 ?obj2)
      (not (vase ?obj0 ?obj1))
    )
  )
)