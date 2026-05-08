(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types
    object place
    depot distributor - place
    hoist truck - object
    surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (clear ?s)
      (not (at ?c ?p))
      (not (hoist_available ?h))
      (not (on ?c ?s))
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  ;; Note: The problem statement provides preconditions but omits postconditions.
  ;; Effects are intentionally left empty to preserve the original specification.
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and)
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
    )
  )
)