(define (domain multi_modal_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane - vehicle package location city stage)

  (:predicates
    ;; package at a location
    (at-package ?p - package ?l - location)
    ;; any vehicle (truck or airplane) at a location
    (at ?v - vehicle ?l - location)
    ;; package inside any vehicle
    (in ?p - package ?v - vehicle)
    ;; location -> city membership
    (in-city ?l - location ?c - city)
    ;; airport marker for locations
    (airport ?l - location)
    ;; ordered discrete stages for explicit temporal progression
    (next ?s - stage ?s2 - stage)
    ;; current stage token (exactly one holds initially and after each action)
    (at-stage ?s - stage)
  )

  ;; Load a package into a truck: package and truck must be co-located; advances stage
  (:action load-truck
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at ?t ?l)
                    (at-package ?p ?l)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at-package ?p ?l))
              (in ?p ?t)
            )
  )

  ;; Unload a package from a truck: package must be in truck and truck at the location; advances stage
  (:action unload-truck
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at ?t ?l)
                    (in ?p ?t)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (in ?p ?t))
              (at-package ?p ?l)
            )
  )

  ;; Load a package into an airplane: package and airplane must be at the same airport; advances stage
  (:action load-plane
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at ?a ?l)
                    (airport ?l)
                    (at-package ?p ?l)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at-package ?p ?l))
              (in ?p ?a)
            )
  )

  ;; Unload a package from an airplane: package must be in airplane and airplane at the airport; advances stage
  (:action unload-plane
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at ?a ?l)
                    (airport ?l)
                    (in ?p ?a)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (in ?p ?a))
              (at-package ?p ?l)
            )
  )

  ;; Drive a truck within its city: requires truck at from-location and both locations in same city; advances stage
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at ?t ?from)
                    (in-city ?from ?c)
                    (in-city ?to ?c)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at ?t ?from))
              (at ?t ?to)
            )
  )

  ;; Fly an airplane between different cities using airports: requires airplane at from airport and airports in different cities; advances stage
  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (in-city ?from ?c1)
                    (in-city ?to ?c2)
                    (not (= ?c1 ?c2))
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at ?a ?from))
              (at ?a ?to)
            )
  )
)