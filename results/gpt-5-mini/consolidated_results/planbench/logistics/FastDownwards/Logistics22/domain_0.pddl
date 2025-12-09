(define (domain multi_modal_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane - vehicle package location)

  (:predicates
    ;; package location predicate
    (at-package ?p - package ?l - location)
    ;; vehicle location predicate
    (at-vehicle ?v - vehicle ?l - location)
    ;; package-in-vehicle
    (in ?p - package ?v - vehicle)
    ;; connectivity for truck (road) and airplane (air)
    (road-connected ?from - location ?to - location)
    (air-connected ?from - location ?to - location)
  )

  ;; Truck agent actions (namespaced with 'truck-')
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at-vehicle ?t ?l)
                    (at-package ?p ?l)
                    (not (in ?p ?t))
                  )
    :effect (and
              (not (at-package ?p ?l))
              (in ?p ?t)
            )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at-vehicle ?t ?l)
                    (in ?p ?t)
                    (not (at-package ?p ?l))
                  )
    :effect (and
              (not (in ?p ?t))
              (at-package ?p ?l)
            )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at-vehicle ?t ?from)
                    (road-connected ?from ?to)
                  )
    :effect (and
              (not (at-vehicle ?t ?from))
              (at-vehicle ?t ?to)
            )
  )

  ;; Airplane agent actions (namespaced with 'plane-')
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (at-vehicle ?a ?l)
                    (at-package ?p ?l)
                    (not (in ?p ?a))
                  )
    :effect (and
              (not (at-package ?p ?l))
              (in ?p ?a)
            )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (at-vehicle ?a ?l)
                    (in ?p ?a)
                    (not (at-package ?p ?l))
                  )
    :effect (and
              (not (in ?p ?a))
              (at-package ?p ?l)
            )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                    (at-vehicle ?a ?from)
                    (air-connected ?from ?to)
                  )
    :effect (and
              (not (at-vehicle ?a ?from))
              (at-vehicle ?a ?to)
            )
  )
)