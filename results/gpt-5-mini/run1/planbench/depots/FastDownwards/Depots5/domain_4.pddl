(define (domain hoist-truck-multiagent)
  (:requirements :strips)
  ;; Untyped (classical) model specialized for this instance.
  (:predicates
    ;; Generic "at" relation for trucks, hoists, crates, pallets
    (at ?obj ?place)

    ;; Road connectivity between places (directed)
    (road ?p ?q)

    ;; Hoist status
    (available ?h)
    (holding ?h ?c)

    ;; Crate inside truck
    (in ?c ?t)

    ;; Stacking: crate on surface (surface can be a pallet or another crate)
    (on ?c ?s)

    ;; Clear means nothing is on the object (top of a stack or empty pallet)
    (clear ?x)
  )

  ;; Drive a truck from one place to another.
  (:action truck_drive
    :parameters (?truck ?from ?to)
    :precondition (and
      (at ?truck ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; Hoist lifts a crate that is on a surface (crate or pallet) at a place.
  (:action hoist_lift_from_surface
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (on ?crate ?surface)
      (at ?surface ?place)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (available ?hoist))
      (holding ?hoist ?crate)
      (not (on ?crate ?surface))
      (not (at ?crate ?place))
      (clear ?surface)
    )
  )

  ;; Hoist lifts a crate that is directly on the place (ground) at a place.
  (:action hoist_lift_from_place
    :parameters (?hoist ?crate ?place)
    :precondition (and
      (at ?hoist ?place)
      (at ?crate ?place)
      (available ?hoist)
      (clear ?crate)
    )
    :effect (and
      (not (available ?hoist))
      (holding ?hoist ?crate)
      (not (at ?crate ?place))
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  (:action hoist_load_into_truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (holding ?hoist ?crate)
    )
    :effect (and
      (in ?crate ?truck)
      (not (holding ?hoist ?crate))
      (available ?hoist)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist (hoist becomes busy and holds the crate).
  (:action hoist_unload_from_truck
    :parameters (?hoist ?crate ?truck ?place)
    :precondition (and
      (at ?hoist ?place)
      (at ?truck ?place)
      (available ?hoist)
      (in ?crate ?truck)
    )
    :effect (and
      (not (in ?crate ?truck))
      (holding ?hoist ?crate)
      (not (available ?hoist))
    )
  )

  ;; Hoist drops a held crate onto a surface (crate or pallet) at the same place.
  (:action hoist_drop_to_surface
    :parameters (?hoist ?crate ?surface ?place)
    :precondition (and
      (at ?hoist ?place)
      (at ?surface ?place)
      (holding ?hoist ?crate)
      (clear ?surface)
    )
    :effect (and
      (not (holding ?hoist ?crate))
      (available ?hoist)
      (at ?crate ?place)
      (on ?crate ?surface)
      (clear ?crate)
      (not (clear ?surface))
    )
  )
)