(define (domain depots31)
  (:requirements :strips :typing)
  (:types depot distributor - place
          pallet crate - surface
          place surface truck hoist)

  (:predicates
    ;; location predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)

    ;; support / availability predicates
    (clear_surface ?s - surface)
    (clear_crate ?c - crate)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
  )

  ;; drive a truck from one place to another (roads exist between any two places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear_crate ?c)
      (at_surface ?c ?p)
    )
    :effect (and
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
      (clear_surface ?s)
      ;; crate is being held, so it is not considered on any surface/place
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear_surface ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (at_surface ?c ?p)
      (on ?c ?s)
      (not (clear_surface ?s))
      (clear_crate ?c)
    )
  )

  ;; hoist loads a crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
  )

  ;; hoist unloads a crate from a truck at a place
  (:action hoist_unload_from_truck
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