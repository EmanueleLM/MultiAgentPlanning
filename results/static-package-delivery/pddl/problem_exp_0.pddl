(define (problem deliver-package)
  (:domain truck)

  ;; ----------------------------------------------------
  ;; Objects in the world
  (:objects
    truck1     - truck
    package1   - package
    post-office house   - location
  )

  ;; ----------------------------------------------------
  ;; Initial situation
  (:init
    (at truck1 post-office)    ; truck starts at the post‑office
    (at-pkg package1 post-office)   ; the package starts at the post‑office
  )

  ;; ----------------------------------------------------
  ;; Goal
  (:goal (at-pkg package1 house))
)