(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    physical_object
    package - physical_object
    vehicle - physical_object
    truck - vehicle
    airplane - vehicle
  )
  (:predicates
    (at ?obj - physical_object ?loc - location)
    ;; REPAIR: Replaced generic (in ?pkg ?veh) with specific predicates
    ;; A package can only be in one type of vehicle at a time,
    ;; and not at a location if it's in a vehicle.
    (in_truck ?pkg - package ?trk - truck)
    (in_airplane ?pkg - package ?apn - airplane)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
    (truck_in_city ?t - truck ?c - city) ; Represents static assignment of a truck to its home city
  )

  ;; Action for loading a package into a truck
  (:action load-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc)
                       (at ?trk ?loc)
                  )
    :effect (and (not (at ?pkg ?loc))
                 (in_truck ?pkg ?trk) ; REPAIR: Use in_truck
            )
  )

  ;; Action for unloading a package from a truck
  (:action unload-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in_truck ?pkg ?trk) ; REPAIR: Use in_truck
                       (at ?trk ?loc)
                  )
    :effect (and (not (in_truck ?pkg ?trk)) ; REPAIR: Use in_truck
                 (at ?pkg ?loc)
            )
  )

  ;; Action for driving a truck between locations within the same city
  (:action drive-truck
    :parameters (?trk - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?trk ?from)
                       (in_city ?from ?c)
                       (in_city ?to ?c)
                       (truck_in_city ?trk ?c) ; Ensure truck is driving in its assigned city
                       (not (= ?from ?to))
                  )
    :effect (and (not (at ?trk ?from))
                 (at ?trk ?to)
            )
  )

  ;; Action for loading a package into an airplane
  (:action load-airplane
    :parameters (?pkg - package ?apn - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc)
                       (at ?apn ?loc)
                       (is_airport ?loc) ; Airplanes load/unload only at airports
                  )
    :effect (and (not (at ?pkg ?loc))
                 (in_airplane ?pkg ?apn) ; REPAIR: Use in_airplane
            )
  )

  ;; Action for unloading a package from an airplane
  (:action unload-airplane
    :parameters (?pkg - package ?apn - airplane ?loc - location)
    :precondition (and (in_airplane ?pkg ?apn) ; REPAIR: Use in_airplane
                       (at ?apn ?loc)
                       (is_airport ?loc) ; Airplanes load/unload only at airports
                  )
    :effect (and (not (in_airplane ?pkg ?apn)) ; REPAIR: Use in_airplane
                 (at ?pkg ?loc)
            )
  )

  ;; Action for flying an airplane between airports in different cities
  (:action fly-airplane
    :parameters (?apn - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and (at ?apn ?from)
                       (is_airport ?from)
                       (is_airport ?to)
                       (in_city ?from ?from_city) ; Infer from_city from from-location
                       (in_city ?to ?to_city)     ; Infer to_city from to-location
                       (not (= ?from_city ?to_city)) ; Must fly between different cities
                  )
    :effect (and (not (at ?apn ?from))
                 (at ?apn ?to)
            )
  )
)