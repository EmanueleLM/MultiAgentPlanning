(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  ;; types and simple subtype declarations
  (:types
    depot distributor - place
    pallet crate - surface
    place truck hoist surface - object
  )

  ;; Predicates. Types are used to keep actions and objects distinct.
  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)   ; surfaces (pallets and crates) located at places
    (at-crate ?c - crate ?p - place)       ; crate located at a place (only when not in a truck)

    ;; stacking / containment
    (on ?c - crate ?s - surface)           ; crate c is on surface s
    (in ?c - crate ?t - truck)             ; crate c is in truck t

    ;; hoist/resource and concurrency
    (available ?h - hoist)                 ; hoist is free to start an operation
    (lifting ?h - hoist ?c - crate)        ; hoist h is currently lifting/holding crate c
    (handled ?c - crate)                   ; crate is currently being handled (prevents concurrent lifts)

    ;; mutual-exclusion for placing (surfaces include pallets and crates)
    (clear ?s - surface)                   ; nothing is on top of this surface/crate
  )

  ;; Truck driving action (full connectivity assumed; roads not explicitly enumerated).
  ;; This model uses the canonical "in-only" representation: crates inside trucks are represented
  ;; with (in ?c ?t) and do not maintain (at-crate ?c ?place) while loaded, so drive updates only truck location.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Hoist operations: each hoist action enforces exclusivity and explicit location bookkeeping.
  ;; hoist_lift: hoist picks a crate from a surface at a place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)              ; crate must be clear (nothing on top)
      (available ?h)
      (not (handled ?c))      ; crate not already being handled by another hoist
    )
    :effect (and
      (not (on ?c ?s))
      (not (at-crate ?c ?p))  ; crate is lifted and no longer counted as "at" the place
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)              ; surface becomes clear after removal
      (handled ?c)            ; mark crate as being handled to avoid concurrent lifts
    )
  )

  ;; hoist_drop: hoist places a held crate onto a surface at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at-crate ?c ?p)
      (not (clear ?s))
      (on ?c ?s)
      (clear ?c)
      (not (handled ?c))
    )
  )

  ;; hoist_load: hoist loads a held crate into a co-located truck.
  ;; After loading the crate is represented only by (in ?c ?t) and is no longer at the place/on a surface.
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at-crate ?c ?p))  ; crate removed from the place bookkeeping
      (not (handled ?c))
    )
  )

  ;; hoist_unload: hoist takes a crate out of a truck (hoist becomes unavailable and holds the crate).
  ;; The crate is removed from the truck (not yet placed at any surface/place until hoist_drop).
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (handled ?c)
    )
  )
)