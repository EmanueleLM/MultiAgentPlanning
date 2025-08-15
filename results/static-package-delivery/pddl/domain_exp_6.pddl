(define (domain delivery)
  (:requirements :strips)
  (:types truck package location)

  (:predicates
    ; The truck’s current location
    (at-truck    ?t - truck      ?l - location)

    ; The package’s current location when it is not inside the truck
    (at-package  ?p - package    ?l - location)

    ; The package is inside the truck
    (in          ?p - package    ?t - truck)
  )

  ; Move the truck from one location to another
  (:action move
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (at-truck ?t ?from)
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to))
  )

  ; Load a package into the truck
  (:action load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck    ?t ?l))
    :effect (and
      (not (at-package ?p ?l))
      (in          ?p ?t))
  )

  ; Unload a package from the truck
  (:action unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in          ?p ?t)
      (at-truck    ?t ?l))
    :effect (and
      (not (in          ?p ?t))
      (at-package ?p ?l))
  )
)