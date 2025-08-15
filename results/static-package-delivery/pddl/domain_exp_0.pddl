(define (domain truck)
  (:requirements :typing :strips)

  ;; ----------------------------------------------------
  ;; Types
  (:types truck package location)

  ;; ----------------------------------------------------
  ;; Predicates
  (:predicates
    (at      ?t - truck    ?l - location)   ; truck is at a location
    (at-pkg  ?p - package  ?l - location)   ; package is on the ground at a location
    (in      ?p - package  ?t - truck)      ; package is inside the truck
  )

  ;; ----------------------------------------------------
  ;; Actions
  (:action move-to-house
    :parameters (?t - truck)
    :precondition (at ?t post-office)
    :effect (and
              (at ?t house)
              (not (at ?t post-office)))
  )

  (:action move-to-postoffice
    :parameters (?t - truck)
    :precondition (at ?t house)
    :effect (and
              (at ?t post-office)
              (not (at ?t house)))
  )

  (:action load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at ?t ?l)
                    (at-pkg ?p ?l))
    :effect (and
              (in ?p ?t)
              (not (at-pkg ?p ?l)))
  )

  (:action unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at ?t ?l)
                    (in ?p ?t))
    :effect (and
              (at-pkg ?p ?l)
              (not (in ?p ?t)))
  )
)