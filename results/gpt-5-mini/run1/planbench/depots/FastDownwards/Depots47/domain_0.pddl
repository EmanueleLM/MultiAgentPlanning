(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface depot distributor pallet crate hoist truck
  )
  (:predicates
    (at ?x - (either truck hoist surface) ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (hoist_available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (clear ?s)
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (hoist_available ?h))
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  ;; Effects inferred (minimal completion): crate becomes in truck, hoist becomes available, lifting ends, crate no longer at place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist begins lifting the crate)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (lifting ?h ?c)
      (not (hoist_available ?h))
    )
  )
)