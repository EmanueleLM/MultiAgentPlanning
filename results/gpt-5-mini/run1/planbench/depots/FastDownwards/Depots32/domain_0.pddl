(define (domain jack_of_all_trades)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
  )

  (:predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (at_surface ?s - surface ?pl - place)
    (on ?top - surface ?bottom - surface)
    (clear ?s - surface)
    (hoist_available ?h - hoist)
    (hoist_lifts ?h - hoist ?c - crate)
    (in_truck ?c - crate ?tr - truck)
  )

  ;; Drive a truck from one place to another.
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

  ;; Use a hoist to lift a crate from a surface at a place.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (at_surface ?s ?pl)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (at_surface ?c ?pl)
    )
    :effect (and
      (not (at_surface ?c ?pl))
      (hoist_lifts ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (at_surface ?s ?pl)
      (clear ?s)
      (hoist_lifts ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifts ?h ?c))
      (at_surface ?c ?pl)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  ;; Effects assumed to mirror unload: crate becomes in the truck, hoist becomes available, hoist stops lifting, crate no longer at surface/place.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_lifts ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (hoist_lifts ?h ?c))
      (hoist_available ?h)
      (not (at_surface ?c ?pl))
    )
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifts ?h ?c)
      (not (at_surface ?c ?pl))
    )
  )
)