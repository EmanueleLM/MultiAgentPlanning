(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?h - object ?x - object)
    (next ?a - object ?b - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (collect ?a - object ?b - object)
    (spring ?x - object)
  )

  ;; clip(obj0, obj1, obj2)
  ;; preconds: hand(obj0), sneeze(obj1), texture(obj2), next(obj1,obj2), next(obj0,obj2)
  ;; effects: add vase(obj0,obj1); delete next(obj0,obj2)
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

  ;; wretched(obj0, obj1, obj2, obj3)
  ;; preconds: sneeze(obj0), texture(obj1), texture(obj2), stupendous(obj3),
  ;;            next(obj0,obj1), collect(obj1,obj3), collect(obj2,obj3)
  ;; effects: add next(obj0,obj2); delete next(obj0,obj1)
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

  ;; tightfisted(obj0, obj1, obj2)
  ;; preconds: hand(obj0), sneeze(obj1), texture(obj2), next(obj1,obj2), vase(obj0,obj1)
  ;; effects: add next(obj0,obj2); delete vase(obj0,obj1)
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