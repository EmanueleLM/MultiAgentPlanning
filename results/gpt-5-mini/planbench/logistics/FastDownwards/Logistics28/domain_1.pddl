(define (domain logistics28)
  (:requirements :strips :typing)
  (:types city location vehicle truck airplane package)

  (:predicates
    (vehicle_at ?v - vehicle ?l - location)
    (pkg_at ?p - package ?l - location)
    (in_truck ?t - truck ?p - package)
    (in_plane ?a - airplane ?p - package)
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
    (same_city ?l1 - location ?l2 - location)
    (diff_city ?l1 - location ?l2 - location)
  )

  ;; Truck actions
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (vehicle_at ?t ?l) (pkg_at ?p ?l))
    :effect (and (in_truck ?t ?p) (not (pkg_at ?p ?l)))
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (vehicle_at ?t ?l) (in_truck ?t ?p))
    :effect (and (pkg_at ?p ?l) (not (in_truck ?t ?p)))
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (vehicle_at ?t ?from) (same_city ?from ?to))
    :effect (and (vehicle_at ?t ?to) (not (vehicle_at ?t ?from)))
  )

  ;; Airplane actions
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (vehicle_at ?a ?l) (airport ?l) (pkg_at ?p ?l))
    :effect (and (in_plane ?a ?p) (not (pkg_at ?p ?l)))
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (vehicle_at ?a ?l) (airport ?l) (in_plane ?a ?p))
    :effect (and (pkg_at ?p ?l) (not (in_plane ?a ?p)))
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (vehicle_at ?a ?from) (airport ?from) (airport ?to) (diff_city ?from ?to))
    :effect (and (vehicle_at ?a ?to) (not (vehicle_at ?a ?from)))
  )
)