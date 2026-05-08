(define (domain logistics_stacking)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    ;; surfaces (pallets and crates) have a location when they are resting / not held / not inside a truck
    (at ?s - surface ?p - place)

    ;; stacking and containment
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?tr - truck)

    ;; surface/top free marker (applies to pallets and crates)
    (clear ?s - surface)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; ground connectivity for driving (grounded in the problem)
    (adjacent ?p1 - place ?p2 - place)
  )

  ;; Drive a truck between adjacent places.
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at-truck ?tr ?from) (adjacent ?from ?to))
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a supporting surface at a place.
  ;; Preconditions:
  ;;  - hoist and supporting surface are at the same place,
  ;;  - crate is on that surface,
  ;;  - hoist is available,
  ;;  - crate top is clear (it can be lifted).
  ;; Effects:
  ;;  - hoist holds the crate and becomes unavailable,
  ;;  - crate is removed from the supporting surface and removed from being located at the place,
  ;;  - supporting surface becomes clear (its top freed),
  ;;  - crate is not clear (being held; cannot support others).
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist-available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (not (at ?c ?p))
      (clear ?s)
      (not (clear ?c))
    )
  )

  ;; Hoist drops a held crate onto a clear supporting surface at the same place.
  ;; Effects:
  ;;  - hoist becomes available and no longer holds the crate,
  ;;  - crate is placed at the place and on the surface,
  ;;  - crate top becomes clear, supporting surface becomes not clear.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-holding ?h ?c)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; Hoist loads a held crate into a truck at the same place.
  ;; Preconditions: hoist and truck at place, hoist holding the crate.
  ;; Effects: crate is placed inside the truck, hoist becomes available, hoist no longer holds the crate,
  ;; and crate is no longer recorded at the place or on any surface.
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (at ?c ?p))
      ;; ensure crate no longer recorded as on any surface (it was held)
      (not (clear ?c)) ;; while in-transfer/settle semantics keep crate not-clear until explicitly dropped
    )
  )

  ;; Hoist unloads a crate from a truck at the same place and begins holding it.
  ;; Preconditions: hoist and truck at place, hoist available, crate in the truck.
  ;; Effects: hoist holds the crate, crate removed from truck, hoist becomes unavailable,
  ;; crate is not at place while being held and not clear.
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (not (at ?c ?p))
      (not (clear ?c))
    )
  )
)