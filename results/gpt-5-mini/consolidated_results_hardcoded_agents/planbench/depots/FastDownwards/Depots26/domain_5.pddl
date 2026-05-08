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

    ;; road connectivity
    (road ?from - place ?to - place)

    ;; discrete time / stages (global sequential clock)
    (current ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  ;; Drive a truck along a road (advances the global stage by one successor).
  ;; Preconditions enforce truck presence at origin and explicit road connectivity.
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

  ;; Hoist lifts a crate from a surface (pallet or crate) at the same place.
  ;; Preconditions:
  ;; - hoist at place, surface at place, crate on that surface,
  ;; - crate is clear (no crate on top),
  ;; - hoist is available,
  ;; - current stage equals ?t and successor exists to ?t2.
  ;; Effects:
  ;; - hoist holds the crate and becomes unavailable,
  ;; - crate is no longer on the surface,
  ;; - the surface becomes clear,
  ;; - crate is no longer recorded as being at the place (held in hoist),
  ;; - advance current stage.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surf - surface ?p - place ?t - stage ?t2 - stage)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (on ?c ?surf)
      (clear ?c)
      (hoist-available ?h)
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
  ;; Preconditions:
  ;; - hoist at place, surface at place and clear, hoist holding the crate,
  ;; - current stage ordering.
  ;; Effects:
  ;; - crate becomes on the surface,
  ;; - the surface is no longer clear,
  ;; - crate becomes recorded at the place as a surface,
  ;; - crate becomes clear (no crate on top),
  ;; - hoist becomes available and stops holding the crate,
  ;; - advance current stage.
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
      (surface-at ?c ?p)
      (clear ?c)
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist loads a held crate into a co-located truck.
  ;; Preconditions:
  ;; - hoist at place, truck at same place, hoist holding the crate,
  ;; - current stage ordering.
  ;; Effects:
  ;; - crate becomes in-truck,
  ;; - crate is no longer recorded at the place (removed from surface-at if present),
  ;; - hoist becomes available and stops holding the crate,
  ;; - advance current stage.
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
      (not (surface-at ?c ?p))
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist's grip (crate not yet on a surface).
  ;; Preconditions:
  ;; - hoist at place, truck at same place, hoist available, crate in the truck,
  ;; - current stage ordering.
  ;; Effects:
  ;; - crate removed from truck,
  ;; - hoist holds crate and becomes unavailable,
  ;; - advance current stage.
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