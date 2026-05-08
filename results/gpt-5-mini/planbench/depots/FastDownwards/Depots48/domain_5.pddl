(define (domain depots48)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    entity
      surface - entity
        crate pallet - surface
      device - entity
        truck hoist - device
  )

  (:predicates
    (at ?e - entity ?p - place)                ; entity (device or surface) is at a place
    (on ?c - crate ?s - surface)               ; crate is directly on a surface (crate or pallet)
    (in ?c - crate ?tr - truck)                ; crate is inside a truck
    (clear ?s - surface)                       ; surface (crate or pallet) has nothing on top
    (hoist_available ?h - hoist)               ; hoist is free to use
    (hoist_holding ?h - hoist ?c - crate)      ; hoist is currently holding crate
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)
    )
  )

  (:action drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      (not (clear ?s))
    )
  )

  (:action load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (hoist_available ?h)
      (not (hoist_holding ?h ?c))
      (not (at ?c ?p))
    )
  )

  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (hoist_holding ?h ?c)
      (not (in ?c ?tr))
      (not (hoist_available ?h))
    )
  )
)