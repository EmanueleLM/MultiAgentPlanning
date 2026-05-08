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
    ;; location predicates
    (truck_at ?tr - truck ?pl - place)
    (hoist_at ?h - hoist ?pl - place)
    (support_at ?s - support ?pl - place) ; a support (pallet or crate) is at a place

    ;; stacking / containment / resource predicates
    (on ?c - crate ?s - support)           ; crate is directly on a support (pallet or crate)
    (clear ?s - support)                   ; nothing on top of this support
    (in_truck ?c - crate ?tr - truck)      ; crate inside a truck
    (hoist_available ?h - hoist)           ; hoist free to use
    (hoist_lifting ?h - hoist ?c - crate)  ; hoist is currently lifting crate
  )

  ;; Drive a truck between places (roads exist between any two places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck_at ?tr ?from)
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a support at a place.
  ;; Preconditions: hoist at same place, hoist available, crate is on support, crate must be clear.
  ;; Effects: crate is removed from the support, hoist becomes busy and lifts the crate,
  ;; the source support becomes clear, and the crate is no longer considered at that place as a support.
  (:action hoist_lift_from_support
    :parameters (?h - hoist ?c - crate ?s - support ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (hoist_available ?h)
      (on ?c ?s)
      (support_at ?s ?pl)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
      (clear ?s)
      ;; when crate is lifted it is not available as a support at that place
      (not (support_at ?c ?pl))
    )
  )

  ;; Hoist drops a lifted crate onto a support at the same place.
  ;; Preconditions: hoist at place, hoist lifting the crate, target support at place and clear.
  ;; Effects: crate placed on support, crate becomes clear, target support becomes not clear,
  ;; hoist becomes available and is no longer lifting the crate, and lifted crate becomes a support at that place.
  (:action hoist_drop_to_support
    :parameters (?h - hoist ?c - crate ?s - support ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (hoist_lifting ?h ?c)
      (support_at ?s ?pl)
      (clear ?s)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
      (support_at ?c ?pl)
    )
  )

  ;; Hoist loads a lifted crate into a truck at the same place.
  ;; Preconditions: hoist at place, truck at place, hoist is lifting the crate.
  ;; Effects: crate becomes inside the truck, hoist becomes available and stops lifting the crate.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (hoist_at ?h ?pl)
      (truck_at ?tr ?pl)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?tr)
      ;; crate is no longer a support at that place
      (not (support_at ?c ?pl))
    )
  )

  ;; Hoist unloads a crate from a truck: hoist must be at same place as truck and be available.
  ;; Effects: crate removed from truck and hoist begins lifting the crate (becomes unavailable).
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
      (hoist_lifting ?h ?c)
    )
  )
)