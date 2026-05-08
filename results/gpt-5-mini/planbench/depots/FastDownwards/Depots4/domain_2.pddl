(define (domain depots-hoist-truck)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist truck
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (at ?s - surface ?p - place)            ; surface (pallet or crate) is at place

    ;; stacking / containment
    (on ?x - surface ?y - surface)          ; x is directly on y (y is pallet or crate)
    (clear ?s - surface)                    ; nothing on top of s

    ;; hoist state
    (hoist_free ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; truck content
    (in_truck ?c - crate ?tr - truck)

    ;; travel connectivity (explicit in problem file)
    (connected ?from - place ?to - place)
  )

  ;; Drive a truck along an explicitly listed connection.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Preconditions: hoist and surface at same place, crate on surface, hoist available, crate clear.
  ;; Effects: crate no longer on the surface nor at the place, hoist holds crate, hoist becomes unavailable,
  ;;          and the surface becomes clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_free ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (hoist_holding ?h ?c)
      (not (hoist_free ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a held crate to a surface at the hoist's location.
  ;; Preconditions: hoist holds crate, hoist and surface at same place, surface must be clear.
  ;; Effects: crate is on surface and at place, crate becomes clear, surface becomes not clear,
  ;;          hoist releases crate and becomes available.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_holding ?h ?c)
      (hoist_at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_free ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; Hoist loads a held crate into a co-located truck.
  ;; Preconditions: hoist holds crate, hoist and truck at same place.
  ;; Effects: crate becomes inside the truck, hoist releases crate and becomes available.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_holding ?h ?c)
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_free ?h)
      (in_truck ?c ?tr)
    )
  )

  ;; Hoist unloads a crate from a truck: hoist must be available and co-located with truck.
  ;; Preconditions: hoist free, hoist and truck at same place, crate inside truck.
  ;; Effects: crate removed from truck and hoist holds crate (crate now off-truck, not yet on surface).
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_free ?h)
      (hoist_at ?h ?p)
      (truck_at ?tr ?p)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (hoist_holding ?h ?c)
      (not (hoist_free ?h))
    )
  )

)