(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types place pallet crate hoist truck)

  (:predicates
    ;; location predicates
    (pallet_at ?p - pallet ?pl - place)
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; crate location and containment
    (crate_at ?c - crate ?pl - place)   ;; crate is at a place (when on a surface at that place or when placed there)
    (on_pallet ?c - crate ?p - pallet)
    (on_crate ?c - crate ?s - crate)
    (in_truck ?c - crate ?tr - truck)

    ;; surface clearance predicates
    (clear_crate ?c - crate)
    (clear_pallet ?p - pallet)
  )

  ;; drive a truck between places (roads exist between any two places in this instance)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (truck_at ?tr ?from))
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a pallet at a place
  (:action lift_from_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (pallet_at ?p ?pl)
      (crate_at ?c ?pl)
      (on_pallet ?c ?p)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (on_pallet ?c ?p))
      (not (crate_at ?c ?pl))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      ;; pallet becomes available (top is clear)
      (clear_pallet ?p)
    )
  )

  ;; hoist lifts a crate from another crate at a place
  (:action lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (crate_at ?s ?pl)
      (on_crate ?c ?s)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (not (on_crate ?c ?s))
      (not (crate_at ?c ?pl))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      ;; the supporting crate becomes clear on top
      (clear_crate ?s)
    )
  )

  ;; hoist drops a lifted crate onto a pallet at a place
  (:action drop_to_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?pl - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (hoist_at ?h ?pl)
      (pallet_at ?p ?pl)
      (clear_pallet ?p)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (on_pallet ?c ?p)
      (crate_at ?c ?pl)
      (not (clear_pallet ?p))
      ;; placed crate has nothing on top
      (clear_crate ?c)
    )
  )

  ;; hoist drops a lifted crate onto another crate at a place
  (:action drop_to_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?pl - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (hoist_at ?h ?pl)
      (crate_at ?s ?pl)
      (clear_crate ?s)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (on_crate ?c ?s)
      (crate_at ?c ?pl)
      (not (clear_crate ?s))
      (clear_crate ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?tr)
      ;; crate is no longer at the place while in truck
      (not (crate_at ?c ?pl))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy and lifts the crate)
  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_available ?h)
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
      ;; crate is not at the place while hoist is lifting it
      (not (crate_at ?c ?pl))
    )
  )
)