(define (domain hoist-truck-warehouse)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place
    truck
    hoist
    crate
    support
    slot
  )

  (:predicates
    ;; locations
    (truck-at ?t - truck ?p - place)
    (hoist-at  ?h - hoist  ?p - place)
    (support-at ?s - support ?p - place)
    (crate-at ?c - crate ?p - place)

    ;; stacking / placement
    (on ?c - crate ?s - support)
    (clear-support ?s - support)  ;; true when top of support is free to place a crate
    (clear-crate ?c - crate)      ;; true when nothing stacked on this crate

    ;; hoist state
    (hoist-free ?h - hoist)              ;; hoist available to attach
    (hoist-attached ?h - hoist ?c - crate) ;; hoist hook attached to crate (crate may still be supported)
    (hoist-lifting ?h - hoist ?c - crate)  ;; hoist is lifting / carrying the crate

    ;; truck / cargo and slots
    (truck-open ?t - truck)
    (in-truck ?c - crate ?t - truck)
    (slot-of ?sl - slot ?t - truck)
    (slot-free ?sl - slot)
    (in-slot ?c - crate ?sl - slot)
  )

  ;; DRIVE: move a truck between places (no-op allowed if from == to is not blocked here)
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Truck door actions
  (:action open-truck
    :parameters (?tr - truck ?p - place)
    :precondition (and (truck-at ?tr ?p) (not (truck-open ?tr)))
    :effect (truck-open ?tr)
  )

  (:action close-truck
    :parameters (?tr - truck ?p - place)
    :precondition (and (truck-at ?tr ?p) (truck-open ?tr))
    :effect (and
      (not (truck-open ?tr))
    )
  )

  ;; HOIST ATTACH: attach hook to crate while crate still on support (does not remove on/at)
  (:action hoist-attach
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (on ?c ?s)
      (support-at ?s ?p)
      (clear-crate ?c)
      (hoist-free ?h)
    )
    :effect (and
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
    )
  )

  ;; HOIST RAISE: raise an attached crate clear of its support.
  ;; Keeps hoist-attached and adds hoist-lifting (lifting implies attached)
  (:action hoist-raise
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?p)
      (support-at ?s ?p)
      (on ?c ?s)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      ;; crate is no longer on the support nor on the ground at this place
      (not (on ?c ?s))
      (not (crate-at ?c ?p))
      ;; support becomes clear once crate removed
      (clear-support ?s)
      ;; keep hoist-attached ?h ?c (lifting implies still attached), so do not remove it here
    )
  )

  ;; HOIST MOVE (while free): move hoist when it is free (not holding anything)
  (:action hoist-move-free
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-free ?h)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  ;; HOIST MOVE (while carrying a crate): move hoist and the lifted crate
  (:action hoist-move-lifting
    :parameters (?h - hoist ?c - crate ?from - place ?to - place)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      ;; crate remains represented as being lifted by hoist; no crate-at updates are needed here
    )
  )

  ;; HOIST PLACE: place a lifted crate onto a support at the same place
  (:action hoist-place-on-support
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (support-at ?s ?p)
      (clear-support ?s)
    )
    :effect (and
      ;; crate is placed on support and now has a ground location
      (on ?c ?s)
      (crate-at ?c ?p)
      ;; crate is no longer lifted or attached
      (not (hoist-lifting ?h ?c))
      (not (hoist-attached ?h ?c))
      ;; hoist becomes available again
      (hoist-free ?h)
      ;; support is now not clear (top occupied)
      (not (clear-support ?s))
      ;; crate is top so clear_crate true
      (clear-crate ?c)
    )
  )

  ;; HOIST LOAD INTO TRUCK: take a lifted crate and place it into a free slot inside the truck
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?sl - slot)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (truck-open ?t)
      (hoist-lifting ?h ?c)
      (slot-of ?sl ?t)
      (slot-free ?sl)
    )
    :effect (and
      ;; crate removed from hoist
      (not (hoist-lifting ?h ?c))
      (not (hoist-attached ?h ?c))
      ;; crate is inside truck and occupies the slot
      (in-truck ?c ?t)
      (in-slot ?c ?sl)
      (not (slot-free ?sl))
      ;; hoist becomes free
      (hoist-free ?h)
    )
  )

  ;; HOIST UNLOAD FROM TRUCK: attach to crate inside truck and lift it out (slot freed)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?sl - slot)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (truck-open ?t)
      (in-truck ?c ?t)
      (in-slot ?c ?sl)
      (slot-of ?sl ?t)
      (hoist-free ?h)
    )
    :effect (and
      ;; crate removed from truck and slot freed
      (not (in-truck ?c ?t))
      (not (in-slot ?c ?sl))
      (slot-free ?sl)
      ;; hoist attaches and lifts the crate
      (hoist-attached ?h ?c)
      (hoist-lifting ?h ?c)
      ;; hoist becomes busy (not free)
      (not (hoist-free ?h))
    )
  )

)