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
    (in ?pkg - package ?veh - vehicle)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
    (truck_in_city ?t - truck ?c - city)
  )

  ;; Action for loading a package into a truck
  (:action load-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (at ?pkg ?loc)
                       (at ?trk ?loc)
                  )
    :effect (and (not (at ?pkg ?loc))
                 (in ?pkg ?trk)
            )
  )

  ;; Action for unloading a package from a truck
  (:action unload-truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and (in ?pkg ?trk)
                       (at ?trk ?loc)
                  )
    :effect (and (not (in ?pkg ?trk))
                 (at ?pkg ?loc)
            )
  )

  ;; Action for driving a truck between locations within the same city
  (:action drive-truck
    :parameters (?trk - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?trk ?from)
                       (in_city ?from ?c)
                       (in_city ?to ?c)
                       (truck_in_city ?trk ?c)
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
                 (in ?pkg ?apn)
            )
  )

  ;; Action for unloading a package from an airplane
  (:action unload-airplane
    :parameters (?pkg - package ?apn - airplane ?loc - location)
    :precondition (and (in ?pkg ?apn)
                       (at ?apn ?loc)
                       (is_airport ?loc) ; Airplanes load/unload only at airports
                  )
    :effect (and (not (in ?pkg ?apn))
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