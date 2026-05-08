(define (domain orchestrator_domain)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    ;; Locations and vehicles
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)

    ;; Package location / containment (mutually exclusive: a package is either at a location or inside exactly one vehicle)
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; Topology & classification
    (same_city ?l1 - location ?l2 - location)
    (airport ?l - location)
    (truck_of_city ?t - truck ?c - city)
    (city ?c - city)
  )

  ;; Truck agent actions (prefixed with truck_agent)
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

  ;; Airplane agent actions (prefixed with airplane_agent)
  (:action airplane_agent-load_airplane
    :parameters (?a - airplane ?p - package ?ap - location)
    :precondition (and
      (airplane_at ?a ?ap)
      (package_at ?p ?ap)
      (airport ?ap)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (package_at ?p ?ap))
    )
  )

  (:action airplane_agent-unload_airplane
    :parameters (?a - airplane ?p - package ?ap - location)
    :precondition (and
      (airplane_at ?a ?ap)
      (in_airplane ?p ?a)
      (airport ?ap)
    )
    :effect (and
      (package_at ?p ?ap)
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