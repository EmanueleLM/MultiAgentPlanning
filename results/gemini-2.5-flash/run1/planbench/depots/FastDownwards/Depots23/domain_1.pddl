(define (domain depots23_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    object_at_location ; Supertype for anything that can have an 'at' location
    truck hoist - object_at_location
    surface - object_at_location ; Pallets and crates are also objects at locations
    pallet crate - surface ; Pallets and crates are surfaces
  )

  (:predicates
    (at ?obj - object_at_location ?loc - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another place.
  (:action drive
    :parameters (?t - truck ?from ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c) ; The crate itself must be clear to be lifted
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p)) ; Crate is no longer at the place, it's being lifted
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface it was lifted from becomes clear
      (not (on ?c ?s))
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; The target surface must be at the same place
      (clear ?s) ; The target surface must be clear to drop onto
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p) ; Crate is now at the place, resting on the surface
      (not (clear ?s)) ; The surface is no longer clear
      (clear ?c) ; The crate just dropped is now clear (nothing on it)
      (on ?c ?s)
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c) ; Hoist must be lifting the crate
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      ;; Crate is no longer being lifted, it's in the truck.
      ;; It does not return to (at ?c ?p) state, as it's inside the truck.
    )
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h) ; Hoist must be available to perform unload
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c) ; Hoist is now lifting the crate out of the truck
      ;; Crate is not at ?p yet, it's being lifted.
    )
  )
)