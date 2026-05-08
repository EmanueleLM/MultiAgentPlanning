(define (domain depots30)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    locatable
    truck hoist surface - locatable
    pallet crate - surface
    place
    depot distributor - place
  )
  (:predicates
    (at ?obj - locatable ?loc - place)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
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
      (at ?s ?p) ; All must be at the same place
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p)) ; Crate is no longer at the place, it's lifted
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface the crate was on is now clear
      (not (on ?c ?s))
    )
  )

  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; Hoist and target surface must be at the same place
      (clear ?s) ; Target surface must be clear
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p) ; Crate is now at the place
      (not (clear ?s)) ; Target surface is no longer clear
      (clear ?c) ; The dropped crate's top is clear
      (on ?c ?s)
    )
  )

  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p) ; Hoist and truck must be at the same place
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in ?c ?t) ; Crate is now in the truck
      (not (at ?c ?p)) ; Crate is no longer at the place, it's in the truck
    )
  )

  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p) ; Hoist and truck must be at the same place
      (available ?h) ; Hoist must be available to perform the unload
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c) ; Hoist is now lifting the crate
    )
  )
)