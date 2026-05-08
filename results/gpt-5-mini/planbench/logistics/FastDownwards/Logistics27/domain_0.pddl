(define (domain logistics-lite)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package location)

  ;; Predicates recommended by the auditor and used by actions:
  (:predicates
    (truck-at ?t - truck ?l - location)     ; truck location
    (plane-at ?p - plane ?l - location)     ; plane location
    (package-at ?pkg - package ?l - location) ; package at a location (not inside vehicle)
    (in-truck ?pkg - package ?t - truck)    ; package is loaded in truck
    (in-plane ?pkg - package ?p - plane)    ; package is loaded in plane
    (road ?from - location ?to - location)  ; directed road connectivity
    (air-route ?from - location ?to - location) ; directed air connectivity
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck actions (distinct, clearly named and commented)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;; truck-load: load a package from a location into a truck
  (:action truck-load
    :parameters (?t - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (package-at ?pkg ?loc)
      (not (in-truck ?pkg ?t))
    )
    :effect (and
      (in-truck ?pkg ?t)
      (not (package-at ?pkg ?loc))
    )
  )

  ;;; truck-unload: unload a package from a truck to the truck's current location
  (:action truck-unload
    :parameters (?t - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (in-truck ?pkg ?t)
    )
    :effect (and
      (package-at ?pkg ?loc)
      (not (in-truck ?pkg ?t))
    )
  )

  ;;; drive-truck: move a truck along a road between locations
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (truck-at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Airplane actions (distinct, clearly named and commented)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;; plane-load: load a package from a location into a plane
  (:action plane-load
    :parameters (?p - plane ?pkg - package ?loc - location)
    :precondition (and
      (plane-at ?p ?loc)
      (package-at ?pkg ?loc)
      (not (in-plane ?pkg ?p))
    )
    :effect (and
      (in-plane ?pkg ?p)
      (not (package-at ?pkg ?loc))
    )
  )

  ;;; plane-unload: unload a package from a plane to the plane's current location
  (:action plane-unload
    :parameters (?p - plane ?pkg - package ?loc - location)
    :precondition (and
      (plane-at ?p ?loc)
      (in-plane ?pkg ?p)
    )
    :effect (and
      (package-at ?pkg ?loc)
      (not (in-plane ?pkg ?p))
    )
  )

  ;;; fly-plane: move a plane along an air-route between locations
  (:action fly-plane
    :parameters (?p - plane ?from - location ?to - location)
    :precondition (and
      (plane-at ?p ?from)
      (air-route ?from ?to)
    )
    :effect (and
      (plane-at ?p ?to)
      (not (plane-at ?p ?from))
    )
  )

)