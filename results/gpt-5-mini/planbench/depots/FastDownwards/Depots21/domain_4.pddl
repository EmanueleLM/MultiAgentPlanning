(define (domain multiagent_hoist_truck)
  (:requirements :strips :typing)
  (:types place truck hoist surface pallet crate)

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)

    ;; surfaces (pallets and crates) location at places
    (surface_at ?s - surface ?p - place)

    ;; crate location when resting at a place (on some surface)
    (crate_at ?c - crate ?p - place)

    ;; stacking / containment: top crate on a surface (surface may be pallet or crate)
    (on ?c - crate ?s - surface)

    ;; inside truck
    (in_truck ?c - crate ?tr - truck)

    ;; hoist holding a crate
    (holding ?h - hoist ?c - crate)

    ;; hoist availability flag
    (hoist_available ?h - hoist)

    ;; surface clear: nothing on top of that surface (applies to pallets and crates)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another (must be at origin)
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (truck_at ?tr ?to)
      (not (truck_at ?tr ?from))
    )
  )

  ;; Lift a crate from a surface (pallet or crate) with a hoist at the same place.
  ;; Pre: hoist and surface at same place, crate is on that surface and clear, hoist available.
  ;; Post: hoist holds the crate, hoist becomes unavailable, crate is no longer on the surface nor at the place,
  ;;       the crate is no longer considered a surface at the place, and the supporting surface becomes clear.
  (:action hoist_operator-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (crate_at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (crate_at ?c ?p))
      (not (surface_at ?c ?p))
      (clear ?s)
    )
  )

  ;; Drop a held crate from a hoist onto a surface (pallet or crate) at the same place.
  ;; Pre: hoist and surface at same place, hoist is holding the crate, surface is clear.
  ;; Post: hoist becomes available, stops holding the crate, crate is on the surface and at the place,
  ;;       crate is now a surface at that place, supporting surface becomes not clear, crate becomes clear.
  (:action hoist_operator-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (holding ?h ?c))
      (on ?c ?s)
      (crate_at ?c ?p)
      (surface_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Load a held crate into a truck at the same place.
  ;; Pre: hoist and truck at same place, hoist is holding the crate.
  ;; Post: crate is inside the truck, hoist becomes available and stops holding the crate,
  ;;       crate is no longer at the place nor considered a surface at that place.
  (:action hoist_operator-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (holding ?h ?c))
      (not (crate_at ?c ?p))
      (not (surface_at ?c ?p))
      (clear ?c)
    )
  )

  ;; Unload a crate from a truck with a hoist at the same place.
  ;; Pre: hoist and truck at same place, hoist available, crate in the truck.
  ;; Post: crate is removed from the truck and the hoist holds it (hoist becomes unavailable).
  (:action hoist_operator-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (holding ?h ?c)
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (clear ?c)
    )
  )
)