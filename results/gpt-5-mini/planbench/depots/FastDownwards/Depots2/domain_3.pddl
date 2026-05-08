(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)
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
  ;; preconditions: hoist co-located, supporting surface at place, crate on that surface, crate at place, hoist available, crate clear
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (surface_at ?c ?p)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate is removed from its supporting surface and from the place (temporarily lifted)
      (not (on ?c ?s))
      (not (surface_at ?c ?p))
      ;; hoist now holds crate and becomes unavailable
      (lifting ?h ?c)
      (not (available ?h))
      ;; supporting surface becomes clear
      (clear ?s)
      ;; the lifted crate remains clear (nothing on top)
      (clear ?c)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (surface_at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      ;; hoist releases crate and becomes available
      (not (lifting ?h ?c))
      (available ?h)
      ;; crate is placed on the target surface at the place
      (on ?c ?s)
      (surface_at ?c ?p)
      ;; support surface now not clear; crate is clear (top)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; crate is placed into truck, hoist releases and becomes available
      (not (lifting ?h ?c))
      (available ?h)
      (in_truck ?c ?t)
      ;; crate is no longer located at the place as a surface
      (not (surface_at ?c ?p))
      ;; crate inside truck has no on relation and is considered clear inside truck
      (clear ?c)
    )
  )

  ;; hoist unloads a crate from a truck (hoist must be available and co-located)
  ;; result: crate is lifted by hoist and hoist becomes unavailable
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
      ;; crate is now being held by the hoist (not at place as surface)
      (clear ?c)
    )
  )
)