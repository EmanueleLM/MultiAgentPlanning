(define (domain depots27)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    support
    pallet truck crate - support
    hoist
  )

  (:predicates
    ;; location / positioning
    (support-at ?s - support ?p - place)    ; support (pallet, truck, crate) is at a place
    (at-hoist ?h - hoist ?p - place)        ; hoist is at a place

    ;; stacking / containment
    (on ?c - crate ?s - support)            ; crate is on a support (pallet, truck, or another crate)
    (clear ?s - support)                    ; the top of this support is clear (no crate on it)

    ;; hoist state
    (hoist-available ?h - hoist)            ; hoist is available for use
    (hoist-holding ?h - hoist ?c - crate)   ; hoist is currently holding crate
  )

  ;; Drive truck between places. Trucks are supports; crates on a truck remain on that truck implicitly.
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (support-at ?t ?from)
    :effect (and
      (not (support-at ?t ?from))
      (support-at ?t ?to)
    )
  )

  ;; Hoist lifts a crate from a support at a place.
  ;; Requires hoist and support at same place, crate on that support, hoist available, and the crate itself clear (nothing on the crate).
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (support-at ?s ?p)
      (on ?c ?s)
      (hoist-available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a held crate onto a support at the same place.
  ;; Requires the target support to be located at the place and to be clear.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - support ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (support-at ?s ?p)
      (hoist-holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (on ?c ?s)
      (hoist-available ?h)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Truck is treated as a support; loading places crate on the truck.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (support-at ?t ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (on ?c ?t)
      (hoist-available ?h)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist (hoist becomes busy/holding).
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (support-at ?t ?p)
      (on ?c ?t)
      (hoist-available ?h)
    )
    :effect (and
      (not (on ?c ?t))
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
    )
  )
)