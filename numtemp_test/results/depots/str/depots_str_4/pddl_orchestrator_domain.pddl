(define (domain hoist-truck-multiagent)
  (:requirements :strips)
  (:predicates
    (at ?obj ?place)
    (on ?top ?bottom)
    (in ?crate ?truck)
    (clear ?surface)
    (hoist-idle ?hoist)
    (hoist-holding ?hoist ?crate)
  )

  ;; Truck action: drive between places (no adjacency assumptions)
  (:action drive
    :parameters (?truck ?from ?to)
    :precondition (at ?truck ?from)
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; Hoist lifts a clear crate from a surface (pallet or crate) at its place into its holding
  (:action hoist-lift
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (hoist-idle ?hoist)
      (at ?hoist ?place)
      (at ?crate ?place)
      (on ?crate ?surface)
      (clear ?crate)
    )
    :effect (and
      (not (hoist-idle ?hoist))
      (hoist-holding ?hoist ?crate)
      (not (on ?crate ?surface))
      (clear ?surface)
      (not (clear ?crate))
      (not (at ?crate ?place))
    )
  )

  ;; Hoist drops a held crate onto a surface (pallet or crate) at the same place
  (:action hoist-drop
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (hoist-holding ?hoist ?crate)
      (at ?hoist ?place)
      (at ?surface ?place)
      (clear ?surface)
    )
    :effect (and
      (not (hoist-holding ?hoist ?crate))
      (hoist-idle ?hoist)
      (on ?crate ?surface)
      (at ?crate ?place)
      (not (clear ?surface))
      (clear ?crate)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place
  (:action hoist-load
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (hoist-holding ?hoist ?crate)
      (at ?hoist ?place)
      (at ?truck ?place)
    )
    :effect (and
      (in ?crate ?truck)
      (not (hoist-holding ?hoist ?crate))
      (hoist-idle ?hoist)
    )
  )

  ;; Hoist unloads a crate from a truck into its holding (truck and hoist at same place)
  (:action hoist-unload
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (in ?crate ?truck)
      (at ?truck ?place)
      (at ?hoist ?place)
      (hoist-idle ?hoist)
    )
    :effect (and
      (not (in ?crate ?truck))
      (not (hoist-idle ?hoist))
      (hoist-holding ?hoist ?crate)
    )
  )
)