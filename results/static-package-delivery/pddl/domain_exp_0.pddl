(define (domain delivery)
  (:requirements :typing :strips)
  (:types truck package location - object)

  ;; ---------- Predicates ----------
  (:predicates
    ;; Where the truck and the package are
    (at_truck      ?t - truck     ?l - location)
    (at_package    ?p - package   ?l - location)

    ;; Whether the package is inside the truck
    (in            ?p - package   ?t - truck)
  )

  ;; ---------- Actions ----------
  ;; Move the truck from one location to another
  (:action move
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (at_truck ?t ?from)
    :effect (and
              (not (at_truck ?t ?from))
              (at_truck ?t ?to))
  )

  ;; Load the package onto the truck
  (:action load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at_truck ?t ?l)
                    (at_package ?p ?l))
    :effect (and
              (not (at_package ?p ?l))
              (in ?p ?t))
  )

  ;; Unload the package from the truck
  (:action unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at_truck ?t ?l)
                    (in ?p ?t))
    :effect (and
              (not (in ?p ?t))
              (at_package ?p ?l))
  )
)