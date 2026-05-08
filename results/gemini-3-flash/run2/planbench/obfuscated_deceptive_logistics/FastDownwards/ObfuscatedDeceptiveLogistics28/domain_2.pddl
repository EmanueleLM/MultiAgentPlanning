(define (domain obfuscated_deceptive_logistics_28)
  (:requirements :strips)

  (:predicates
    (hand ?o)
    (cats ?o)
    (sneeze ?o)
    (texture ?o)
    (spring ?o)
    (stupendous ?o)
    (vase ?o_pkg ?o_veh)
    (next ?o_obj ?o_loc)
    (collect ?o_loc ?o_region)
  )

  ;; paltry: Unload a package (hand) from a cats carrier at a location.
  (:action paltry
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; sip: Load a package (hand) into a cats carrier at a location.
  (:action sip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; clip: Load a package (hand) into a sneeze carrier at a location.
  (:action clip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; wretched: Move a sneeze carrier between locations in the same stupendous region.
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) 
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; memory: Move a cats carrier between spring locations.
  (:action memory
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; tightfisted: Unload a package (hand) from a sneeze carrier at a location.
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)