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
    ; place and city relations
    (is-airport ?p - place)
    (in-city ?p - place ?c - city)

    ; positions
    (at-package ?pkg - package ?loc - place)
    (at-truck ?t - truck ?loc - place)
    (at-plane ?pl - plane ?loc - place)

    ; containment of packages in vehicles
    (in ?pkg - package ?veh - vehicle)
  )

  ; Truck actions
  (:action truck_load
    :parameters (?pkg - package ?t - truck ?loc - place)
    :precondition (and
      (at-package ?pkg ?loc)
      (at-truck ?t ?loc)
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in ?pkg ?t)
    )
  )

  (:action truck_unload
    :parameters (?pkg - package ?t - truck ?loc - place)
    :precondition (and
      (in ?pkg ?t)
      (at-truck ?t ?loc)
    )
    :effect (and
      (not (in ?pkg ?t))
      (at-package ?pkg ?loc)
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - place ?to - place ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ; Plane actions
  (:action plane_load
    :parameters (?pkg - package ?pl - plane ?loc - place)
    :precondition (and
      (at-package ?pkg ?loc)
      (at-plane ?pl ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in ?pkg ?pl)
    )
  )

  (:action plane_unload
    :parameters (?pkg - package ?pl - plane ?loc - place)
    :precondition (and
      (in ?pkg ?pl)
      (at-plane ?pl ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (not (in ?pkg ?pl))
      (at-package ?pkg ?loc)
    )
  )

  (:action plane_fly
    :parameters (?pl - plane ?from - place ?to - place)
    :precondition (and
      (at-plane ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
    )
  )
)