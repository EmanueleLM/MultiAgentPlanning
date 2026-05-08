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
    ;; location of movable objects (crates, pallets, trucks, hoists)
    (at ?obj - object ?p - place)

    ;; stacking: crate on top of a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; crate loaded inside a truck
    (in ?c - crate ?tr - truck)

    ;; surface (pallet or crate) has nothing on top of it
    (clear ?s - surface)

    ;; hoist state
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
  ;; Preconditions follow the statement: hoist at place, surface at same place,
  ;; crate is on that surface, hoist available, and crate is clear.
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
      ;; the crate is no longer on the surface nor at the place
      (not (on ?c ?s))
      (not (at ?c ?p))
      ;; the surface becomes clear (crate removed)
      (clear ?s)
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
  ;; Preconditions: hoist & truck at same place, hoist holding the crate.
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
  ;; Preconditions: hoist and truck at same place, hoist available, crate in truck.
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