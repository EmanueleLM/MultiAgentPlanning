(define (domain transport-audit)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; explicit type predicates (auditable)
    (is_package ?p - package)
    (is_truck ?t - truck)
    (is_airplane ?a - airplane)
    (is_location ?l - location)
    (is_city ?c - city)

    ;; topology / static relations
    (in_city ?l - location ?c - city)
    (is_airport ?l - location)
    (belongs_to_city ?t - truck ?c - city)

    ;; location / containment state predicates (typed)
    (at_pkg ?p - package ?l - location)
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; locks / reservations for atomicity
    (locked_pkg ?p - package)
    (reserved_truck ?t - truck)

    ;; audit bookkeeping
    (on_manifest ?a - airplane ?p - package)
  )

  ;; Acquire and release locks for packages to make load/unload atomic
  (:action acquire-lock-pkg
    :parameters (?p - package)
    :precondition (and
                    (is_package ?p)
                    (not (locked_pkg ?p))
                  )
    :effect (and
              (locked_pkg ?p)
            )
  )

  (:action release-lock-pkg
    :parameters (?p - package)
    :precondition (and
                    (is_package ?p)
                    (locked_pkg ?p)
                  )
    :effect (and
              (not (locked_pkg ?p))
            )
  )

  ;; Reserve and release truck to prevent concurrent conflicting ops on the same truck
  (:action reserve-truck
    :parameters (?t - truck)
    :precondition (and
                    (is_truck ?t)
                    (not (reserved_truck ?t))
                  )
    :effect (and
              (reserved_truck ?t)
            )
  )

  (:action release-truck
    :parameters (?t - truck)
    :precondition (and
                    (is_truck ?t)
                    (reserved_truck ?t)
                  )
    :effect (and
              (not (reserved_truck ?t))
            )
  )

  ;; Load package into truck: requires package at location and truck at same location.
  ;; Requires package lock and truck reservation to ensure atomicity and no races.
  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
                    (is_package ?p)
                    (is_truck ?t)
                    (is_location ?loc)
                    (is_city ?c)

                    ;; package and truck collocated
                    (at_pkg ?p ?loc)
                    (truck_at ?t ?loc)

                    ;; package exclusivity implied by being at a location (package not in any vehicle)
                    ;; explicit city binding to prevent cross-city truck usage
                    (belongs_to_city ?t ?c)
                    (in_city ?loc ?c)

                    ;; atomicity/reservation
                    (locked_pkg ?p)
                    (reserved_truck ?t)
                  )
    :effect (and
              (in_truck ?p ?t)
              (not (at_pkg ?p ?loc))
            )
  )

  ;; Unload package from truck
  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
                    (is_package ?p)
                    (is_truck ?t)
                    (is_location ?loc)
                    (is_city ?c)

                    (in_truck ?p ?t)
                    (truck_at ?t ?loc)

                    ;; maintain truck-city binding
                    (belongs_to_city ?t ?c)
                    (in_city ?loc ?c)

                    ;; atomicity/reservation
                    (locked_pkg ?p)
                    (reserved_truck ?t)
                  )
    :effect (and
              (at_pkg ?p ?loc)
              (not (in_truck ?p ?t))
            )
  )

  ;; Drive truck within its assigned city between any two locations in that city.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (is_truck ?t)
                    (is_location ?from)
                    (is_location ?to)
                    (is_city ?c)

                    (truck_at ?t ?from)

                    ;; enforce same-city movement via static binding
                    (belongs_to_city ?t ?c)
                    (in_city ?from ?c)
                    (in_city ?to ?c)

                    ;; require reservation to avoid concurrent conflicting moves/loads
                    (reserved_truck ?t)
                  )
    :effect (and
              (truck_at ?t ?to)
              (not (truck_at ?t ?from))
            )
  )

  ;; Load package into airplane (airport-only). Requires package at airport and plane at same airport.
  ;; Requires package lock for atomicity. Adds audit manifest entry.
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location ?c - city)
    :precondition (and
                    (is_package ?p)
                    (is_airplane ?a)
                    (is_location ?loc)
                    (is_city ?c)

                    (at_pkg ?p ?loc)
                    (airplane_at ?a ?loc)
                    (is_airport ?loc)
                    (in_city ?loc ?c)

                    ;; package must be locked by orchestrator
                    (locked_pkg ?p)
                  )
    :effect (and
              (in_airplane ?p ?a)
              (on_manifest ?a ?p)
              (not (at_pkg ?p ?loc))
            )
  )

  ;; Unload package from airplane (airport-only). Requires package lock.
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location ?c - city)
    :precondition (and
                    (is_package ?p)
                    (is_airplane ?a)
                    (is_location ?loc)
                    (is_city ?c)

                    (in_airplane ?p ?a)
                    (airplane_at ?a ?loc)
                    (is_airport ?loc)
                    (in_city ?loc ?c)

                    (locked_pkg ?p)
                  )
    :effect (and
              (at_pkg ?p ?loc)
              (not (in_airplane ?p ?a))
              (not (on_manifest ?a ?p))
            )
  )

  ;; Fly airplane between airports (airport-to-airport). No plane reservation modeled here;
  ;; airplane moves atomically between airports.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
                    (is_airplane ?a)
                    (is_location ?from)
                    (is_location ?to)
                    (is_city ?cf)
                    (is_city ?ct)

                    (airplane_at ?a ?from)
                    (is_airport ?from)
                    (is_airport ?to)

                    ;; ensure airports belong to cities (connectivity)
                    (in_city ?from ?cf)
                    (in_city ?to ?ct)
                  )
    :effect (and
              (airplane_at ?a ?to)
              (not (airplane_at ?a ?from))
            )
  )
)