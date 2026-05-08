(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ; location predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ; stacking / containment
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)

    ; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ; whether a surface (pallet or crate) has nothing on it
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Hoist lifts crate from a surface at a place.
  ;; Requires hoist at place, surface at place, crate on that surface, hoist available, crate clear.
  ;; Effects: crate removed from surface and place, hoist starts lifting crate and becomes unavailable, surface becomes clear.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops crate to a surface at a place.
  ;; Requires hoist and surface co-located, surface clear, and hoist lifting that crate.
  ;; Effects: crate placed on surface at place, hoist becomes available and stops lifting, surface now not clear, crate becomes clear.
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  ;; Requires hoist at place, truck at place, hoist lifting the crate.
  ;; Effects: crate becomes in the truck, hoist becomes available and stops lifting, crate is not at the place.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at_surface ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist must be available and co-located with the truck).
  ;; Requires hoist at place, truck at place, hoist available, crate in the truck.
  ;; Effects: crate removed from truck, hoist becomes unavailable and starts lifting the crate, crate not at place (until dropped).
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (at_surface ?c ?p))
    )
  )
)