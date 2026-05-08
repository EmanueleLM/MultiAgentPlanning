(define (domain orchestrator-domain)
  (:requirements :strips :typing)
  (:types city location truck package airplane)
  (:predicates
    ;; location membership
    (in-city ?loc - location ?city - city)
    ;; airports
    (is-airport ?loc - location)
    ;; trucks and packages
    (truck-at ?t - truck ?loc - location)
    (pkg-at ?p - package ?loc - location)
    (in-truck ?p - package ?t - truck)
    ;; airplanes and air-transport
    (airplane-at ?a - airplane ?loc - location)
    (in-airplane ?p - package ?a - airplane)
    ;; explicit allowed flight pairs (keeps fly operator STRIPS-compatible)
    (allowed-flight ?from - location ?to - location)
  )

  ;; Truck operator actions (prefix "truck-op-")
  (:action truck-op-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (pkg-at ?p ?loc)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (pkg-at ?p ?loc))
    )
  )

  (:action truck-op-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (pkg-at ?p ?loc)
      (not (in-truck ?p ?t))
    )
  )

  ;; drive requires a common city parameter to ensure intra-city movement
  (:action truck-op-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; Plane operator actions (prefix "plane-op-")
  (:action plane-op-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (pkg-at ?p ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (pkg-at ?p ?loc))
    )
  )

  (:action plane-op-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (in-airplane ?p ?a)
      (is-airport ?loc)
    )
    :effect (and
      (pkg-at ?p ?loc)
      (not (in-airplane ?p ?a))
    )
  )

  ;; fly only between allowed airport pairs; carried packages remain (in-airplane ...) and thus implicitly travel
  (:action plane-op-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (allowed-flight ?from ?to)
    )
    :effect (and
      (airplane-at ?a ?to)
      (not (airplane-at ?a ?from))
    )
  )
)