(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity place city)

  (:predicates
    ; location relationships and classifications
    (is-airport ?p - place)
    (in-city ?p - place ?c - city)

    ; positions and containment
    (at ?e - entity ?p - place)        ; entity (package or vehicle) is at a place
    (in ?pkg - entity ?veh - entity)   ; package is in a vehicle

    ; vehicle type tags
    (is-truck ?v - entity)
    (is-plane ?v - entity)

    ; connectivity (static)
    (road ?from - place ?to - place)   ; truck/driving connectivity
    (air-route ?from - place ?to - place) ; plane/flight connectivity
  )

  ; Truck actions (prefixed with truck_)
  (:action truck_drive
    :parameters (?t - entity ?from - place ?to - place ?c - city)
    :precondition (and
      (is-truck ?t)
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action truck_load
    :parameters (?t - entity ?pkg - entity ?loc - place)
    :precondition (and
      (is-truck ?t)
      (at ?t ?loc)
      (at ?pkg ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?t)
    )
  )

  (:action truck_unload
    :parameters (?t - entity ?pkg - entity ?loc - place)
    :precondition (and
      (is-truck ?t)
      (at ?t ?loc)
      (in ?pkg ?t)
    )
    :effect (and
      (not (in ?pkg ?t))
      (at ?pkg ?loc)
    )
  )

  ; Plane actions (prefixed with plane_)
  (:action plane_fly
    :parameters (?pl - entity ?from - place ?to - place)
    :precondition (and
      (is-plane ?pl)
      (at ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
      (air-route ?from ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )

  (:action plane_load
    :parameters (?pl - entity ?pkg - entity ?loc - place)
    :precondition (and
      (is-plane ?pl)
      (at ?pl ?loc)
      (is-airport ?loc)
      (at ?pkg ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?pl)
    )
  )

  (:action plane_unload
    :parameters (?pl - entity ?pkg - entity ?loc - place)
    :precondition (and
      (is-plane ?pl)
      (at ?pl ?loc)
      (is-airport ?loc)
      (in ?pkg ?pl)
    )
    :effect (and
      (not (in ?pkg ?pl))
      (at ?pkg ?loc)
    )
  )
)