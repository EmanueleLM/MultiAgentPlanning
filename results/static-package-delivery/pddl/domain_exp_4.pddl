(define (domain truckpkg)
  (:requirements :strips :typing)

  ;; Types ---------------------------------------------------------
  (:types truck package location)

  ;; Predicates ----------------------------------------------------
  (:predicates
    (at ?t - truck ?l - location)          ; truck is at a location
    (at-pkg ?p - package ?l - location)    ; package is at a location
    (in ?p - package ?t - truck)           ; package is inside the truck
    (adjacent ?l1 - location ?l2 - location) ; two locations are connected
  )

  ;; Actions ------------------------------------------------------
  ;; Move the truck between adjacent locations
  (:action move
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                   (at ?t ?from)
                   (adjacent ?from ?to))
    :effect (and
             (not (at ?t ?from))
             (at ?t ?to)))

  ;; Load a package into the truck (the truck and package must be together)
  (:action load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                   (at ?t ?l)
                   (at-pkg ?p ?l)
                   (not (in ?p ?t)))
    :effect (and
             (not (at-pkg ?p ?l))
             (in ?p ?t)))

  ;; Unload a package from the truck (the truck must be at the same location)
  (:action unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                   (at ?t ?l)
                   (in ?p ?t))
    :effect (and
             (not (in ?p ?t))
             (at-pkg ?p ?l)))
)