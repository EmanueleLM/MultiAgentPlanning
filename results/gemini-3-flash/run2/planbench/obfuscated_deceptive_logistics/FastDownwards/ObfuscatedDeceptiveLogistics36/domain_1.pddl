(define (domain obfuscated_deceptive_logistics_36)
  (:requirements :strips)
  (:predicates
    (hand ?o)           ;; Package
    (cats ?o)           ;; Long-haul vehicle
    (texture ?o)        ;; Location (standard)
    (vase ?pkg ?veh)    ;; Package is in vehicle
    (next ?obj ?loc)    ;; Object (package or vehicle) is at location
    (sneeze ?o)         ;; Local truck vehicle
    (stupendous ?o)     ;; Region
    (collect ?loc ?reg) ;; Location is in region
    (spring ?o)         ;; Hub/Bridge location
  )

  ;; Unload package from long-haul vehicle
  (:action paltry
    :parameters (?obj ?veh ?loc)
    :precondition (and (hand ?obj) (cats ?veh) (texture ?loc) (vase ?obj ?veh) (next ?veh ?loc))
    :effect (and (next ?obj ?loc) (not (vase ?obj ?veh)))
  )

  ;; Load package into long-haul vehicle
  (:action sip
    :parameters (?obj ?veh ?loc)
    :precondition (and (hand ?obj) (cats ?veh) (texture ?loc) (next ?obj ?loc) (next ?veh ?loc))
    :effect (and (vase ?obj ?veh) (not (next ?obj ?loc)))
  )

  ;; Load package into local truck
  (:action clip
    :parameters (?obj ?veh ?loc)
    :precondition (and (hand ?obj) (sneeze ?veh) (texture ?loc) (next ?veh ?loc) (next ?obj ?loc))
    :effect (and (vase ?obj ?veh) (not (next ?obj ?loc)))
  )

  ;; Move local truck within a region
  (:action wretched
    :parameters (?veh ?loc1 ?loc2 ?reg)
    :precondition (and (sneeze ?veh) (texture ?loc1) (texture ?loc2) (stupendous ?reg) (next ?veh ?loc1) (collect ?loc1 ?reg) (collect ?loc2 ?reg))
    :effect (and (next ?veh ?loc2) (not (next ?veh ?loc1)))
  )

  ;; Move long-haul vehicle between hubs
  (:action memory
    :parameters (?veh ?loc1 ?loc2)
    :precondition (and (cats ?veh) (spring ?loc1) (spring ?loc2) (next ?veh ?loc1))
    :effect (and (next ?veh ?loc2) (not (next ?veh ?loc1)))
  )

  ;; Unload package from local truck
  (:action tightfisted
    :parameters (?obj ?veh ?loc)
    :precondition (and (hand ?obj) (sneeze ?veh) (texture ?loc) (next ?veh ?loc) (vase ?obj ?veh))
    :effect (and (next ?obj ?loc) (not (vase ?obj ?veh)))
  )
)