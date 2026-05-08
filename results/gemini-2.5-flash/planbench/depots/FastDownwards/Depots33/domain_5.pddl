(define (domain depots33)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist truck
  )
  (:predicates
    (at ?obj - (either hoist truck crate pallet) ?loc - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
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
      (at ?c ?p)
      (on ?c ?s) ; Crate must be on the surface to be lifted from it
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p)) ; Crate is no longer at the place, it's lifted
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface it was on becomes clear
      (not (on ?c ?s))
    )
  )

  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; Target surface must be at the same place
      (clear ?s) ; Target surface must be clear to drop onto it
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p) ; Crate is now at the place
      (not (clear ?s)) ; Target surface is no longer clear
      (clear ?c) ; Crate is clear on top (as per spec)
      (on ?c ?s)
    )
  )

  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p)) ; Crate is now in the truck, not at the place
    )
  )

  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (at ?c ?p)) ; Crate is now being lifted, not at the place
    )
  )
)