(define (domain jack_of_all_trades_instance)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place object
    depot distributor - place
    hoist truck - object
    surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  ;; Drive a truck from one place to another.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Use a hoist to lift a crate from a surface at a place.
  ;; Preconditions: hoist and surface at same place, crate on surface, crate clear, hoist available.
  ;; Effects: crate no longer on surface, crate not at place, hoist lifting crate, hoist not available, surface becomes clear.
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; Use a hoist to drop a crate to a surface at a place.
  ;; Preconditions: hoist and surface at same place, hoist lifting crate, surface clear.
  ;; Effects: hoist becomes available, stops lifting, crate at place, crate on surface, surface not clear, crate clear.
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Use a hoist to load a crate into a truck at a place.
  ;; Preconditions: hoist and truck at same place, hoist lifting crate.
  ;; Effects: crate becomes in truck, hoist stops lifting and becomes available, crate not at place.
  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at ?c ?p))
    )
  )

  ;; Use a hoist to unload a crate from a truck at a place.
  ;; Preconditions: hoist and truck at same place, hoist available, crate in truck.
  ;; Effects: crate not in truck, hoist becomes not available, hoist lifting crate.
  (:action unload
    :parameters (?h - hoist ?tr - truck ?c - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )

)