(define (domain depots-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate pallet surface)

  (:predicates
    ;; locations
    (truck-at ?tr - truck ?p - place)
    (hoist-at  ?h - hoist  ?p - place)
    (at        ?s - surface ?p - place)      ;; surface (pallet or crate) at place

    ;; stacking and surfaces
    (on    ?top - crate ?bottom - surface)   ;; top crate is on bottom surface (crate or pallet)
    (clear ?s - surface)                     ;; nothing on top of surface (pallet or crate)

    ;; hoist state
    (available ?h - hoist)                   ;; hoist free to start lift/unload
    (lifting   ?h - hoist ?c - crate)        ;; hoist h is holding crate c

    ;; truck stowage
    (in-truck ?c - crate ?t - truck)         ;; crate is stowed in truck
  )

  ;; drive a truck from one place to another
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
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
  ;; requires the hoist to be at the place, available, crate clear,
  ;; crate at place and on the specified surface which is at the same place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (available ?h)
      (clear ?c)
      (at ?c ?p)
      (on ?c ?surf)
      (at ?surf ?p)
    )
    :effect (and
      ;; crate is no longer at the place and not on the surface; hoist holds it and becomes busy;
      (not (at ?c ?p))
      (not (on ?c ?surf))
      (lifting ?h ?c)
      (not (available ?h))
      ;; the surface from which crate was lifted becomes clear
      (clear ?surf)
    )
  )

  ;; hoist drops a crate from the hoist onto a surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place)
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
  ;; crate is placed into the truck; hoist releases the crate and becomes available.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (not (at ?c ?p))       ;; crate no longer at place while in truck
      (available ?h)
      (not (lifting ?h ?c))
      ;; crate in truck is not on any surface (clear predicate about surfaces remains as previously set)
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy holding the crate)
  ;; crate is removed from the truck and held by the hoist; it is not yet at the place until a drop.
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
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
      (not (at ?c ?p))    ;; crate not at place until dropped
    )
  )
)