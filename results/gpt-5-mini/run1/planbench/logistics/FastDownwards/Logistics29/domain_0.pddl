(define (domain logistics_combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    entity
    location
    city
    package truck airplane - entity
  )

  (:predicates
    ; location and city membership
    (in_city ?l - location ?c - city)
    (same_city ?l1 - location ?l2 - location)

    ; role predicates
    (airport ?l - location)

    ; entity typing
    (is_truck ?v - entity)
    (is_airplane ?v - entity)
    (city_of ?v - entity ?c - city) ; static binding for trucks (and optionally airplanes)

    ; world state
    (at ?e - entity ?l - location)    ; entity (truck/airplane/package) is at location
    (in ?p - package ?v - entity)     ; package is inside vehicle (truck or airplane)
    (free ?p - package)               ; package is not inside any vehicle (hence located on ground)
  )

  ; -------------------------
  ; Truck-manager actions (namespaced: truck_manager)
  ; -------------------------
  (:action truck_manager_load_truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (is_truck ?t)
      (city_of ?t ?c)
      (in_city ?l ?c)
      (at ?p ?l)
      (at ?t ?l)
      (free ?p)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?l))
      (not (free ?p))
    )
  )

  (:action truck_manager_unload_truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (is_truck ?t)
      (city_of ?t ?c)
      (in ?p ?t)
      (at ?t ?l)
      (in_city ?l ?c)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
      (free ?p)
    )
  )

  (:action truck_manager_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (is_truck ?t)
      (city_of ?t ?c)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (at ?t ?from)
      (not (at ?t ?to))      ; prevents no-op drives and enforces from != to
      (same_city ?from ?to)  ; explicit same-city connectivity check
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
      ; packages loaded in the truck remain in(?p ?t) (no explicit add/del needed)
    )
  )

  ; -------------------------
  ; Air-manager actions (namespaced: air_manager)
  ; -------------------------
  (:action air_manager_load_airplane
    :parameters (?p - package ?a - airplane ?ap - location ?c - city)
    :precondition (and
      (is_airplane ?a)
      (airport ?ap)
      (in_city ?ap ?c)
      (at ?p ?ap)
      (at ?a ?ap)
      (free ?p)
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?ap))
      (not (free ?p))
    )
  )

  (:action air_manager_unload_airplane
    :parameters (?p - package ?a - airplane ?ap - location ?c - city)
    :precondition (and
      (is_airplane ?a)
      (airport ?ap)
      (in_city ?ap ?c)
      (in ?p ?a)
      (at ?a ?ap)
    )
    :effect (and
      (at ?p ?ap)
      (not (in ?p ?a))
      (free ?p)
    )
  )

  (:action air_manager_fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (is_airplane ?a)
      (airport ?from)
      (airport ?to)
      (at ?a ?from)
      (in_city ?from ?c_from)
      (in_city ?to ?c_to)
      (not (same_city ?from ?to)) ; require airports in different cities (enforced by problem same_city facts)
      (not (at ?a ?to))           ; prevent no-op fly
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
      ; packages in ?a remain (in ?p ?a) and are implicitly transported
    )
  )
)