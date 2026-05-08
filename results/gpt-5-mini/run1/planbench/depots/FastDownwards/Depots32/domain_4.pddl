(define (domain depots_instance)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (surface_at ?s - surface ?pl - place)  ;; surface (pallet or crate) is at a place
    (on ?top - surface ?bottom - surface)  ;; stacking: top surface is on bottom surface
    (clear ?s - surface)                   ;; top surface has nothing on it
    (hoist_available ?h - hoist)
    (hoist_lifts ?h - hoist ?c - crate)    ;; hoist currently lifting crate
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between places (roads exist between any places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (surface_at ?s ?pl)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (surface_at ?c ?pl))
      (hoist_lifts ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (surface_at ?s ?pl)
      (clear ?s)
      (hoist_lifts ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifts ?h ?c))
      (surface_at ?c ?pl)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
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
      (not (surface_at ?c ?pl))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy lifting it)
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
      (not (surface_at ?c ?pl))
    )
  )
)