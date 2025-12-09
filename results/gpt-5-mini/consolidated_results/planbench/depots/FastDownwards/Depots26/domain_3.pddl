(define (domain transport-hoists-trucks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    depot distributor - place
    pallet crate - surface
    place surface truck hoist stage
  )

  (:predicates
    ;; location predicates
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?tr - truck ?p - place)
    (surface-at ?s - surface ?p - place)    ;; surface (pallet or crate) located at a place

    ;; stacking / containment
    (on ?c - crate ?s - surface)             ;; crate ?c is directly on surface ?s
    (clear ?s - surface)                     ;; surface has no crate on top
    (in-truck ?c - crate ?tr - truck)        ;; crate is inside a truck

    ;; hoist resource state
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; road connectivity (complete graph provided in problem)
    (road ?from - place ?to - place)

    ;; discrete time / stages
    (current ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Drive a truck along a road (advances the global stage by one successor)
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?t - stage ?t2 - stage)
    :precondition (and
      (truck-at ?tr ?from)
      (road ?from ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist lifts a crate from any surface (pallet or crate) at the same place.
  ;; This makes the hoist hold the crate and marks the hoist unavailable.
  ;; The crate ceases to be on the surface and is no longer located at the place
  ;; until it is placed or loaded into a truck.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?t - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (on ?c ?surf)
      (clear ?c)
      (hoist-available ?h)
      ;; crate must be known to be located at this place as a surface-object
      (surface-at ?c ?p)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (not (on ?c ?surf))
      (clear ?surf)
      (not (surface-at ?c ?p))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist drops a held crate onto any clear surface at the same place.
  ;; After drop: crate is on the surface, surface is not clear, crate is located at place, crate is clear (top).
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?t - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (clear ?surf)
      (hoist-holding ?h ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?c ?surf)
      (not (clear ?surf))
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (surface-at ?c ?p)
      (clear ?c)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist loads a held crate into a co-located truck.
  ;; After load: crate is in the truck, hoist becomes available and no longer holds the crate,
  ;; and the crate is not located at the place as a surface while inside the truck.
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-holding ?h ?c)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (in-truck ?c ?tr)
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (surface-at ?c ?p))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist's grip (crate not yet on a surface).
  ;; After unload: crate is no longer in the truck, the hoist holds the crate and becomes unavailable.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?t - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-available ?h)
      (in-truck ?c ?tr)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (not (current ?t))
      (current ?t2)
    )
  )
)