(define (domain depots10)
  (:requirements :strips :typing)
  (:types
    entity
    place - entity
    depot distributor - place
    surface - entity
    pallet crate - surface
    truck hoist - entity
  )

  (:predicates
    (at ?e - entity ?p - place)                      ; entity (truck, hoist, pallet, crate) is at place
    (on ?c - crate ?s - surface)                    ; crate is on a surface (pallet or crate)
    (in_truck ?c - crate ?tr - truck)               ; crate is inside a truck
    (clear ?c - crate)                              ; no crate on this crate
    (surface_clear ?s - surface)                    ; surface (pallet) has no crate on it
    (available ?h - hoist)                          ; hoist is available to lift
    (lifting ?h - hoist ?c - crate)                 ; hoist is currently lifting crate
  )

  ;; Drive a truck from one place to another (trucks may drive between any two places)
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (surface_clear ?s)
    )
  )

  ;; Hoist drops a crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (surface_clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
      (not (lifting ?h ?c))
      (not (surface_clear ?s))
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck (hoist must be available and co-located with truck)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
    )
  )
)