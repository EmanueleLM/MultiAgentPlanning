(define (domain truck-delivery)
  (:requirements :typing)

  (:types location)

  ;; Predicates -----------------------------------------------------
  (:predicates
    (truck-at      ?l - location)   ;; the truck’s current position
    (package-at    ?l - location)   ;; where the package is standing
    (in-package)                     ;; the package is inside the truck
  )

  ;; Actions --------------------------------------------------------
  (action move
    :parameters (?from - location ?to - location)
    :precondition (truck-at ?from)
    :effect (and
              (not (truck-at ?from))
              (truck-at ?to))
  )

  (action load
    :parameters (?loc - location)
    :precondition (and
                    (truck-at ?loc)
                    (package-at ?loc))
    :effect (and
              (not (package-at ?loc))
              (in-package))
  )

  (action unload
    :parameters (?loc - location)
    :precondition (and
                    (truck-at ?loc)
                    (in-package))
    :effect (and
              (not (in-package))
              (package-at ?loc))
  )
)