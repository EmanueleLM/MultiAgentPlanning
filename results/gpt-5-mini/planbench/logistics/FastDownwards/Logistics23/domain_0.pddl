(define (domain logistics_mixed)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package location)

  (:predicates
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - plane ?l - location)
    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - plane)
    (road ?from - location ?to - location)
    (air_conn ?from - location ?to - location)
    (airport ?l - location)
  )

  ; Truck actions (distinct prefixed names)
  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at_truck ?t ?l)
      (at_pkg ?p ?l)
      (not (in_truck ?p ?t))
      (not (in_plane ?p ?t)) ; ensure package not in any vehicle (prevent ambiguous typing misuse)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at_truck ?t ?l)
      (in_truck ?p ?t)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at_truck ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ; Airplane actions (distinct prefixed names)
  (:action airplane_load
    :parameters (?a - plane ?p - package ?l - location)
    :precondition (and
      (at_plane ?a ?l)
      (at_pkg ?p ?l)
      (airport ?l)                      ; corrected audit precondition: planes load only at airports
      (not (in_plane ?p ?a))
      (not (in_truck ?p ?a))            ; ensure package not in truck (prevent ambiguous typing misuse)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  (:action airplane_unload
    :parameters (?a - plane ?p - package ?l - location)
    :precondition (and
      (at_plane ?a ?l)
      (in_plane ?p ?a)
      (airport ?l)                      ; corrected audit precondition: planes unload only at airports
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  (:action airplane_fly
    :parameters (?a - plane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)                   ; corrected audit precondition: takeoff only from airports
      (airport ?to)                     ; corrected audit precondition: landing only at airports
      (air_conn ?from ?to)
    )
    :effect (and
      (at_plane ?a ?to)
      (not (at_plane ?a ?from))
    )
  )
)