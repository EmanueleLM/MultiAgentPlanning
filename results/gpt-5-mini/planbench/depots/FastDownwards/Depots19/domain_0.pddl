(define (domain hoist-truck-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    hoist truck
  )
  (:predicates
    ;; Locations
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?t - truck ?p - place)
    (surface-at ?s - surface ?p - place)   ;; pallets and crates are surfaces

    ;; Stacking and loads
    (on ?c - crate ?s - surface)            ;; crate c is directly on surface s
    (in-truck ?c - crate ?t - truck)       ;; crate c is in truck t

    ;; Hoist state and resources
    (hoist-lifting ?h - hoist ?c - crate)  ;; hoist h holds crate c
    (hoist-available ?h - hoist)           ;; hoist h is available to start a lift/unload

    ;; Surface state
    (clear ?s - surface)                   ;; nothing (no crate) is on surface s

    ;; Roads (connectivity)
    (road ?p - place ?q - place)
  )

  ;; Truck driving (agent: truck)
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

  ;; Hoist actions (agent: hoist) -- lift from a surface (pallet or crate)
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (surface-at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (clear ?s)
      (not (hoist-available ?h))
      (not (on ?c ?s))
    )
  )

  ;; Hoist drop: place held crate onto a target surface
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
      (hoist-available ?h)
      (clear ?c)
      (not (hoist-lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Hoist load: put held crate into truck (crate leaves being a surface-place representative)
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

  ;; Hoist unload: pick crate out of truck into hoist-lifting state (crate becomes associated to place)
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
      (surface-at ?c ?p)
      (not (in-truck ?c ?t))
      (not (hoist-available ?h))
    )
  )
)