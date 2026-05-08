(define (domain logistics_multiagent)
  (:requirements :strips :typing)
  (:types
    object
    package vehicle - object
    truck plane - vehicle
    place
    city
  )

  (:predicates
    ; place and city relations
    (is_airport ?p - place)
    (in_city ?p - place ?c - city)

    ; positions for packages and vehicles (both are objects)
    (at ?o - object ?loc - place)

    ; containment of packages in vehicles
    (in ?pkg - package ?veh - vehicle)
  )

  ; Truck actions (intra-city)
  (:action truck_load
    :parameters (?pkg - package ?t - truck ?loc - place)
    :precondition (and
      (at ?pkg ?loc)
      (at ?t ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?t)
    )
  )

  (:action truck_unload
    :parameters (?pkg - package ?t - truck ?loc - place)
    :precondition (and
      (in ?pkg ?t)
      (at ?t ?loc)
    )
    :effect (and
      (not (in ?pkg ?t))
      (at ?pkg ?loc)
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - place ?to - place ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ; Plane actions (inter-city via airports)
  (:action plane_load
    :parameters (?pkg - package ?pl - plane ?loc - place)
    :precondition (and
      (at ?pkg ?loc)
      (at ?pl ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?pl)
    )
  )

  (:action plane_unload
    :parameters (?pkg - package ?pl - plane ?loc - place)
    :precondition (and
      (in ?pkg ?pl)
      (at ?pl ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (not (in ?pkg ?pl))
      (at ?pkg ?loc)
    )
  )

  (:action plane_fly
    :parameters (?pl - plane ?from - place ?to - place)
    :precondition (and
      (at ?pl ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )
)