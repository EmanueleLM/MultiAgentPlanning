(define (domain logistics-multiagent)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; Generic location predicate for trucks, airplanes, and packages
    (at ?entity ?loc)
    ;; package contained in a vehicle (truck or airplane)
    (in ?pkg ?vehicle)
    ;; location is an airport (required for airplane load/unload/fly)
    (is_airport ?loc)
    ;; location-to-city mapping
    (in_city ?loc ?city)
    ;; static assignment of a truck to operate within a city
    (truck_in_city ?truck ?city)
    ;; package is not in any vehicle and is available at its current location
    (free ?pkg)
  )

  ;; Truck actions (names prefixed with "truck-")
  (:action truck-load
    :parameters (?truck ?pkg ?loc ?city)
    :precondition (and
      (at ?truck ?loc)
      (at ?pkg ?loc)
      (truck_in_city ?truck ?city)
      (in_city ?loc ?city)
      (free ?pkg)
    )
    :effect (and
      (in ?pkg ?truck)
      (not (at ?pkg ?loc))
      (not (free ?pkg))
    )
  )

  (:action truck-unload
    :parameters (?truck ?pkg ?loc ?city)
    :precondition (and
      (at ?truck ?loc)
      (in ?pkg ?truck)
      (truck_in_city ?truck ?city)
      (in_city ?loc ?city)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?truck))
      (free ?pkg)
    )
  )

  (:action truck-drive
    :parameters (?truck ?from ?to ?city)
    :precondition (and
      (at ?truck ?from)
      (truck_in_city ?truck ?city)
      (in_city ?from ?city)
      (in_city ?to ?city)
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
      ;; packages in the truck remain 'in' the truck implicitly (no change to (in ...) atoms).
    )
  )

  ;; Airplane actions (names prefixed with "airplane-")
  (:action airplane-load
    :parameters (?plane ?pkg ?loc)
    :precondition (and
      (is_airport ?loc)
      (at ?plane ?loc)
      (at ?pkg ?loc)
      (free ?pkg)
    )
    :effect (and
      (in ?pkg ?plane)
      (not (at ?pkg ?loc))
      (not (free ?pkg))
    )
  )

  (:action airplane-unload
    :parameters (?plane ?pkg ?loc)
    :precondition (and
      (is_airport ?loc)
      (at ?plane ?loc)
      (in ?pkg ?plane)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?plane))
      (free ?pkg)
    )
  )

  (:action airplane-fly
    :parameters (?plane ?from ?to)
    :precondition (and
      (is_airport ?from)
      (is_airport ?to)
      (at ?plane ?from)
    )
    :effect (and
      (not (at ?plane ?from))
      (at ?plane ?to)
      ;; packages that are (in pkg plane) remain in the plane (no change to (in ...) atoms)
    )
  )
)