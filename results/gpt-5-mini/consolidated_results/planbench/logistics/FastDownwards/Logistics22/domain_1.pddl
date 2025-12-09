(define (domain multi_modal_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city stage)

  (:predicates
    ;; package at a location
    (at-package ?p - package ?l - location)
    ;; truck and airplane locations (separate predicates to keep typing explicit)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    ;; package inside truck or airplane
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    ;; city membership of locations and airport marker
    (in-city ?l - location ?c - city)
    (airport ?l - location)
    ;; two locations are in different cities (explicit facts in problem)
    (diff-city ?from - location ?to - location)
    ;; discrete stage/time ordering
    (next ?s - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Truck actions (namespaced 'truck-')
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at-truck ?t ?l)
                    (at-package ?p ?l)
                    (not (in-truck ?p ?t))
                  )
    :effect (and
              ;; advance the global stage (enforces sequential discrete time)
              (not (at-stage ?s))
              (at-stage ?s2)
              ;; package moves into truck (contiguous occupancy)
              (not (at-package ?p ?l))
              (in-truck ?p ?t)
            )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at-truck ?t ?l)
                    (in-truck ?p ?t)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (in-truck ?p ?t))
              (at-package ?p ?l)
            )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at-truck ?t ?from)
                    (in-city ?from ?c)
                    (in-city ?to ?c)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at-truck ?t ?from))
              (at-truck ?t ?to)
            )
  )

  ;; Airplane actions (namespaced 'plane-')
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at-airplane ?a ?l)
                    (at-package ?p ?l)
                    (not (in-airplane ?p ?a))
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at-package ?p ?l))
              (in-airplane ?p ?a)
            )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at-airplane ?a ?l)
                    (in-airplane ?p ?a)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (in-airplane ?p ?a))
              (at-package ?p ?l)
            )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
                    (at-stage ?s)
                    (next ?s ?s2)
                    (at-airplane ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (diff-city ?from ?to)
                  )
    :effect (and
              (not (at-stage ?s))
              (at-stage ?s2)
              (not (at-airplane ?a ?from))
              (at-airplane ?a ?to)
            )
  )
)