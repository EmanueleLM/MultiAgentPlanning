(define (domain hoist_truck_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj place)

  (:predicates
    ;; general location for trucks, hoists, crates, pallets (all are objects of type obj)
    (at ?o - obj ?p - place)

    ;; stacking and containment
    (on ?c - obj ?s - obj)       ;; crate c is on surface s (pallet or crate)
    (in ?c - obj ?t - obj)       ;; crate c is inside truck t

    ;; hoist state
    (hoist_available ?h - obj)           ;; hoist free to start an operation
    (hoist_lifting ?h - obj ?c - obj)    ;; hoist h is currently lifting crate c

    ;; top-of-surface / top-of-crate clearance
    (clear ?x - obj)

    ;; place typing (place type encoded as an object token: kind_depot / kind_distributor)
    (place_type ?p - place ?t - obj)

    ;; connectivity among places (complete connectivity among depots/distributors)
    (connected ?p1 - place ?p2 - place)
  )

  ;; ACTION: hoist lifts a crate off a surface at a place
  (:action hoist_lift
    :parameters (?h - obj ?c - obj ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (clear ?s)
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (hoist_available ?h))
    )
  )

  ;; ACTION: hoist drops a lifting crate onto a clear surface at the same place
  (:action hoist_drop
    :parameters (?h - obj ?c - obj ?s - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; ACTION: hoist places a lifting crate into a co-located truck
  (:action hoist_load_into_truck
    :parameters (?h - obj ?c - obj ?t - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; ACTION: hoist unloads a crate from a co-located truck and starts lifting it
  (:action hoist_unload_from_truck
    :parameters (?h - obj ?c - obj ?t - obj ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in ?c ?t)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (in ?c ?t))
      (not (hoist_available ?h))
    )
  )

  ;; ACTION: drive a truck from one place to another (connectivity and place-type must be in initial state)
  (:action DRIVE
    :parameters (?tr - obj ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )
)