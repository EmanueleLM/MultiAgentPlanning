(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; type predicates (explicit)
    (truck ?t - truck)
    (airplane ?ap - airplane)
    (package ?p - package)
    (location ?l - location)
    (city ?c - city)

    ;; geography / static relations
    (in-city ?l - location ?c - city)
    (same-city ?l1 - location ?l2 - location)    ;; computed facts supplied in the problem instance
    (different ?l1 - location ?l2 - location)    ;; true when l1 != l2 (supplied in instance)
    (is-airport ?l - location)

    ;; dynamic state predicates (namespaced between truck and airplane models)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?ap - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; membership predicates (package inside vehicle)
    (in-truck ?p - package ?t - truck)
    (inside-plane ?p - package ?ap - airplane)
  )

  ;; Truck actions (namespaced: truck-*)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck ?t)
      (package ?p)
      (location ?l)
      (at-truck ?t ?l)       ; truck is at the location
      (at-package ?p ?l)     ; package is at the same location (ensures it is not currently in any vehicle)
    )
    :effect (and
      (in-truck ?p ?t)      ; package is now inside the truck
      (not (at-package ?p ?l)) ; package no longer at the location
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck ?t)
      (package ?p)
      (location ?l)
      (at-truck ?t ?l)       ; truck is at the unload location
      (in-truck ?p ?t)       ; package is inside the truck
    )
    :effect (and
      (at-package ?p ?l)     ; package placed at truck's current location
      (not (in-truck ?p ?t)) ; package removed from truck
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (truck ?t)
      (location ?from)
      (location ?to)
      (at-truck ?t ?from)    ; truck currently at origin
      (same-city ?from ?to)  ; movement restricted to locations in same city
      (different ?from ?to)  ; disallow no-op drives to the same location
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Airplane actions (namespaced: plane-*)
  (:action plane-load
    :parameters (?ap - airplane ?p - package ?l - location)
    :precondition (and
      (airplane ?ap)
      (package ?p)
      (location ?l)
      (is-airport ?l)          ; loading only at airports
      (at-airplane ?ap ?l)     ; airplane at same airport
      (at-package ?p ?l)       ; package at the airport (ensures not already inside a vehicle)
    )
    :effect (and
      (inside-plane ?p ?ap)    ; package now inside the airplane
      (not (at-package ?p ?l)) ; package removed from airport location
    )
  )

  (:action plane-unload
    :parameters (?ap - airplane ?p - package ?l - location)
    :precondition (and
      (airplane ?ap)
      (package ?p)
      (location ?l)
      (is-airport ?l)          ; must unload at an airport
      (at-airplane ?ap ?l)     ; airplane at the airport
      (inside-plane ?p ?ap)    ; package is inside that airplane
    )
    :effect (and
      (at-package ?p ?l)       ; package placed at the airport location
      (not (inside-plane ?p ?ap)) ; package no longer inside the airplane
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (airplane ?ap)
      (location ?from)
      (location ?to)
      (at-airplane ?ap ?from)  ; airplane at origin
      (is-airport ?from)       ; origin is an airport
      (is-airport ?to)         ; destination is an airport
      (not (same-city ?from ?to)) ; airplanes fly only between airports in different cities
      (different ?from ?to)       ; disallow no-op flights to the same location
    )
    :effect (and
      (at-airplane ?ap ?to)
      (not (at-airplane ?ap ?from))
      ;; packages inside remain inside-plane (no change to inside-plane predicates)
    )
  )
)