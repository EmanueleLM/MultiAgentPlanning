(define (problem deliver-package)
  (:domain truck-delivery)

  (:objects
    post-office   house   - location
  )

  (:init
    (truck-at post-office)     ;; the truck starts at the post‑office
    (package-at post-office)   ;; the package also starts there
  )

  (:goal
    (package-at house)         ;; the end‑state we want
  )
)