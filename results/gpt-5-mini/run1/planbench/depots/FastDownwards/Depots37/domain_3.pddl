(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    object
    truck hoist surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?tr - truck)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  ;; lift a crate from a surface at a place using a hoist
  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?s)
    )
  )

  ;; drop a lifted crate to a surface at a place using a hoist
  (:action drop_to_surface
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

  ;; load a lifted crate into a truck at a place using a hoist
  (:action load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in_truck ?c ?tr)
    )
  )

  ;; unload a crate from a truck using a hoist at the truck's place
  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)