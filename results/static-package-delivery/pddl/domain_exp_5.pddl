(define (domain delivery)

  ; --------------------------------------------------------------------
  ; Types
  ; --------------------------------------------------------------------
  (:types
    vehicle   ; only the truck
    package   ; only the single package
    location  ; the post office and the house

    ; the top‑level type is implicit – objects of the above types are
    ; considered “objects” by PDDL.
  )

  ; --------------------------------------------------------------------
  ; Predicates
  ; --------------------------------------------------------------------
  (:predicates
    ; The truck, the package and the locations.
    (at ?obj - object ?loc - location)

    ; “in” indicates that a package is inside the truck.
    (in ?pkg - package)
  )

  ; --------------------------------------------------------------------
  ; Actions
  ; --------------------------------------------------------------------
  (:action drive
    :parameters (?v   - vehicle
                ?from - location
                ?to   - location)
    :precondition (and
                   (at ?v ?from))
    :effect (and
             (not (at ?v ?from))
             (at ?v ?to))
  )

  (:action load
    :parameters (?loc - location)
    :precondition (and
                   (at truck ?loc)
                   (at pkg ?loc))
    :effect (and
             (not (at pkg ?loc))
             (in pkg))
  )

  (:action unload
    :parameters (?loc - location)
    :precondition (and
                   (at truck ?loc)
                   (in pkg))
    :effect (and
             (not (in pkg))
             (at pkg ?loc))
  )
)