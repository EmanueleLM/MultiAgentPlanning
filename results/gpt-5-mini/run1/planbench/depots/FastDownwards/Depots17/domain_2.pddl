(define (domain depots-hoist-truck)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; locations
    (at-crate ?c ?l)     ;; crate ?c is at place ?l
    (at-pallet ?p ?l)    ;; pallet ?p is at place ?l
    (at-hoist ?h ?l)     ;; hoist ?h is at place ?l
    (at-truck ?tr ?l)    ;; truck ?tr is at place ?l

    ;; stacking / containment
    (on ?c ?s)           ;; crate ?c is on surface ?s (pallet or crate)
    (in-truck ?c ?tr)    ;; crate ?c is in/on truck ?tr

    ;; hoist state
    (holding ?h ?c)      ;; hoist ?h is holding crate ?c
    (available ?h)       ;; hoist ?h is available

    ;; surface top status
    (clear ?s)           ;; surface ?s (pallet or crate) has nothing on top
  )

  ;; Truck drives between any two places (roads fully connected).
  (:action truck-drive
    :parameters (?tr ?from ?to)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist moves between places, only when available.
  (:action hoist-move
    :parameters (?h ?from ?to)
    :precondition (and (available ?h) (at-hoist ?h ?from))
    :effect (and
      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
    )
  )

  ;; Hoist picks a crate that is on a pallet.
  (:action hoist-pick-from-pallet
    :parameters (?h ?c ?p ?loc)
    :precondition (and
      (available ?h)
      (at-hoist ?h ?loc)
      (at-pallet ?p ?loc)
      (on ?c ?p)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?p))
      (not (at-crate ?c ?loc))
      (holding ?h ?c)
      (not (available ?h))
      (clear ?p)
    )
  )

  ;; Hoist picks a crate that is on another crate.
  (:action hoist-pick-from-crate
    :parameters (?h ?c ?s ?loc)
    :precondition (and
      (available ?h)
      (at-hoist ?h ?loc)
      (on ?c ?s)
      (at-crate ?s ?loc)
      (at-crate ?c ?loc)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at-crate ?c ?loc))
      (holding ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; Hoist places a held crate onto a pallet at the same place.
  (:action hoist-place-on-pallet
    :parameters (?h ?c ?p ?loc)
    :precondition (and
      (holding ?h ?c)
      (at-hoist ?h ?loc)
      (at-pallet ?p ?loc)
      (clear ?p)
    )
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?p)
      (at-crate ?c ?loc)
      (available ?h)
      (not (clear ?p))
      (clear ?c)
    )
  )

  ;; Hoist places a held crate onto another crate at the same place.
  (:action hoist-place-on-crate
    :parameters (?h ?c ?s ?loc)
    :precondition (and
      (holding ?h ?c)
      (at-hoist ?h ?loc)
      (at-crate ?s ?loc)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?s)
      (at-crate ?c ?loc)
      (available ?h)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a held crate into a truck (truck at same place).
  (:action hoist-load-to-truck
    :parameters (?h ?c ?tr ?loc)
    :precondition (and
      (holding ?h ?c)
      (at-hoist ?h ?loc)
      (at-truck ?tr ?loc)
    )
    :effect (and
      (not (holding ?h ?c))
      (in-truck ?c ?tr)
      (available ?h)
      (not (at-crate ?c ?loc))
    )
  )

  ;; Hoist unloads a crate from a truck and holds it (hoist becomes busy).
  (:action hoist-unload-from-truck
    :parameters (?h ?c ?tr ?loc)
    :precondition (and
      (available ?h)
      (at-hoist ?h ?loc)
      (at-truck ?tr ?loc)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (holding ?h ?c)
      (not (available ?h))
    )
  )
)