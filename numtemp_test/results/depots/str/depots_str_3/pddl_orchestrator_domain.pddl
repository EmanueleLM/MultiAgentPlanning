(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :equality)
  (:types place truck hoist surface pallet crate)

  ;; Predicates
  (:predicates
    (truck-at ?tr - truck ?pl - place)
    (hoist-at ?h - hoist ?pl - place)
    (surface-at ?s - surface ?pl - place)            ; a pallet or crate is at a place
    (on ?c - crate ?s - surface)                      ; crate c is on surface s (crate or pallet)
    (in ?c - crate ?tr - truck)                       ; crate is inside a truck
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
    (clear ?s - surface)                              ; no crate on top of this surface
  )

  ;; Truck action: move between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Hoist actions (hoists are fixed in place; they operate at their hoist-at place)
  ;; 1)