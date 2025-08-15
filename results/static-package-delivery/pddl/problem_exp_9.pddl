(define (problem deliver-package)
  (:domain logistics-simple)

  ;;; --------------------------------------------------------------
  ;;; Objects
  ;;; --------------------------------------------------------------
  (:objects
    mytruck   - truck
    pkg1      - package
    post-office house - location
  )

  ;;; --------------------------------------------------------------
  ;;; Initial state
  ;;; --------------------------------------------------------------
  (:init
    ; truck and package start at the post‑office
    (at mytruck post-office)
    (at pkg1 post-office)

    ; the package is not in the truck
    ; (the absence of (in pkg1 mytruck) is implicit)
  )

  ;;; --------------------------------------------------------------
  ;;; Goal
  ;;; --------------------------------------------------------------
  (:goal (and
           (at pkg1 house)
         ))
)