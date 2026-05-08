(define (domain logistics22)
  (:requirements :strips :typing)
  (:types truck plane package location city)

  (:predicates
    (at-truck ?t - truck ?l - location)     ; truck at location
    (at-plane ?pl - plane ?l - location)    ; plane at location
    (at-pkg ?p - package ?l - location)     ; package on the ground at location
    (in-truck ?p - package ?t - truck)      ; package inside a truck
    (in-plane ?p - package ?pl - plane)     ; package inside a plane
    (airport ?l - location)                 ; location is an airport
    (in_city ?l - location ?c - city)       ; location belongs to a city
    (free-truck ?t - truck)                 ; truck free to accept a package (capacity 1)
    (free-plane ?pl - plane)                ; plane free to accept a package (capacity 1)
  )

  ;; Truck actions (operate inside a city)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (free-truck ?t)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in-truck ?p ?t)
      (not (free-truck ?t))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-pkg ?p ?l)
      (free-truck ?t)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Plane actions (operate between airports)
  (:action plane-load
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at-plane ?pl ?l)
      (at-pkg ?p ?l)
      (free-plane ?pl)
      (airport ?l)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in-plane ?p ?pl)
      (not (free-plane ?pl))
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at-plane ?pl ?l)
      (in-plane ?p ?pl)
      (airport ?l)
    )
    :effect (and
      (not (in-plane ?p ?pl))
      (at-pkg ?p ?l)
      (free-plane ?pl)
    )
  )

  (:action plane-fly
    :parameters (?pl - plane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at-plane ?pl ?from)
      (airport ?from)
      (airport ?to)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
    )
  )
)