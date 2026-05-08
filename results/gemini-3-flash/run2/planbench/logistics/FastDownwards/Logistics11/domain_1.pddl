(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    locatable city location - object
    truck airplane package - locatable
  )
  (:predicates
    ;; An object is at a specific location
    (at ?obj - locatable ?loc - location)
    ;; A package is loaded inside a truck
    (in_truck ?pkg - package ?truck - truck)
    ;; A package is loaded inside an airplane
    (in_airplane ?pkg - package ?airplane - airplane)
    ;; A location is an airport
    (is_airport ?loc - location)
    ;; A location belongs to a specific city
    (in_city ?loc - location ?city - city)
  )

  ;; Load a package into a truck at a specific location
  (:action load_truck
    :parameters (?p - package ?v - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?v ?l))
    :effect (and (not (at ?p ?l)) (in_truck ?p ?v))
  )

  ;; Unload a package from a truck at a specific location
  (:action unload_truck
    :parameters (?p - package ?v - truck ?l - location)
    :precondition (and (in_truck ?p ?v) (at ?v ?l))
    :effect (and (not (in_truck ?p ?v)) (at ?p ?l))
  )

  ;; Load a package into an airplane at a specific location
  (:action load_airplane
    :parameters (?p - package ?v - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?v ?l))
    :effect (and (not (at ?p ?l)) (in_airplane ?p ?v))
  )

  ;; Unload a package from an airplane at a specific location
  (:action unload_airplane
    :parameters (?p - package ?v - airplane ?l - location)
    :precondition (and (in_airplane ?p ?v) (at ?v ?l))
    :effect (and (not (in_airplane ?p ?v)) (at ?p ?l))
  )

  ;; Drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?v - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?v ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (not (at ?v ?from)) (at ?v ?to))
  )

  ;; Fly an airplane between two airports
  (:action fly_airplane
    :parameters (?v - airplane ?from - location ?to - location)
    :precondition (and (at ?v ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at ?v ?from)) (at ?v ?to))
  )
)