(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    surface - object
    depot distributor - place
    pallet crate - surface
    truck - object
    hoist - object
  )

  (:predicates
    (at ?o - (either truck hoist crate pallet) ?p - place)
    (in ?c - crate ?t - truck)
    (on ?c - crate ?s - surface)
    (clear ?s - surface) ; Indicates nothing is currently on this surface
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c) ; The crate must not have anything on it to be lifted
    )
    :effect (and
      (not (at ?c ?p)) ; Crate is no longer on the ground at the place
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface the crate was on becomes clear
      (not (on ?c ?s))
      ; (not (clear ?c)) was removed because a lifted crate is still "clear" (nothing is on it).
    )
  )

  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s) ; The target surface must be clear to drop a crate on it
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p) ; Crate is now placed at the place
      (not (clear ?s)) ; The target surface is no longer clear
      (clear ?c) ; Crate is now on top, so it is clear (nothing on it)
      (on ?c ?s)
    )
  )

  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (in ?c ?t)
      ; The crate's 'at' predicate remains false because it is now inside the truck,
      ; whose location defines the crate's location.
    )
  )

  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (available ?h) ; The human spec says "hoist is available" for unload.
      (in ?c ?t)
      (at ?t ?p)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      ; The crate is now being lifted by the hoist, so its 'at' predicate remains false.
    )
  )
)