(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    depot distributor - place
    pallet crate - surface
    truck hoist
    place surface
  )

  (:predicates
    ;; locations
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)

    ;; surfaces and placement
    (surface_at ?s - surface ?p - place)   ; a surface (pallet or crate) is located at a place
    (on ?c - crate ?s - surface)           ; crate c is directly on surface s (pallet or crate)

    ;; transport
    (in_truck ?c - crate ?t - truck)       ; crate is inside a truck

    ;; hoist state
    (lifting ?h - hoist ?c - crate)        ; hoist is currently lifting crate
    (available ?h - hoist)                 ; hoist is available for use

    ;; clearance: surface (pallet or crate) has nothing on top
    (clear ?s - surface)
  )

  ;; drive a truck between places (fully connected roads)
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; move a hoist between places (portable/transported hoist)
  (:action move_hoist
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (at_hoist ?h ?from)
    :effect (and
      (not (at_hoist ?h ?from))
      (at_hoist ?h ?to)
    )
  )

  ;; hoist lifts a crate from a surface at the same place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?s - surface ?c - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface_at ?c ?p))   ; crate is no longer located at the place while lifted
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)                 ; supporting surface becomes clear
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?s - surface ?c - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (surface_at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (on ?c ?s)
      (surface_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in_truck ?c ?t)
    )
  )

  ;; hoist unloads a crate from a truck (hoist must be available and co-located)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )
)