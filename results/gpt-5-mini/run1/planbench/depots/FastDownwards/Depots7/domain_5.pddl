(define (domain depots7)
  (:requirements :strips :typing)
  (:types
    place
    support
    pallet - support
    crate - support
    hoist
    truck
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (support_at ?s - support ?pl - place)

    ;; stacking and occupancy (support covers pallets and crates)
    (on ?c - crate ?s - support)      ;; crate c is directly on support s
    (clear_support ?s - support)      ;; true if nothing is on support s

    ;; truck contents
    (in_truck ?c - crate ?tr - truck)

    ;; hoist resource state
    (hoist_available ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  ;; drive a truck between any two places (roads exist between any two places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a support at the same place
  (:action hoist_lift_from_support
    :parameters (?h - hoist ?c - crate ?s - support ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (support_at ?s ?pl)
      (on ?c ?s)
      (hoist_available ?h)
      (clear_support ?c)    ;; crate c must have nothing on it
    )
    :effect (and
      (not (on ?c ?s))
      (not (support_at ?c ?pl))  ;; crate no longer considered at place while held
      (holding ?h ?c)
      (not (hoist_available ?h))
      (clear_support ?s)         ;; source support becomes clear
    )
  )

  ;; hoist drops a held crate onto a support at same place
  (:action hoist_drop_to_support
    :parameters (?h - hoist ?c - crate ?s - support ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (support_at ?s ?pl)
      (holding ?h ?c)
      (clear_support ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (hoist_available ?h)
      (on ?c ?s)
      (support_at ?c ?pl)        ;; crate c is now at the place (as a support for others)
      (not (clear_support ?s))   ;; target support becomes occupied
      (clear_support ?c)         ;; the placed crate has nothing on it
    )
  )

  ;; load a held crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (holding ?h ?c)
    )
    :effect (and
      (not (holding ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?tr)
      (not (support_at ?c ?pl)) ;; crate no longer at place once loaded (defensive delete)
    )
  )

  ;; unload a crate from a truck: hoist becomes unavailable and holds the crate
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (holding ?h ?c)
    )
  )
)