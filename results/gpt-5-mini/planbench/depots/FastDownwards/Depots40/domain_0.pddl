(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate - surface
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)

    ;; crate status/location
    (at ?c - crate ?p - place)           ;; crate resting at a place (on some surface there)
    (on ?c - crate ?s - surface)        ;; crate on top of surface (pallet or crate)
    (in_truck ?c - crate ?t - truck)    ;; crate inside a truck
    (lifting ?h - hoist ?c - crate)     ;; hoist is lifting the crate

    ;; hoist state and surface topology
    (hoist_available ?h - hoist)
    (clear ?s - surface)
  )

  ;; drive: move a truck between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a supporting surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (at ?c ?p)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate no longer at place nor on its supporting surface; crate becomes lifted
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (surface_at ?c ?p))        ;; crate as a surface is no longer at the place while lifted
      (lifting ?h ?c)
      ;; hoist becomes busy
      (not (hoist_available ?h))
      ;; supporting surface becomes clear
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (surface_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; hoist stops lifting and becomes available
      (not (lifting ?h ?c))
      (hoist_available ?h)
      ;; crate is now inside the truck; it is no longer at the place nor considered a surface at the place
      (in_truck ?c ?t)
      (not (at ?c ?p))
      (not (surface_at ?c ?p))
    )
  )

  ;; hoist begins unloading a crate from a truck (hoist becomes busy and lifts the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (lifting ?h ?c)
    )
  )
)