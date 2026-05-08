(define (domain logistics_multiagent)
  (:requirements :strips :typing)
  (:types
    package
    vehicle
    truck plane - vehicle
    place
    city
  )

  (:predicates
    ;; package predicates
    (at_pkg ?p - package ?loc - place)
    (in ?p - package ?v - vehicle)

    ;; vehicle predicates
    (at_veh ?v - vehicle ?loc - place)

    ;; topology / classification
    (is_airport ?loc - place)
    (in_city ?loc - place ?c - city)
  )

  ;; Truck actions (intra-city)
  (:action truck_load
    :parameters (?p - package ?t - truck ?loc - place)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_veh ?t ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?t)
    )
  )

  (:action truck_unload
    :parameters (?p - package ?t - truck ?loc - place)
    :precondition (and
      (in ?p ?t)
      (at_veh ?t ?loc)
    )
    :effect (and
      (not (in ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - place ?to - place ?c - city)
    :precondition (and
      (at_veh ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_veh ?t ?from))
      (at_veh ?t ?to)
    )
  )

  ;; Plane actions (inter-city via airports)
  (:action plane_load
    :parameters (?p - package ?pl - plane ?loc - place)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_veh ?pl ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?pl)
    )
  )

  (:action plane_unload
    :parameters (?p - package ?pl - plane ?loc - place)
    :precondition (and
      (in ?p ?pl)
      (at_veh ?pl ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (not (in ?p ?pl))
      (at_pkg ?p ?loc)
    )
  )

  (:action plane_fly
    :parameters (?pl - plane ?from - place ?to - place)
    :precondition (and
      (at_veh ?pl ?from)
      (is_airport ?from)
      (is_airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_veh ?pl ?from))
      (at_veh ?pl ?to)
    )
  )
)