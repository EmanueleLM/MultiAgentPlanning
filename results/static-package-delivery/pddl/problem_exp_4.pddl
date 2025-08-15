(define (problem deliver-pkg)
  (:domain truckpkg)

  ;; Objects -------------------------------------------------------
  (:objects
    t1 - truck
    pkg1 - package
    postoffice house - location)

  ;; Initial state -------------------------------------------------
  (:init
    (at t1 postoffice)            ; truck starts at the post‑office
    (at-pkg pkg1 postoffice)      ; package starts at the post‑office
    (adjacent postoffice house)   ; the only two reachable locations
    (adjacent house postoffice))

  ;; Goal ----------------------------------------------------------
  (:goal (at-pkg pkg1 house))
)