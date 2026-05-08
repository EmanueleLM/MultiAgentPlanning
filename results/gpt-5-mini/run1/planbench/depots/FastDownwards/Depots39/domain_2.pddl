(define (domain jack_of_all_trades)
  (:requirements :typing)
  (:types
    place truck hoist surface
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at_surface ?c ?p))
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)