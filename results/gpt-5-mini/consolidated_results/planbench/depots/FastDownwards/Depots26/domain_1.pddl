(define (domain transport-hoists-trucks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface depot distributor pallet crate truck hoist
  )

  (:predicates
    ;; Locations
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?tr - truck ?p - place)
    (surface-at ?s - surface ?p - place)    ;; a surface (pallet or crate) is located at a place

    ;; Stacking / containment
    (crate-on ?c - crate ?s - surface)      ;; crate ?c is directly on surface ?s
    (surface-clear ?s - surface)            ;; surface has no crate on top of it
    (crate-clear ?c - crate)                ;; crate used as a surface has no crate on top
    (crate-in-truck ?c - crate ?tr - truck) ;; crate is inside a truck

    ;; Hoist resource state
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; Road connectivity
    (road ?from - place ?to - place)
  )

  ;; Drive a truck along a road (explicit roads provided in problem)
  (:action drive-truck
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

  ;; Hoist lifts a crate from a pallet surface
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?pal ?p)
      (crate-on ?c ?pal)
      (crate-clear ?c)
      (hoist-available ?h)
      (surface-at ?c ?p)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (not (crate-on ?c ?pal))
      (surface-clear ?pal)
      (not (surface-at ?c ?p))
    )
  )

  ;; Hoist lifts a crate from another crate surface
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?surf - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (crate-on ?c ?surf)
      (crate-clear ?c)
      (hoist-available ?h)
      (surface-at ?c ?p)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (not (crate-on ?c ?surf))
      (surface-clear ?surf)
      (crate-clear ?surf)
      (not (surface-at ?c ?p))
    )
  )

  ;; Hoist drops a crate onto a pallet surface
  (:action hoist-drop-onto-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?pal ?p)
      (surface-clear ?pal)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (crate-on ?c ?pal)
      (not (surface-clear ?pal))
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (surface-at ?c ?p)
      (crate-clear ?c)
    )
  )

  ;; Hoist drops a crate onto a crate surface
  (:action hoist-drop-onto-crate
    :parameters (?h - hoist ?c - crate ?surf - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (surface-clear ?surf)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (crate-on ?c ?surf)
      (not (surface-clear ?surf))
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (surface-at ?c ?p)
      (crate-clear ?c)
      (not (crate-clear ?surf))
    )
  )

  ;; Hoist loads a held crate into a co-located truck
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (crate-in-truck ?c ?tr)
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (surface-at ?c ?p))
    )
  )

  ;; Hoist unloads a crate from a truck into hoist's grip (crate is then being held, not at place)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-available ?h)
      (crate-in-truck ?c ?tr)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (crate-in-truck ?c ?tr))
      (not (hoist-available ?h))
    )
  )
)