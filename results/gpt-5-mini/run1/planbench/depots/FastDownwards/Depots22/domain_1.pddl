(define (domain depots-hoist)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; locations
    (truck-at ?tr ?p)
    (hoist-at ?h ?p)
    (at ?obj ?p)           ;; pallets and crates at place

    ;; stacking and surfaces
    (on ?top ?bottom)      ;; ?top (crate) is on ?bottom (pallet or crate)
    (clear ?x)             ;; nothing on top of x (x can be crate or pallet)

    ;; hoist state
    (available ?h)         ;; hoist is free to start a lift/unload
    (lifting ?h ?c)        ;; hoist h is currently lifting crate c

    ;; truck stowage
    (in-truck ?c ?t)       ;; crate c is stowed in truck t
  )

  ;; drive a truck from one place to another
  (:action drive-truck
    :parameters (?tr ?from ?to)
    :precondition (and
      (truck-at ?tr ?from)
      (not (truck-at ?tr ?to))
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  ;; requires the hoist to be at the place, the hoist available, the crate clear,
  ;; the crate to be at the place and on the specified surface which is also at the place.
  (:action hoist-lift
    :parameters (?h ?c ?surf ?p)
    :precondition (and
      (hoist-at ?h ?p)
      (available ?h)
      (clear ?c)
      (at ?c ?p)
      (on ?c ?surf)
      (at ?surf ?p)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?surf)
      (not (on ?c ?surf))
    )
  )

  ;; hoist drops a crate from the hoist onto a surface at the same place
  (:action hoist-drop
    :parameters (?h ?c ?surf ?p)
    :precondition (and
      (hoist-at ?h ?p)
      (at ?surf ?p)
      (clear ?surf)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?surf))
      (on ?c ?surf)
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  ;; after this, the crate is in the truck and removed from the place; the hoist becomes available.
  (:action hoist-load
    :parameters (?h ?c ?t ?p)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (not (at ?c ?p))
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy holding the crate)
  ;; the crate is removed from the truck but not yet placed on any surface; a subsequent hoist-drop is required.
  (:action hoist-unload
    :parameters (?h ?c ?t ?p)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)