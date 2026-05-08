(define (domain depots23)
  (:requirements :strips :typing)
  (:types place depot distributor
          surface pallet crate
          truck hoist)
  (:predicates
    ; location predicates
    (at ?s - surface ?p - place)               ; surface (pallet or crate) is at place
    (at_truck ?t - truck ?p - place)           ; truck is at place
    (hoist_at ?h - hoist ?p - place)           ; hoist is at place

    ; stacking / containment
    (on ?c - crate ?b - surface)               ; crate c is on surface b (pallet or crate)
    (in_truck ?c - crate ?t - truck)           ; crate is in truck

    ; support / resource state
    (clear ?s - surface)                       ; surface (pallet or crate) has nothing on it
    (hoist_available ?h - hoist)               ; hoist is available (not holding anything)
    (hoist_lifting ?h - hoist ?c - crate)      ; hoist is currently lifting crate
  )

  ; drive truck from one place to another (fully connected roads)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ; hoist lifts a crate from a surface at a place
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
      (not (at ?c ?p))           ; crate not considered at place while lifted
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?b)                 ; surface becomes clear after removing crate
      (not (on ?c ?b))
    )
  )

  ; hoist drops a crate to a surface at a place
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

  ; hoist loads a lifted crate into a truck at a place
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

  ; hoist unloads a crate from a truck: hoist begins lifting it (crate not at place until dropped)
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