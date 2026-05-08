(define (domain transport-hoists-trucks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    truck
    hoist
  )
  ;; Note: pallet and crate are subtypes of surface; depot and distributor are subtypes of place.
  (:predicates
    ;; Location predicates
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?tr - truck ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; Crate placement / containment / co-location
    (crate-on-surface ?c - crate ?s - surface)   ;; crate is directly on top of surface
    (surface-clear ?s - surface)                 ;; no crate on top of this surface
    (crate-clear ?c - crate)                     ;; no crate on top of this crate (crate used as surface)
    (crate-in-truck ?c - crate ?tr - truck)      ;; crate loaded inside truck
    (at ?c - crate ?p - place)                   ;; crate co-located with place (valid when crate on a surface at that place, held by hoist at that place, or after unload)
    
    ;; Hoist resource / holding
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; Road connectivity (explicitly encode full connectivity between different places to forbid no-op drives)
    (road ?from - place ?to - place)
  )

  ;; Drive truck along road (roads explicitly provided in problem). Does not change hoist or surface predicates.
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

  ;; Hoist lift from a pallet surface
  (:action hoist-lift-from-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?pal ?p)
      (crate-on-surface ?c ?pal)
      (crate-clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (not (crate-on-surface ?c ?pal))
      ;; The pallet becomes clear after the top crate is removed
      (surface-clear ?pal)
      ;; crate remains co-located at ?p; (at ?c ?p) is kept unchanged
    )
  )

  ;; Hoist lift from a crate surface (surface is a crate; must update crate-clear of that surface)
  (:action hoist-lift-from-crate
    :parameters (?h - hoist ?c - crate ?surf - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (crate-on-surface ?c ?surf)
      (crate-clear ?c)
      (hoist-available ?h)
    )
    :effect (and
      (hoist-holding ?h ?c)
      (not (hoist-available ?h))
      (not (crate-on-surface ?c ?surf))
      ;; the crate-surface becomes clear and its crate-clear becomes true
      (surface-clear ?surf)
      (crate-clear ?surf)
    )
  )

  ;; Hoist drop onto a pallet surface
  (:action hoist-drop-on-pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?pal ?p)
      (surface-clear ?pal)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (crate-on-surface ?c ?pal)
      (crate-clear ?c)
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (surface-clear ?pal))
      ;; pallet is not a crate so no crate-clear predicate for the pallet is changed beyond surface-clear
      ;; crate remains at ?p (at ?c ?p) - maintain or add if needed by other actions
    )
  )

  ;; Hoist drop onto a crate surface (the target surface is a crate; update crate-clear of that surface)
  (:action hoist-drop-on-crate
    :parameters (?h - hoist ?c - crate ?surf - crate ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?surf ?p)
      (surface-clear ?surf)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (crate-on-surface ?c ?surf)
      (crate-clear ?c)
      (hoist-available ?h)
      (not (hoist-holding ?h ?c))
      (not (surface-clear ?surf))
      ;; the crate used as surface is no longer clear as a surface
      (not (crate-clear ?surf))
    )
  )

  ;; Hoist load crate into truck (truck must be co-located with hoist)
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
      ;; while inside truck, we remove the explicit at ?c ?p fact so drives need not update at for crates in trucks
      (not (at ?c ?p))
    )
  )

  ;; Hoist unload crate from truck (hoist must be available)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-available ?h)
      (crate-in-truck ?c ?tr)
      ;; ensure hoist is not already holding something is implied by hoist-available
    )
    :effect (and
      (hoist-holding ?h ?c)
      (crate-clear ?c)
      (at ?c ?p)
      (not (crate-in-truck ?c ?tr))
      (not (hoist-available ?h))
    )
  )
)