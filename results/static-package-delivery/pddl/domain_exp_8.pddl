(define (domain truck-delivery)
  (:requirements :typing :strips)

  ;--------------------------------------------------------------------
  ; Types
  (:types truck package loc)

  ;--------------------------------------------------------------------
  ; Predicates
  (:predicates
    (at-truck   ?t - truck   ?l - loc)   ; the truck’s current location
    (at-pkg     ?p - package ?l - loc)   ; the package’s current location
    (in-pkg     ?p - package ?t - truck) ; the package is inside the truck
  )

  ;--------------------------------------------------------------------
  ; Actions

  ; Move the truck from one location to another
  (:action move
    :parameters (?t - truck ?from - loc ?to - loc)
    :precondition (at-truck ?t ?from)
    :effect (and
              (not (at-truck ?t ?from))
              (at-truck ?t ?to))
  )

  ; Load the package into the truck (only possible when both are at the same place)
  (:action load
    :parameters (?t - truck ?p - package ?l - loc)
    :precondition (and
                    (at-truck ?t ?l)
                    (at-pkg   ?p ?l)
                    (not (in-pkg ?p ?t)))
    :effect (and
              (not (at-pkg ?p ?l))
              (in-pkg  ?p ?t))
  )

  ; Unload the package from the truck (only possible when the truck is at that place)
  (:action unload
    :parameters (?t - truck ?p - package ?l - loc)
    :precondition (and
                    (at-truck ?t ?l)
                    (in-pkg    ?p ?t))
    :effect (and
              (not (in-pkg ?p ?t))
              (at-pkg   ?p ?l))
  )
)