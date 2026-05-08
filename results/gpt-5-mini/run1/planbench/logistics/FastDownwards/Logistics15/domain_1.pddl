(define (domain logistics-orchestrated)
  (:requirements :strips :typing)
  (:types truck airplane package location city)

  (:predicates
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)
    (package-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  ;; Truck actions
  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (package-at ?pkg ?loc)
    )
    :effect (and
      (not (package-at ?pkg ?loc))
      (in-truck ?pkg ?tr)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (in-truck ?pkg ?tr)
    )
    :effect (and
      (not (in-truck ?pkg ?tr))
      (package-at ?pkg ?loc)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Airplane actions (flights only between airport locations)
  (:action plane-load
    :parameters (?ac - airplane ?pkg - package ?loc - location)
    :precondition (and
      (plane-at ?ac ?loc)
      (package-at ?pkg ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (package-at ?pkg ?loc))
      (in-plane ?pkg ?ac)
    )
  )

  (:action plane-unload
    :parameters (?ac - airplane ?pkg - package ?loc - location)
    :precondition (and
      (plane-at ?ac ?loc)
      (in-plane ?pkg ?ac)
      (airport ?loc)
    )
    :effect (and
      (not (in-plane ?pkg ?ac))
      (package-at ?pkg ?loc)
    )
  )

  (:action plane-fly
    :parameters (?ac - airplane ?from - location ?to - location)
    :precondition (and
      (plane-at ?ac ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane-at ?ac ?from))
      (plane-at ?ac ?to)
    )
  )
)