(define (domain logistics_integrated)
  ;; Integrated logistics domain combining truck_operator and airplane_operator actions.
  ;; Resolutions and modeling decisions (enforced as hard constraints):
  ;;  - Packages have exclusive location semantics: either (at ?p ?loc) OR (in ?p ?v).
  ;;    To represent "not in any vehicle" without quantifiers, we introduce the fluent (unloaded ?p).
  ;;    unloaded is true exactly when the package is at a concrete location (not inside a vehicle).
  ;;    Load actions require (unloaded ?p) and delete it; unload actions add (unloaded ?p).
  ;;  - Vehicles (trucks, airplanes) have locations given by (at ?vehicle ?loc). Moving a vehicle
  ;;    only changes the vehicle's (at ...) fact. Packages inside vehicles remain (in ?p ?v) and
  ;;    are not given separate (at ?p ?loc) while loaded.
  ;;  - Airports are modeled as a predicate (is_airport ?loc). Airports are also locations.
  ;;  - Trucks are statically assigned to a city via (truck_belongs_to_city ?t ?c); drives are constrained
  ;;    to work only within that city (both from and to locations must belong to the same city that
  ;;    the truck belongs to).
  ;;  - Airplanes may only load/unload at airports; flying moves an airplane between airports in
  ;;    different cities.
  ;;  - Vehicles have unlimited capacity (explicitly chosen due to missing capacity info).
  ;;  - Concurrency and resources: this model targets classical sequential planners (FastDownwards).
  ;;    Thus actions are instantaneous and mutual exclusion is enforced implicitly by sequential planning.
  ;;  - No bookkeeping shortcuts: vehicle movement does not update package "at" facts; load/unload maintain exclusivity.
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    airport - location
    object
    vehicle - object
    package - object
    truck airplane - vehicle
  )

  (:predicates
    ;; object location facts (packages when not loaded, trucks, and airplanes)
    (at ?o - object ?l - location)

    ;; package-in-vehicle relation (package is inside a vehicle)
    (in ?p - package ?v - vehicle)

    ;; helper fluent meaning package is not inside any vehicle (must be true when package is at a location)
    (unloaded ?p - package)

    ;; mapping of a location to its city (static)
    (location_in_city ?l - location ?c - city)

    ;; airport predicate (some locations are airports)
    (is_airport ?l - location)

    ;; static assignment: truck belongs to a city (static)
    (truck_belongs_to_city ?t - truck ?c - city)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck-operator actions (prefixed with truck_operator_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action truck_operator_load
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
                    (at ?t ?loc)
                    (at ?p ?loc)
                    (unloaded ?p)
                  )
    :effect (and
              (in ?p ?t)
              (not (at ?p ?loc))
              (not (unloaded ?p))
            )
  )

  (:action truck_operator_unload
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
                    (in ?p ?t)
                    (at ?t ?loc)
                  )
    :effect (and
              (not (in ?p ?t))
              (at ?p ?loc)
              (unloaded ?p)
            )
  )

  (:action truck_operator_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (at ?t ?from)
                    (location_in_city ?from ?c)
                    (location_in_city ?to ?c)
                    (truck_belongs_to_city ?t ?c)
                  )
    :effect (and
              (not (at ?t ?from))
              (at ?t ?to)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Airplane-operator actions (prefixed with airplane_operator_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action airplane_operator_load
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
                    (at ?a ?loc)
                    (at ?p ?loc)
                    (is_airport ?loc)
                    (unloaded ?p)
                  )
    :effect (and
              (in ?p ?a)
              (not (at ?p ?loc))
              (not (unloaded ?p))
            )
  )

  (:action airplane_operator_unload
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
                    (in ?p ?a)
                    (at ?a ?loc)
                    (is_airport ?loc)
                  )
    :effect (and
              (not (in ?p ?a))
              (at ?p ?loc)
              (unloaded ?p)
            )
  )

  (:action airplane_operator_fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
                    (at ?a ?from)
                    (is_airport ?from)
                    (is_airport ?to)
                    (location_in_city ?from ?c_from)
                    (location_in_city ?to ?c_to)
                    (not (= ?c_from ?c_to))
                  )
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )
)