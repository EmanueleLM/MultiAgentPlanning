(define (domain logistics21)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle package location city
    truck airplane - vehicle
  )

  (:predicates
    ;; package location
    (package_at ?p - package ?l - location)

    ;; vehicle location (shared by trucks and airplanes)
    (vehicle_at ?v - vehicle ?l - location)

    ;; package inside a vehicle
    (in_vehicle ?p - package ?v - vehicle)

    ;; airport locations
    (airport ?l - location)

    ;; location membership in a city
    (location_in ?l - location ?c - city)
  )

  ;; Truck actions (operate inside a single city)
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (vehicle_at ?tr ?from)
      (location_in ?from ?c)
      (location_in ?to ?c)
    )
    :effect (and
      (not (vehicle_at ?tr ?from))
      (vehicle_at ?tr ?to)
    )
  )

  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (vehicle_at ?tr ?loc)
      (package_at ?p ?loc)
    )
    :effect (and
      (not (package_at ?p ?loc))
      (in_vehicle ?p ?tr)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (vehicle_at ?tr ?loc)
      (in_vehicle ?p ?tr)
    )
    :effect (and
      (not (in_vehicle ?p ?tr))
      (package_at ?p ?loc)
    )
  )

  ;; Airplane actions (operate between airports)
  (:action plane-fly
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (vehicle_at ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (vehicle_at ?pl ?from))
      (vehicle_at ?pl ?to)
    )
  )

  (:action plane-load
    :parameters (?pl - airplane ?p - package ?loc - location)
    :precondition (and
      (vehicle_at ?pl ?loc)
      (package_at ?p ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (package_at ?p ?loc))
      (in_vehicle ?p ?pl)
    )
  )

  (:action plane-unload
    :parameters (?pl - airplane ?p - package ?loc - location)
    :precondition (and
      (vehicle_at ?pl ?loc)
      (in_vehicle ?p ?pl)
      (airport ?loc)
    )
    :effect (and
      (not (in_vehicle ?p ?pl))
      (package_at ?p ?loc)
    )
  )
)