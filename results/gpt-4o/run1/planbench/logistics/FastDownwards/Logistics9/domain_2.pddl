(define (domain logistics)
  (:requirements :strips :typing)
  (:types 
    vehicle - object
    truck airplane - vehicle
    package - object
    location city - object
  )
  (:predicates 
    (at ?vehicle - vehicle ?location - location)
    (at ?package - package ?location - location)
    (in ?package - package ?vehicle - vehicle)
    (airport ?location - location)
    (in_city ?location - location ?city - city)
  )
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and 
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and 
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and 
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and 
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and 
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and 
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and 
      (in ?p ?a)
      (at ?a ?l)
    )
    :effect (and 
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
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
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and 
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and 
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)