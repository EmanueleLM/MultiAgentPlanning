(define (domain multiagent_hoist_truck_domain)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types place truck hoist pallet crate surface) ; pallets and crates will be surfaces
  ; Predicates
  (:predicates
    (place? ?p - place)
    (truck? ?t - truck)
    (hoist? ?h - hoist)
    (pallet? ?p - pallet)
    (crate? ?c - crate)
    (surface? ?s - surface) ; either pallet or crate
    (at ?tr - truck ?p - place) ; truck at place (not true while driving)
    (hoist-at ?h - hoist ?p - place) ; static: hoist location
    (at-surface ?s - surface ?p - place) ; surface (crate or pallet) located at a place (static location)
    (on ?c - crate ?s - surface) ; crate on a surface (crate or pallet)
    (clear ?s - surface) ; surface has nothing on top
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate) ; hoist currently holding crate
    (in-truck ?c - crate ?t - truck)
  )

  ; Action: truck driving between places
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
      (at start (at ?tr ?from))
    )
    :effect (and
      (at start (not (at ?tr ?from))) ; while driving, not at origin
      (at end (at ?tr ?to)) ; become at destination at end
    )
  )

  ; Hoist actions (generic for any hoist). Each hoist is stationary.
  ; 1)