(define (domain depots-hoist-truck)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist truck
  )

  (:predicates
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?t - truck ?p - place)
    (surface-at ?s - surface ?p - place)        ; surface (pallet or crate) is located at place
    (on ?c - crate ?s - surface)                ; crate c is directly on surface s
    (in-truck ?c - crate ?t - truck)            ; crate c is inside truck t
    (hoist-lifting ?h - hoist ?c - crate)       ; hoist h is currently lifting crate c
    (hoist-available ?h - hoist)                ; hoist h is idle and available to lift
    (clear ?s - surface)                        ; surface (pallet or crate) has no crate on top
    (road ?p - place ?q - place)                ; connectivity (explicit in problem)
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)         ; the supporting surface is at the place
      (surface-at ?c ?p)         ; the crate itself is at the place
      (on ?c ?s)                 ; crate is on that surface
      (clear ?c)                 ; crate has nothing on top
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (not (on ?c ?s))
      (not (surface-at ?c ?p))
      (clear ?s)                 ; supporting surface becomes clear
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (hoist-lifting ?h ?c)
      (surface-at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (surface-at ?c ?p)
      (hoist-available ?h)
      (clear ?c)
      (not (hoist-lifting ?h ?c))
      (not (clear ?s))
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (surface-at ?c ?p))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (in-truck ?c ?t)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (not (in-truck ?c ?t))
      (not (hoist-available ?h))
      (surface-at ?c ?p)        ; crate is now located at the place (held by hoist)
    )
  )
)