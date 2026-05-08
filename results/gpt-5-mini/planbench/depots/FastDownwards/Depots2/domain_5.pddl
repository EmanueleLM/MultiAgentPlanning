(define (domain depots)
  (:requirements :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )

  (:predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)  ; surface (pallet or crate) is located at place
    (on ?c - crate ?s - surface)          ; crate c is on surface s
    (in_truck ?c - crate ?t - truck)     ; crate is inside truck
    (lifting ?h - hoist ?c - crate)       ; hoist h is currently lifting crate c
    (available ?h - hoist)               ; hoist is available for operations
    (clear ?s - surface)                 ; nothing is on the given surface (can be a crate or a pallet)
  )

  ;; Drive a truck between places (roads fully connected).
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Move a hoist between places.
  (:action move_hoist
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (at_hoist ?h ?from)
    :effect (and
      (not (at_hoist ?h ?from))
      (at_hoist ?h ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
  ;; Preconditions: hoist and surface are at the same place, crate is on that surface,
  ;; hoist available, crate clear (nothing on top).
  ;; Effects: crate removed from the surface and place, hoist holds the crate, hoist becomes unavailable,
  ;; the previously occupied surface becomes clear.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (surface_at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; Use a hoist to drop a lifted crate onto a surface at the same place.
  ;; Preconditions: hoist and surface at same place, hoist is lifting the crate, target surface is clear.
  ;; Effects: crate is placed on the surface at the place, hoist becomes available and no longer lifting the crate,
  ;; target surface no longer clear, crate becomes clear (nothing on it).
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
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

  ;; Load a lifted crate into a truck at the same place.
  ;; Preconditions: hoist and truck at same place, hoist is lifting the crate.
  ;; Effects: crate ends up in the truck, hoist becomes available and is no longer lifting the crate.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in_truck ?c ?t)
      (not (surface_at ?c ?p))
    )
  )

  ;; Unload a crate from a truck using a hoist at the same place.
  ;; Preconditions: hoist and truck at same place, hoist available, crate is in the truck.
  ;; Effects: crate removed from truck and hoist begins lifting it, hoist becomes unavailable.
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
      (not (surface_at ?c ?p))
    )
  )
)