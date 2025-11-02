(define (domain multi_scenario_domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (stupendous ?o - obj)
  )

  ;; paltry(obj0,obj1,obj2)
  ;; Preconditions: hand(obj0), cats(obj1), texture(obj2), vase(obj0,obj1), next(obj1,obj2)
  ;; Effects: add next(obj0,obj2); delete vase(obj0,obj1)
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; sip(obj0,obj1,obj2)
  ;; Preconditions: hand(obj0), cats(obj1), texture(obj2), next(obj0,obj2), next(obj1,obj2)
  ;; Effects: add vase(obj0,obj1); delete next(obj0,obj2)
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; clip(obj0,obj1,obj2)
  ;; Preconditions: hand(obj0), sneeze(obj1), texture(obj2), next(obj1,obj2), next(obj0,obj2)
  ;; Effects: add vase(obj0,obj1); delete next(obj0,obj2)
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; wretched(obj0,obj1,obj2,obj3)
  ;; Preconditions: sneeze(obj0), texture(obj1), texture(obj2), stupendous(obj3),
  ;;                next(obj0,obj1), collect(obj1,obj3), collect(obj2,obj3)
  ;; Effects: add next(obj0,obj2); delete next(obj0,obj1)
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; memory(obj0,obj1,obj2)
  ;; Preconditions: cats(obj0), spring(obj1), spring(obj2), next(obj0,obj1)
  ;; Effects: add next(obj0,obj2); delete next(obj0,obj1)
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; tightfisted(obj0,obj1,obj2)
  ;; Preconditions: hand(obj0), sneeze(obj1), texture(obj2), next(obj1,obj2), vase(obj0,obj1)
  ;; Effects: add next(obj0,obj2); delete vase(obj0,obj1)
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

)