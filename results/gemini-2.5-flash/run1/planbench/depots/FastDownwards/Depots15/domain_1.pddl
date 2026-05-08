(define (domain depots15)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    depot distributor - place
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    (at ?obj - (or truck hoist crate pallet) ?loc - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (available ?h - hoist)
    (clear ?s - surface) ; a surface is clear if nothing is on it
    (lifting ?h - hoist ?c - crate) ; hoist is lifting a crate
  )

  (:functions
    (total-cost)
  )

  (:action drive-truck
    :parameters (?t - truck ?loc-from - place ?loc-to - place)
    :precondition (and
      (at ?t ?loc-from)
    )
    :effect (and
      (not (at ?t ?loc-from))
      (at ?t ?loc-to)
      (increase (total-cost) 1)
    )
  )

  (:action lift-crate
    :parameters (?h - hoist ?c - crate ?s - surface ?loc - place)
    :precondition (and
      (available ?h)
      (at ?h ?loc)
      (at ?s ?loc) ; the surface must be at the same location as hoist
      (at ?c ?loc) ; the crate must be at the same location
      (on ?c ?s) ; the crate must be on the surface
      (clear ?c) ; nothing is on the crate being lifted
    )
    :effect (and
      (not (available ?h))
      (lifting ?h ?c)
      (not (on ?c ?s))
      (clear ?s) ; the surface the crate was on becomes clear
      (increase (total-cost) 1)
    )
  )

  (:action drop-crate
    :parameters (?h - hoist ?c - crate ?s - surface ?loc - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?loc)
      (at ?s ?loc) ; the surface to drop on must be at the same location
      (clear ?s) ; the surface must be clear to drop a crate on it
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (on ?c ?s)
      (not (clear ?s)) ; the surface becomes not clear
      (clear ?c) ; the dropped crate is now clear (nothing on it)
      (increase (total-cost) 1)
    )
  )

  (:action load-crate
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?loc)
      (at ?t ?loc)
      (at ?c ?loc) ; the crate must be at the location (implicitly held by hoist)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (in ?c ?t)
      (not (at ?c ?loc)) ; crate is now in truck, not 'at' the location directly
      (clear ?c) ; The crate is still clear after being loaded
      (increase (total-cost) 1)
    )
  )

  (:action unload-crate
    :parameters (?h - hoist ?c - crate ?t - truck ?loc - place)
    :precondition (and
      (available ?h)
      (at ?h ?loc)
      (at ?t ?loc)
      (in ?c ?t)
    )
    :effect (and
      (not (available ?h))
      (lifting ?h ?c)
      (not (in ?c ?t))
      (at ?c ?loc) ; crate is now held by hoist at the location
      (increase (total-cost) 1)
    )
  )
)