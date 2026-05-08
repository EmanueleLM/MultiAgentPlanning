(define (domain jack_of_all_trades)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    object place
    depot distributor - place
    truck hoist - object
    surface - object
    crate pallet - surface
  )

  (:predicates
    (at ?x - object ?p - place)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?tr - truck)
    (on ?c - crate ?s - surface)
    (clear_surface ?s - surface)
    (clear_crate ?c - crate)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to))
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ;; lift a crate from a surface at a place using a hoist
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (available ?h)
      (clear_crate ?c)
      (on ?c ?s)
    )
    :effect (and
      (lifting ?h ?c)
      (clear_surface ?s)
      (not (available ?h))
      (not (at ?c ?p))
      (not (on ?c ?s))
    )
  )

  ;; drop a crate to a surface at a place using a hoist
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear_surface ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (at ?c ?p)
      (clear_crate ?c)
      (on ?c ?s)
      (not (lifting ?h ?c))
      (not (clear_surface ?s))
    )
  )

  ;; load a crate into a truck at a place using a hoist
  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; unload a crate from a truck at a place using a hoist
  (:action unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in ?c ?tr))
      (not (available ?h))
    )
  )
)