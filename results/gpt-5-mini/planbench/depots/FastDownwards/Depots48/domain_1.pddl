(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    object
    surface - object
    crate pallet - surface
    truck hoist - object
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?tr - truck)
    (clear ?s - surface)
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
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
      (clear ?s)
      (not (on ?c ?s))
      (not (hoist_available ?h))
      (not (at ?c ?p))
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
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

  ;; Use a hoist to load a crate into a truck at a place.
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

  ;; Use a hoist to unload a crate from a truck at a place.
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