(define (domain depots39)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    depot distributor - place
    pallet crate - surface
    truck
    hoist
  )
  (:predicates
    (at ?obj - (either crate truck hoist pallet) ?loc - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (in ?c - crate ?t - truck)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (not (at ?t ?to)) ; Prevents driving to the same exact location, ensuring actual movement.
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
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p)) ; Crate is no longer directly 'at' the place, it's lifted.
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface the crate was on is now clear
    )
  )

  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; The surface must be at the same place
      (clear ?s) ; Target surface must be clear
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at ?c ?p) ; Crate is now directly 'at' the place again
      (not (clear ?s)) ; Target surface is no longer clear
      (clear ?c) ; Crate itself is clear after being dropped
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
      (not (lifting ?h ?c)) ; Hoist stops lifting
      (available ?h)         ; Hoist becomes available
      (in ?c ?t)             ; Crate is now in the truck
      ; (at ?c ?p) is implicitly false as (lifting ?h ?c) was true
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
      ; (at ?c ?p) is implicitly false as (lifting ?h ?c) becomes true
    )
  )
)