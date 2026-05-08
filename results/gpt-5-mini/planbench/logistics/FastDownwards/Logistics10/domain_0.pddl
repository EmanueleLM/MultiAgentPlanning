(define (domain multi-modal-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; static / invariant
    (location_in_city ?loc - location ?c - city)
    (airport ?loc - location)
    ;; connectivity helper (static): airports in different cities
    (different-city ?from - location ?to - location)

    ;; vehicle and package state
    (at-truck ?t - truck ?l - location)
    (at-plane ?pl - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ;; in-vehicle predicates
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)

    ;; explicit transfer/completion tokens to enforce ordering
    (ready-for-airlift ?p - package)            ; set when truck unloads to airport
    (ready-for-ground-delivery ?p - package)   ; set when plane unloads at dest airport
  )

  ;; -------------------------------------------------------
  ;; Truck (ground) actions - namespaced with "truck-"
  ;; -------------------------------------------------------

  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (location_in_city ?l ?c) ; verifies l is a valid location in some city
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-pkg ?p ?l))
    )
  )

  ;; Loading a package at an airport that was produced by plane-unload.
  ;; Requires the plane to have explicitly marked the package ready for ground pickup.
  (:action truck-load-from-airport
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (airport ?l)
      (ready-for-ground-delivery ?p)
      (location_in_city ?l ?c)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-pkg ?p ?l))
      (not (ready-for-ground-delivery ?p))
    )
  )

  ;; Unload to a non-airport location (generic)
  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
      (location_in_city ?l ?c)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  ;; Unload at an airport: produces an explicit token that authorizes a subsequent plane-load.
  (:action truck-unload-at-airport
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
      (airport ?l)
      (location_in_city ?l ?c)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
      (ready-for-airlift ?p)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; -------------------------------------------------------
  ;; Airplane (air) actions - namespaced with "plane-"
  ;; -------------------------------------------------------

  (:action plane-load
    :parameters (?p - package ?pl - airplane ?l - location)
    :precondition (and
      (at-plane ?pl ?l)
      (at-pkg ?p ?l)
      (airport ?l)
      (location_in_city ?l ?c)
      (ready-for-airlift ?p)       ; explicit ordering: truck-unload-at-airport must have happened
    )
    :effect (and
      (in-plane ?p ?pl)
      (not (at-pkg ?p ?l))
      (not (ready-for-airlift ?p))
    )
  )

  (:action plane-unload
    :parameters (?p - package ?pl - airplane ?l - location)
    :precondition (and
      (in-plane ?p ?pl)
      (at-plane ?pl ?l)
      (airport ?l)
      (location_in_city ?l ?c)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-plane ?p ?pl))
      (ready-for-ground-delivery ?p)
    )
  )

  (:action plane-fly
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?pl ?from)
      (airport ?from)
      (airport ?to)
      (different-city ?from ?to)  ; explicit static predicate: airports must be in different cities
    )
    :effect (and
      (at-plane ?pl ?to)
      (not (at-plane ?pl ?from))
      ;; in-plane facts remain unchanged by flight: packages stay in-plane while flying
    )
  )

)