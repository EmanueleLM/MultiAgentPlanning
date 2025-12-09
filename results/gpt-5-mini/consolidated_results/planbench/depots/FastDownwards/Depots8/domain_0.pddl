(define (domain depot-distributor)
  (:requirements :strips :typing :negative-preconditions)
  (:types location truck hoist crate pallet surface)

  (:predicates
    ;; Locations and positions
    (truck_at ?t - truck ?l - location)
    (hoist_at ?h - hoist ?l - location)
    (surface_at ?s - surface ?l - location)
    (pallet_at ?p - pallet ?l - location)

    ;; Object placement predicates
    (crate_on_surface ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (on_pallet ?c - crate ?p - pallet)

    ;; Resource availability and constraints
    (pallet_free ?p - pallet)
    (hoist_free ?h - hoist)
  )

  ;; DRIVER actions (namespaced with driver-)
  (:action driver-drive-truck
    :parameters (?d - truck ?from - location ?to - location)
    :precondition (and (truck_at ?d ?from))
    :effect (and
      (not (truck_at ?d ?from))
      (truck_at ?d ?to)
    )
  )

  ;; HOIST operator actions (namespaced with hoist-)
  ;; Move hoist between locations
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and (hoist_at ?h ?from))
    :effect (and
      (not (hoist_at ?h ?from))
      (hoist_at ?h ?to)
    )
  )

  ;; Transfer crate from a surface into a truck (hoist operated)
  ;; Enforces that hoist, truck and surface are co-located and that the crate is on that surface.
  (:action hoist-transfer-surface-to-truck
    :parameters (?h - hoist ?s - surface ?loc - location ?c - crate ?t - truck)
    :precondition (and
      (hoist_at ?h ?loc)
      (surface_at ?s ?loc)
      (crate_on_surface ?c ?s)
      (truck_at ?t ?loc)
      (hoist_free ?h)
    )
    :effect (and
      (not (crate_on_surface ?c ?s))
      (in_truck ?c ?t)
      ;; hoist remains free after the complete transfer
    )
  )

  ;; Transfer crate from a truck onto a pallet at the same location (hoist operated)
  ;; Ensures pallet is free and co-located with truck and hoist.
  (:action hoist-transfer-truck-to-pallet
    :parameters (?h - hoist ?t - truck ?loc - location ?c - crate ?p - pallet)
    :precondition (and
      (hoist_at ?h ?loc)
      (truck_at ?t ?loc)
      (in_truck ?c ?t)
      (pallet_at ?p ?loc)
      (pallet_free ?p)
      (hoist_free ?h)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (on_pallet ?c ?p)
      (not (pallet_free ?p))
    )
  )
)