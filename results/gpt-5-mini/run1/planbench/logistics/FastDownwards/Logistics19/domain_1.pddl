(define (domain orchestrator_domain)
  (:requirements :strips :typing)
  (:types package truck airplane location)

  (:predicates
    ;; vehicle locations
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)

    ;; package location / containment
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; topology / classification
    (same_city ?l1 - location ?l2 - location)
    (airport ?l - location)
  )

  ;; Truck agent actions (intra-city operations)
  (:action truck_agent-load_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck_at ?t ?l)
      (package_at ?p ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (package_at ?p ?l))
    )
  )

  (:action truck_agent-unload_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action truck_agent-drive_truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (truck_at ?t ?from)
      (same_city ?from ?to)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; Airplane agent actions (inter-city via airports)
  (:action airplane_agent-load_airplane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane_at ?a ?loc)
      (package_at ?p ?loc)
      (airport ?loc)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (package_at ?p ?loc))
    )
  )

  (:action airplane_agent-unload_airplane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane_at ?a ?loc)
      (in_airplane ?p ?a)
      (airport ?loc)
    )
    :effect (and
      (package_at ?p ?loc)
      (not (in_airplane ?p ?a))
    )
  )

  (:action airplane_agent-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (airplane_at ?a ?to)
      (not (airplane_at ?a ?from))
    )
  )
)