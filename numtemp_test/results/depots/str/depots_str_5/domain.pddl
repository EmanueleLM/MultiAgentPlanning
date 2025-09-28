(define (domain multi-agent-warehouse)
  (:requirements :strips :negative-preconditions :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:predicates
    (at ?obj ?place)                      ; object (truck, hoist, pallet, crate) is at place
    (in ?crate ?truck)                    ; crate is inside truck
    (on ?below ?above)                    ; below surface has above crate on it
    (clear ?obj)                          ; surface (crate or pallet) has nothing on top
    (idle ?hoist)                         ; hoist is idle
    (lifting ?hoist)                      ; hoist is currently lifting (busy)
    (holding ?hoist ?crate)               ; hoist is holding a crate
  )

  ; Truck driving actions (distinct names retained, but parameterized so domain is generic)
  (:action drive-truck0
    :parameters (?truck ?from ?to)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action drive-truck1
    :parameters (?truck ?from ?to)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action drive-truck2
    :parameters (?truck ?from ?to)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )
  (:action drive-truck3
    :parameters (?truck ?from ?to)
    :precondition (and (at ?truck ?from))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to))
  )

  ; Hoist actions (parameterized by hoist id but generic so each hoist can use them)
  ; Lift a crate from a surface (pallet or crate) into hoist's grip
  (:action hoist-lift
    :parameters (?h ?below ?crate)
    :precondition (and (idle ?h) (on ?below ?crate) (clear ?crate))
    :effect (and
      (not (on ?below ?crate))
      (not (idle ?h))
      (lifting ?h)
      (holding ?h ?crate)
      (clear ?below)
      (not (clear ?crate))
    )
  )

  ; Drop a held crate onto a surface (pallet or crate)
  (:action hoist-drop
    :parameters (?h ?below ?crate)
    :precondition (and (lifting ?h) (holding ?h ?crate) (clear ?below))
    :effect (and
      (on ?below ?crate)
      (not (lifting ?h))
      (idle ?h)
      (not (holding ?h ?crate))
      (not (clear ?below))
      (clear ?crate)
    )
  )

  ; Load a crate into a truck (hoist places crate into truck)
  (:action hoist-load-into-truck
    :parameters (?h ?truck ?p ?below ?crate)
    :precondition (and (idle ?h) (at ?truck ?p) (at ?h ?p) (on ?below ?crate) (clear ?crate))
    :effect (and
      (in ?crate ?truck)
      (not (on ?below ?crate))
      (clear ?below)
      (not (idle ?h))
      (lifting ?h)
      (holding ?h ?crate)
      (not (clear ?crate))
    )
  )

  ; Finish loading: hoist places crate into truck fully (hoist becomes idle and not holding)
  (:action hoist-finish-load
    :parameters (?h ?truck ?crate)
    :precondition (and (lifting ?h) (holding ?h ?crate) (in ?crate ?truck))
    :effect (and
      (not (lifting ?h))
      (idle ?h)
      (not (holding ?h ?crate))
      (clear ?crate)
    )
  )

  ; Unload a crate from a truck onto a surface (hoist takes crate out of truck then places)
  (:action hoist-unload-from-truck
    :parameters (?h ?truck ?p ?below ?crate)
    :precondition (and (idle ?h) (at ?truck ?p) (at ?h ?p) (in ?crate ?truck) (clear ?below))
    :effect (and
      (not (in ?crate ?truck))
      (on ?below ?crate)
      (not (idle ?h))
      (lifting ?h)
      (not (clear ?below))
      (not (clear ?crate))
    )
  )

  ; After unloading, hoist becomes idle and crate is placed (hoist no longer lifting)
  (:action hoist-finish-unload
    :parameters (?h ?crate)
    :precondition (and (lifting ?h) (not (idle ?h)))
    :effect (and
      (not (lifting ?h))
      (idle ?h)
      (clear ?crate)
    )
  )
)