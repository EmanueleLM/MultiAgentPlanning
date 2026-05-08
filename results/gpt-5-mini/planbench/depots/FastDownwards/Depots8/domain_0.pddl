(define (domain depot-hoist-driver)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    location truck pallet surface - place
    hoist crate
  )

  (:predicates
    ; place-location relationships
    (at-place ?p - place ?loc - location)          ; place p is located at location loc

    ; hoist location and status
    (hoist-at ?h - hoist ?loc - location)
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ; crate positions: a crate is on some place (which may be a location, truck, pallet, or surface)
    (crate-at ?c - crate ?p - place)

    ; structural relation: pallet sits on a surface
    (pallet-on-surface ?p - pallet ?s - surface)
  )

  ; DRIVER actions (namespace: driver-*)
  (:action driver-drive
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (at-place ?tr ?from)
    :effect (and
      (not (at-place ?tr ?from))
      (at-place ?tr ?to)
    )
  )

  ; HOIST actions (namespace: hoist-*)
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (hoist-at ?h ?from)
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  (:action hoist-pick
    :parameters (?h - hoist ?c - crate ?p - place ?loc - location)
    :precondition (and
      (hoist-at ?h ?loc)
      (crate-at ?c ?p)
      (at-place ?p ?loc)
      (hoist-free ?h)
    )
    :effect (and
      (not (crate-at ?c ?p))
      (not (hoist-free ?h))
      (hoist-holding ?h ?c)
    )
  )

  ; Place a held crate onto any place (truck, pallet, surface, or location).
  ; Separate actions could be used for different place types; here we provide one general placement
  ; that requires the target place to be co-located with the hoist.
  (:action hoist-place
    :parameters (?h - hoist ?c - crate ?p - place ?loc - location)
    :precondition (and
      (hoist-at ?h ?loc)
      (hoist-holding ?h ?c)
      (at-place ?p ?loc)
      (not (crate-at ?c ?p))
    )
    :effect (and
      (crate-at ?c ?p)
      (hoist-free ?h)
      (not (hoist-holding ?h ?c))
    )
  )
)