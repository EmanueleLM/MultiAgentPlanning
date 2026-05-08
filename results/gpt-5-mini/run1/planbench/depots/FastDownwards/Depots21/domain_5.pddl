(define (domain hoist-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    crate pallet - surface
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; support / containment
    (on ?c - crate ?s - surface)        ; crate c is placed on surface s
    (in-truck ?c - crate ?tr - truck)  ; crate c is inside truck tr

    ;; hoist state
    (holding ?h - hoist ?c - crate)     ; hoist h is currently holding crate c
    (hoist-free ?h - hoist)             ; hoist h is available

    ;; clearance: surface (pallet or crate) has nothing on top
    (clear ?s - surface)
  )

  ;; Drive a truck between any two places (roads exist between all depots and distributors).
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Lift a crate from a surface at a place using a hoist.
  ;; Removes the on/relation and any explicit at-surface fact for the crate at that place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-free ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (hoist-free ?h))
      (clear ?s)
      (not (at-surface ?c ?p))
    )
  )

  ;; Drop a crate held by a hoist onto a surface at the same place.
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?s)
      (at-surface ?c ?p)
      (hoist-free ?h)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; Load a crate held by a hoist into a truck at the same place.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (holding ?h ?c)
    )
    :effect (and
      (not (holding ?h ?c))
      (in-truck ?c ?tr)
      (hoist-free ?h)
      (clear ?c)
      (not (at-surface ?c ?p))
    )
  )

  ;; Unload a crate from a truck into a hoist at the same place. After this the hoist holds the crate.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-free ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (holding ?h ?c)
      (not (hoist-free ?h))
    )
  )
)