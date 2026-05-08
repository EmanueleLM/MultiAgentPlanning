(define (domain multiagent-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day
    vehicle
      truck
      airplane
    package
    location
      airport
      depot
  )

  (:predicates
    ;; time structure
    (day ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; state facts indexed by day
    (vehicle-at ?v - vehicle ?l - location ?d - day)
    (package-at ?p - package ?l - location ?d - day)

    ;; connectivity (static)
    (road ?from - location ?to - location)
    (airroute ?a1 - airport ?a2 - airport)
  )

  ;; Truck agent actions: trucks move packages (and themselves) along roads.
  ;; They operate between arbitrary locations connected by 'road'.
  (:action truck-transport
    :parameters (?p - package ?t - truck ?from - location ?to - location ?d - day ?d2 - day)
    :precondition (and
      (vehicle-at ?t ?from ?d)
      (package-at ?p ?from ?d)
      (road ?from ?to)
      (next ?d ?d2)
    )
    :effect (and
      ;; produce the next-day locations for both truck and package
      (vehicle-at ?t ?to ?d2)
      (package-at ?p ?to ?d2)
    )
  )

  ;; Airplane agent actions: airplanes move packages (and themselves) between airports only.
  (:action plane-transport
    :parameters (?p - package ?a - airplane ?from - airport ?to - airport ?d - day ?d2 - day)
    :precondition (and
      (vehicle-at ?a ?from ?d)
      (package-at ?p ?from ?d)
      (airroute ?from ?to)
      (next ?d ?d2)
    )
    :effect (and
      (vehicle-at ?a ?to ?d2)
      (package-at ?p ?to ?d2)
    )
  )

  ;; Idle / wait actions to carry forward vehicle state when they do not move.
  (:action truck-wait
    :parameters (?t - truck ?loc - location ?d - day ?d2 - day)
    :precondition (and
      (vehicle-at ?t ?loc ?d)
      (next ?d ?d2)
    )
    :effect (vehicle-at ?t ?loc ?d2)
  )

  (:action plane-wait
    :parameters (?a - airplane ?loc - airport ?d - day ?d2 - day)
    :precondition (and
      (vehicle-at ?a ?loc ?d)
      (next ?d ?d2)
    )
    :effect (vehicle-at ?a ?loc ?d2)
  )

  ;; Idle / wait for packages that remain in place from one day to the next.
  (:action package-wait
    :parameters (?p - package ?loc - location ?d - day ?d2 - day)
    :precondition (and
      (package-at ?p ?loc ?d)
      (next ?d ?d2)
    )
    :effect (package-at ?p ?loc ?d2)
  )
)