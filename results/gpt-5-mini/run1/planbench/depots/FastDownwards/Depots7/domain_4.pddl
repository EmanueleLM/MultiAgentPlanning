(define (domain depots7)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    support
    crate - support
    pallet - support
    hoist
    truck
  )

  (:predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (support_at ?s - support ?pl - place)

    ;; stacking and occupancy
    (on ?c - crate ?s - support)
    (clear_support ?s - support)  ;; true when nothing is on this support
    (clear_crate ?c - crate)      ;; true when nothing is on this crate

    ;; truck contents
    (in_truck ?c - crate ?tr - truck)

    ;; hoist resources
    (hoist_available ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  ;; drive a truck between places (roads exist between any two places)
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
      (clear_crate ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (holding ?h ?c)
      (not (hoist_available ?h))
      (clear_support ?s)
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
      (not (clear_support ?s))
      (clear_crate ?c)
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
    )
  )

  ;; unload a crate from a truck: hoist starts available, then becomes unavailable and holds the crate
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