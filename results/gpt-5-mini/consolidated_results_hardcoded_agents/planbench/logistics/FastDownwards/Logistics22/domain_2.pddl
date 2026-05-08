(define (domain multi_modal_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane - vehicle package location city)

  (:predicates
    ;; package at a location
    (at-package ?p - package ?l - location)
    ;; any vehicle (truck or airplane) at a location
    (at ?v - vehicle ?l - location)
    ;; package inside any vehicle
    (in ?p - package ?v - vehicle)
    ;; location -> city membership and airport marker
    (in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Generic load into a vehicle (truck or airplane)
  (:action load
    :parameters (?v - vehicle ?p - package ?l - location)
    :precondition (and
                    (at ?v ?l)
                    (at-package ?p ?l)
                    (not (in ?p ?v))
                  )
    :effect (and
              (not (at-package ?p ?l))
              (in ?p ?v)
            )
  )

  ;; Generic unload from a vehicle (truck or airplane)
  (:action unload
    :parameters (?v - vehicle ?p - package ?l - location)
    :precondition (and
                    (at ?v ?l)
                    (in ?p ?v)
                  )
    :effect (and
              (not (in ?p ?v))
              (at-package ?p ?l)
            )
  )

  ;; Drive a truck within its city
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (at ?t ?from)
                    (in-city ?from ?c)
                    (in-city ?to ?c)
                  )
    :effect (and
              (not (at ?t ?from))
              (at ?t ?to)
            )
  )

  ;; Fly an airplane between different cities (airports only)
  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
                    (at ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (in-city ?from ?c1)
                    (in-city ?to ?c2)
                    (not (= ?c1 ?c2))
                  )
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )
)