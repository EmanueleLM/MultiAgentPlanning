(define (domain depots18)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist surface pallet crate)

  (:predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)

    ;; a surface (pallet or crate) is located at a place
    (at ?s - surface ?pl - place)

    ;; stacking: a crate can be on a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; surface (pallet or crate) has nothing on it
    (clear ?s - surface)

    ;; crate is stored inside a truck
    (in_truck ?c - crate ?tr - truck)

    ;; hoist availability and holding relation
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
  )

  ;; drive a truck between places (roads exist between all places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
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
      (at ?s ?pl)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate is removed from the place / surface, hoist holds it and becomes unavailable
      (not (at ?c ?pl))
      (not (on ?c ?s))
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      ;; source surface becomes clear
      (clear ?s)
    )
  )

  ;; hoist drops a held crate onto a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (at ?s ?pl)
      (hoist_holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      (at ?c ?pl)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a held crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (not (at ?c ?pl))
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
    )
  )

  ;; hoist unloads a crate from a truck and holds it
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
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      ;; crate is not considered at the place until dropped on a surface
      (not (at ?c ?pl))
    )
  )
)