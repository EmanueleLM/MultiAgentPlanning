(define (domain transport-audit-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane loader container location airport)

  (:predicates
    ;; location predicates
    (at-truck ?t - truck ?loc - location)
    (at-airplane ?p - airplane ?loc - airport)
    (at-loader ?l - loader ?loc - airport)
    (at-container ?c - container ?loc - location)

    ;; containment predicates
    (in-truck ?c - container ?t - truck)
    (on-plane ?c - container ?p - airplane)

    ;; status predicates
    (loader-certified ?l - loader)
    (cargo-inspected ?c - container)
    (plane-inspected ?p - airplane)

    ;; explicit record of cargo placements
    (loaded-onto-truck ?c - container ?t - truck)
    (loaded-onto-plane ?c - container ?p - airplane)

    ;; ordered stage predicates to enforce sequence
    (stage-0-done)
    (stage-1-done)  ;; cargo arrived at origin-airport and unloaded from origin truck
    (stage-2-done)  ;; cargo inspected at origin-airport
    (stage-3-done)  ;; cargo loaded onto plane
    (stage-4-done)  ;; plane has flown to destination airport
    (stage-5-done)  ;; cargo unloaded from plane at destination airport
    (stage-6-done)  ;; cargo delivered to final customer location
  )

  ;; Drive a truck between any two locations (locations may include airports)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at-truck ?t ?from) (not (at-truck ?t ?to)))
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Load a container onto a truck (pickup)
  (:action load-onto-truck
    :parameters (?t - truck ?c - container ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (at-container ?c ?loc)
      (not (in-truck ?c ?t))
      (not (loaded-onto-plane ?c ?p)) ;; prevent loading if already on any plane (no bookkeeping shortcuts)
    )
    :effect (and
      (not (at-container ?c ?loc))
      (in-truck ?c ?t)
      (loaded-onto-truck ?c ?t)
    )
  )

  ;; Unload a container from a truck (dropoff)
  ;; If unloading at an origin airport this action is the one that establishes stage-1 (arrival at origin-airport)
  (:action unload-from-truck
    :parameters (?t - truck ?c - container ?loc - location)
    :precondition (and
      (in-truck ?c ?t)
      (at-truck ?t ?loc)
      (not (at-container ?c ?loc))
      (not (stage-1-done)) ;; enforce that arrival-stage hasn't already been declared
    )
    :effect (and
      (not (in-truck ?c ?t))
      (at-container ?c ?loc)
      (not (loaded-onto-truck ?c ?t))
      (stage-1-done)
    )
  )

  ;; Certify a loader before any loader-mediated load/unload on planes
  (:action certify-loader
    :parameters (?l - loader ?loc - airport)
    :precondition (and
      (at-loader ?l ?loc)
      (not (loader-certified ?l))
      ;; certification can be done at either airport prior to uses
    )
    :effect (and
      (loader-certified ?l)
    )
  )

  ;; Inspect cargo at an airport. Must occur after cargo has arrived at that airport (stage-1)
  ;; and before loading onto a plane. Requires a loader present to perform inspection at same airport.
  (:action inspect-cargo
    :parameters (?l - loader ?c - container ?loc - airport)
    :precondition (and
      (at-loader ?l ?loc)
      (at-container ?c ?loc)
      (stage-1-done)
      (not (cargo-inspected ?c))
    )
    :effect (and
      (cargo-inspected ?c)
      (stage-2-done)
    )
  )

  ;; Load container from a truck onto a plane. Must be performed by a certified loader,
  ;; after inspection (stage-2) and after arrival stage-1, and only at the same airport.
  (:action load-onto-plane
    :parameters (?l - loader ?p - airplane ?t - truck ?c - container ?loc - airport)
    :precondition (and
      (at-loader ?l ?loc)
      (at-airplane ?p ?loc)
      (at-truck ?t ?loc)
      (in-truck ?c ?t)
      (loader-certified ?l)
      (cargo-inspected ?c)
      (stage-2-done)
      (not (loaded-onto-plane ?c ?p))
      (not (stage-3-done))
    )
    :effect (and
      (not (in-truck ?c ?t))
      (not (loaded-onto-truck ?c ?t))
      (on-plane ?c ?p)
      (loaded-onto-plane ?c ?p)
      (stage-3-done)
    )
  )

  ;; Inspect airplane prior to flight. Auditor requires plane inspection before first flight.
  (:action inspect-plane
    :parameters (?l - loader ?p - airplane ?loc - airport)
    :precondition (and
      (at-loader ?l ?loc)
      (at-airplane ?p ?loc)
      (not (plane-inspected ?p))
    )
    :effect (and
      (plane-inspected ?p)
    )
  )

  ;; Fly an airplane between airports. Requires the plane to be inspected and cargo to be loaded.
  (:action fly-plane
    :parameters (?p - airplane ?from - airport ?to - airport ?c - container)
    :precondition (and
      (at-airplane ?p ?from)
      (plane-inspected ?p)
      (on-plane ?c ?p)
      (stage-3-done)
      (not (stage-4-done))
      (not (at-airplane ?p ?to))
    )
    :effect (and
      (not (at-airplane ?p ?from))
      (at-airplane ?p ?to)
      (stage-4-done)
    )
  )

  ;; Unload cargo from plane at destination airport. Requires certified loader present.
  (:action unload-from-plane
    :parameters (?l - loader ?p - airplane ?c - container ?loc - airport)
    :precondition (and
      (at-loader ?l ?loc)
      (at-airplane ?p ?loc)
      (on-plane ?c ?p)
      (loader-certified ?l)
      (stage-4-done)
      (not (stage-5-done))
    )
    :effect (and
      (not (on-plane ?c ?p))
      (not (loaded-onto-plane ?c ?p))
      (at-container ?c ?loc)
      (stage-5-done)
    )
  )

  ;; Load the container from destination airport onto local truck for final delivery.
  (:action load-onto-truck-dest
    :parameters (?t - truck ?c - container ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (at-container ?c ?loc)
      (stage-5-done)
      (not (in-truck ?c ?t))
    )
    :effect (and
      (not (at-container ?c ?loc))
      (in-truck ?c ?t)
      (loaded-onto-truck ?c ?t)
    )
  )

  ;; Unload at final customer location and complete the delivery stage.
  (:action unload-at-customer
    :parameters (?t - truck ?c - container ?from - location ?customer - location)
    :precondition (and
      (in-truck ?c ?t)
      (at-truck ?t ?customer)
      (not (at-container ?c ?customer))
      (stage-5-done)
      (not (stage-6-done))
    )
    :effect (and
      (not (in-truck ?c ?t))
      (not (loaded-onto-truck ?c ?t))
      (at-container ?c ?customer)
      (stage-6-done)
    )
  )
)