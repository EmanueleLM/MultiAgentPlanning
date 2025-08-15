(define (problem deliver-package)
  (:domain delivery)

  ; --------------------------------------------------------------------
  ; Objects
  ; --------------------------------------------------------------------
  (:objects
    truck - vehicle
    pkg   - package

    postoffice - location
    house      - location
  )

  ; --------------------------------------------------------------------
  ; Initial state
  ; --------------------------------------------------------------------
  (:init
    (at truck postoffice)
    (at pkg   postoffice)
    ; “in” is false by default – we do not need to mention it.
  )

  ; --------------------------------------------------------------------
  ; Goal
  ; --------------------------------------------------------------------
  (:goal
    (at pkg house))
)