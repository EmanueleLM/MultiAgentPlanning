(define (domain depots18)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist surface)

  (:predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (surface_at ?s - surface ?pl - place)

    (on ?c - surface ?s - surface)
    (clear ?s - surface)
    (in_truck ?c - surface ?tr - truck)

    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - surface)
  )

  ;; drive a truck between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate/surface from another surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - surface ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (surface_at ?s ?pl)
      (surface_at ?c ?pl)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (surface_at ?c ?pl))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; hoist drops held item onto a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - surface ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (surface_at ?s ?pl)
      (hoist_holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      (surface_at ?c ?pl)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads held item into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - surface ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (surface_at ?c ?pl))
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; hoist unloads an item from a truck and holds it
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - surface ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (not (surface_at ?c ?pl))
    )
  )
)