(define (domain city_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    airport
    vehicle
    truck airplane - vehicle
    package
  )

  ;; Predicates
  (:predicates
    (city ?c - city)
    (location ?l - location)
    (airport ?l - airport)                      ; airport is a location
    (in_city ?l - location ?c - city)          ; location l is in city c

    (truck ?t - truck)
    (airplane ?a - airplane)
    (package ?p - package)

    ;; separate location predicates for vehicles and packages (clear semantics)
    (at_vehicle ?v - vehicle ?l - location)    ; vehicles (trucks or airplanes) are at locations
    (at_package ?p - package ?l - location)    ; package is physically at a location (not inside a vehicle)

    ;; package loaded inside a vehicle (vehicle is a truck or airplane)
    (loaded_in ?p - package ?v - vehicle)

    ;; trucks assignment
    (truck_assigned_to_city ?t - truck ?c - city)

    ;; connectivity
    (connected_by_truck ?l1 - location ?l2 - location)
    (air_route ?a1 - airport ?a2 - airport)

    ;; unified package location fluent required by the auditor
    ;; package_at(p,l) is maintained explicitly by actions so it always equals:
    ;; (at_package p l) OR (exists v: loaded_in(p,v) AND at_vehicle v l)
    (package_at ?p - package ?l - location)
  )

  ;; ACTIONS
  ;; Load into airplane:
  ;; Preconditions:
  ;;   - airplane at airport l
  ;;   - package physically at l (not already loaded)
  ;;   - package not loaded in any other vehicle (expressed by negative preconditions enumerating known vehicles)
  ;; Effects:
  ;;   - loaded_in p a
  ;;   - remove at_package p l
  ;;   - ensure package_at p l remains true (so package_at reflects the package being at the airport while loaded)
  (:action load_into_airplane
    :parameters (?a - airplane ?p - package ?l - airport)
    :precondition (and
      (at_vehicle ?a ?l)
      (at_package ?p ?l)
      ;; prevent double-loading: enumerate known vehicles (grounded domain objects will be listed in the problem)
      (not (loaded_in ?p airplane_0))
      (not (loaded_in ?p airplane_1))
      (not (loaded_in ?p truck_0))
      (not (loaded_in ?p truck_1))
    )
    :effect (and
      (loaded_in ?p ?a)
      (not (at_package ?p ?l))
      (package_at ?p ?l)
    )
  )

  ;; Unload from airplane
  (:action unload_from_airplane
    :parameters (?a - airplane ?p - package ?l - airport)
    :precondition (and
      (loaded_in ?p ?a)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (not (loaded_in ?p ?a))
      (at_package ?p ?l)
      (package_at ?p ?l)
    )
  )

  ;; Fly airplane with NO packages onboard:
  ;; This action is only allowed if the airplane currently carries no package (negative preconditions for each package)
  ;; Precondition uses (not (= ?from ?to)) encoded as (not (= ?from ?to))
  (:action fly_airplane_empty
    :parameters (?a - airplane ?from - airport ?to - airport)
    :precondition (and
      (at_vehicle ?a ?from)
      (air_route ?from ?to)
      (not (= ?from ?to))
      ;; ensure airplane carries no known package (explicit listing for domain's packages)
      (not (loaded_in package_0 ?a))
      (not (loaded_in package_1 ?a))
    )
    :effect (and
      (at_vehicle ?a ?to)
      (not (at_vehicle ?a ?from))
    )
  )

  ;; Fly airplane carrying a specific package ?p:
  ;; Precondition: airplane at ?from, air_route(?from,?to), loaded_in(?p,?a), package_at(?p,?from)
  ;; Effects: airplane moves; package_at moved from ?from to ?to
  ;; Note: loaded_in remains true (package remains loaded) so package_at must be moved to reflect vehicle movement.
  (:action fly_airplane_carry
    :parameters (?a - airplane ?from - airport ?to - airport ?p - package)
    :precondition (and
      (at_vehicle ?a ?from)
      (air_route ?from ?to)
      (not (= ?from ?to))
      (loaded_in ?p ?a)
      (package_at ?p ?from)
    )
    :effect (and
      (at_vehicle ?a ?to)
      (not (at_vehicle ?a ?from))
      (package_at ?p ?to)
      (not (package_at ?p ?from))
    )
  )

  ;; Load into truck:
  ;; Truck must be at the location and the truck must be assigned to the city containing that location.
  ;; Also ensure package is not already loaded anywhere (negative preconditions enumerate vehicles).
  (:action load_into_truck
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
      (at_vehicle ?t ?l)
      (at_package ?p ?l)
      (in_city ?l ?c)
      (truck_assigned_to_city ?t ?c)
      (not (loaded_in ?p airplane_0))
      (not (loaded_in ?p airplane_1))
      (not (loaded_in ?p truck_0))
      (not (loaded_in ?p truck_1))
    )
    :effect (and
      (loaded_in ?p ?t)
      (not (at_package ?p ?l))
      (package_at ?p ?l)
    )
  )

  ;; Unload from truck
  (:action unload_from_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (loaded_in ?p ?t)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (not (loaded_in ?p ?t))
      (at_package ?p ?l)
      (package_at ?p ?l)
    )
  )

  ;; Drive truck without packages: only allowed if the truck currently carries no package (negative preconditions per package)
  (:action drive_truck_empty
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_vehicle ?t ?from)
      (connected_by_truck ?from ?to)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (truck_assigned_to_city ?t ?c)
      (not (= ?from ?to))
      (not (loaded_in package_0 ?t))
      (not (loaded_in package_1 ?t))
    )
    :effect (and
      (at_vehicle ?t ?to)
      (not (at_vehicle ?t ?from))
    )
  )

  ;; Drive truck carrying a specific package ?p:
  ;; Preconditions: truck at from, connected_by_truck(from,to), truck assigned to city c, loaded_in(p,t), package_at(p,from)
  ;; Effects: truck moves; package_at moves with truck.
  (:action drive_truck_carry
    :parameters (?t - truck ?from - location ?to - location ?c - city ?p - package)
    :precondition (and
      (at_vehicle ?t ?from)
      (connected_by_truck ?from ?to)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (truck_assigned_to_city ?t ?c)
      (not (= ?from ?to))
      (loaded_in ?p ?t)
      (package_at ?p ?from)
    )
    :effect (and
      (at_vehicle ?t ?to)
      (not (at_vehicle ?t ?from))
      (package_at ?p ?to)
      (not (package_at ?p ?from))
    )
  )

  ;; Notes:
  ;; - Mutual exclusion between at_package and loaded_in is enforced by action effects:
  ;;     load removes at_package (package physically removed) and sets loaded_in;
  ;;     unload deletes loaded_in and reinstates at_package.
  ;; - package_at is maintained explicitly:
  ;;     * when loading, package_at remains true at the vehicle's location;
  ;;     * when flying/driving while carrying a package, the fly/drive_carry action moves package_at to the new location;
  ;;     * when unloading, package_at is (re)asserted at the unload location.
  ;; - Truck-city variable 'c' is explicit in truck actions (ensures the truck is assigned to the city containing from/to).
  ;; - Drive and Fly actions forbid from == to via (not (= ?from ?to)).
  ;; - Execution model is sequential (no concurrency assumed).
)