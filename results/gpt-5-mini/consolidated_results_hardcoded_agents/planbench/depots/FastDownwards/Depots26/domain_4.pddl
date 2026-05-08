(define (domain transport-hoists-trucks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface truck hoist stage
    depot distributor - place
    pallet crate - surface
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

    ;; road connectivity (explicit in problem)
    (road ?from - place ?to - place)

    ;; discrete time / stages (global sequential clock)
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
  ;; Requires hoist available, crate clear, surface and hoist co-located.
  ;; Effects: hoist holds crate, hoist not available, crate no longer on surface,
  ;; the surface becomes clear, crate is not recorded as located at the place (it is 'in-hand'),
  ;; and global stage advances.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?t - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (on ?c ?surf)
      (clear ?c)
      (hoist-available ?h)
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
  ;; Effects: crate is placed on surface, surface no longer clear, crate becomes a surface at place,
  ;; crate is clear (top), hoist becomes available and stops holding crate, and stage advances.
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
  ;; Effects: crate is in the truck, hoist becomes available and no longer holds the crate,
  ;; crate no longer recorded at the place as a surface, and stage advances.
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
  ;; Effects: crate removed from truck, hoist holds crate and becomes unavailable, and stage advances.
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