(define (domain depots23)
  (:requirements :strips :typing)
  (:types
    place surface
    depot distributor - place
    pallet crate - surface
    truck hoist
  )

  (:predicates
    ;; surfaces (pallets and crates) at places
    (at ?s - surface ?p - place)

    ;; trucks and hoists location
    (at_truck ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)

    ;; stacking / containment
    (on ?c - crate ?b - surface)               ;; crate c is on surface b (pallet or crate)
    (in_truck ?c - crate ?tr - truck)         ;; crate is in truck

    ;; support / resource state
    (clear ?s - surface)                      ;; nothing on surface s
    (hoist_available ?h - hoist)              ;; hoist is free
    (hoist_lifting ?h - hoist ?c - crate)     ;; hoist h is lifting crate c
  )

  ;; drive a truck between any two places (fully connected roads)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?b - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?c ?p)
      (on ?c ?b)
      (at ?b ?p)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?b)
      (not (on ?c ?b))
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?b - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?b ?p)
      (clear ?b)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?b))
      (clear ?c)
      (on ?c ?b)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_truck ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck: hoist begins lifting it (crate removed from truck, hoist becomes busy)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at_truck ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)