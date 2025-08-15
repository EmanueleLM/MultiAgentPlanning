(define (domain delivery)
  (:requirements :typing)
  (:types truck package location)

  (:predicates
    (at-truck    ?t - truck      ?l - location)   ; truck’s current location
    (at-pkg      ?p - package    ?l - location)   ; package’s current location
    (in          ?p - package    ?t - truck)       ; package inside truck
  )

  ; 1. Load the package onto the truck
  (:action load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                     (at-truck ?t ?l)
                     (at-pkg   ?p ?l)
                     (not (in ?p ?t))
                  )
    :effect (and
               (in ?p ?t)
               (not (at-pkg ?p ?l))
             )
  )

  ; 2. Unload the package from the truck
  (:action unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                     (at-truck ?t ?l)
                     (in       ?p ?t)
                  )
    :effect (and
               (at-pkg ?p ?l)
               (not (in ?p ?t))
             )
  )

  ; 3. Move the truck from one location to the other
  (:action move
    :parameters (?t - truck ?l1 - location ?l2 - location)
    :precondition (at-truck ?t ?l1)
    :effect (and
               (at-truck ?t ?l2)
               (not (at-truck ?t ?l1))
            )
  )
)