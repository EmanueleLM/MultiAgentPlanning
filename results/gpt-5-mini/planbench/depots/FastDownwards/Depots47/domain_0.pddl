(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types
    place
    placeable
    truck hoist surface - placeable
    crate - surface
  )

  (:predicates
    (at_place ?obj - placeable ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?tr - truck)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_place ?tr ?from)
    :effect (and
      (not (at_place ?tr ?from))
      (at_place ?tr ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_place ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (clear ?s)

      (not (at_place ?c ?p))
      (not (on ?c ?s))
      (not (hoist_available ?h))
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_place ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (at_place ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)

      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  ;; Inferred effects: crate becomes in the truck, hoist becomes available, hoist stops lifting the crate.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_place ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)

      (not (hoist_lifting ?h ?c))
      ;; crate no longer at place or on a surface while in truck: these are already ensured
      ;; by the fact it was hoist_lifting; no explicit on/at_place facts remain for the crate.
    )
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_place ?h ?p)
      (at_place ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (hoist_lifting ?h ?c)

      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
    )
  )
)