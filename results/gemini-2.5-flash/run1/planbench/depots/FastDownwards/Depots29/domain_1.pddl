(define (domain depots29)
  (:requirements :strips :typing :action-costs)
  (:types
    place
    surface
    depot distributor - place
    pallet crate - surface
  )
  (:predicates
    (at ?o - (or truck hoist crate) ?p - place) ; object (truck, hoist, or grounded crate) is at place
    (on ?c - crate ?s - surface) ; crate is on surface
    (in ?c - crate ?t - truck) ; crate is in truck
    (lifting ?h - hoist ?c - crate) ; hoist is lifting crate
    (available ?h - hoist) ; hoist is available
    (clear ?s - surface) ; surface (pallet or crate) is clear (nothing on top)
  )
  (:functions
    (total-cost)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (increase (total-cost) 1)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p) ; Crate must be grounded at the place to be lifted
      (available ?h)
      (clear ?c) ; Nothing on top of the crate to be lifted
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p)) ; Crate is no longer grounded at the place
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface it was on is now clear
      (not (on ?c ?s))
      (increase (total-cost) 1)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p) ; Target surface must be at the place
      (clear ?s) ; Target surface must be clear
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p) ; Crate is now grounded at the place
      (not (clear ?s)) ; Surface is no longer clear
      (clear ?c) ; Crate itself is clear (nothing on top of it)
      (on ?c ?s)
      (increase (total-cost) 1)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?truck - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?truck ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?truck)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p)) ; Crate is no longer grounded at the place
      (clear ?c) ; Crate is clear inside the truck
      (increase (total-cost) 1)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?truck - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?truck ?p)
      (available ?h) ; Hoist must be available to pick up from truck
      (in ?c ?truck)
    )
    :effect (and
      (not (in ?c ?truck))
      (not (available ?h))
      (lifting ?h ?c)
      (increase (total-cost) 1)
    )
  )
)