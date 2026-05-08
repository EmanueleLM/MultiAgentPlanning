(define (domain transport)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: trucks and airplanes are modeled as distinct types;
  ;; we treat them as vehicle subtypes for the in/at_v predicates by declaring them
  (:types truck airplane vehicle package location city)
  ;; Note: PDDL type hierarchy: truck and airplane are considered vehicles in predicates by declaring their types
  ;; (some planners accept explicit subtype syntax; we keep types explicit and typed parameters in predicates/actions)

  (:predicates
    ;; package on-ground location
    (at ?p - package ?l - location)
    ;; vehicle at location (applies to trucks and airplanes through typed params)
    (at_v ?v - vehicle ?l - location)
    ;; package is inside a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)

    ;; location/city and airport/connectivity facts
    (airport ?l - location)
    (in_city ?l - location ?c - city)
    (same_city ?l1 - location ?l2 - location)
    (can_fly ?from - location ?to - location)

    ;; airplane ground token (load/unload require on-ground)
    (on_ground ?a - airplane)

    ;; concurrency/resource tokens (modeled as boolean predicates)
    (busy ?v - vehicle)       ;; vehicle busy; actions require not busy to start
    (locked ?p - package)     ;; package locked to prevent simultaneous operations (precondition only in this atomic model)
  )

  ;; TRUCK actions (intra-city driving only; explicit same_city predicate is required)
  (:action drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at_v ?t ?from)
                    (same_city ?from ?to)
                    (not (= ?from ?to))
                    (not (busy ?t)))
    :effect (and
              (not (at_v ?t ?from))
              (at_v ?t ?to))
  )

  (:action load-into-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at ?p ?l)
                    (at_v ?t ?l)
                    (not (busy ?t))
                    (not (locked ?p)))
    :effect (and
              (in ?p ?t)
              (not (at ?p ?l)))
  )

  (:action unload-from-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (in ?p ?t)
                    (at_v ?t ?l)
                    (not (busy ?t))
                    (not (locked ?p)))
    :effect (and
              (at ?p ?l)
              (not (in ?p ?t)))
  )

  ;; AIRPLANE actions (airport-only load/unload; flights between permitted airport pairs)
  (:action load-into-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (at ?p ?l)
                    (at_v ?a ?l)
                    (airport ?l)
                    (on_ground ?a)
                    (not (busy ?a))
                    (not (locked ?p)))
    :effect (and
              (in ?p ?a)
              (not (at ?p ?l)))
  )

  (:action unload-from-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (in ?p ?a)
                    (at_v ?a ?l)
                    (airport ?l)
                    (on_ground ?a)
                    (not (busy ?a))
                    (not (locked ?p)))
    :effect (and
              (at ?p ?l)
              (not (in ?p ?a)))
  )

  (:action fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                    (at_v ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (can_fly ?from ?to)
                    (on_ground ?a)
                    (not (busy ?a)))
    :effect (and
              ;; airplane changes airport location directly; load/unload require on_ground at the location, so
              ;; inter-modal ordering (unload before load, etc.) is enforced by preconditions on load/unload.
              (not (at_v ?a ?from))
              (at_v ?a ?to))
  )
)