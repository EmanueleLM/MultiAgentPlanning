(define (problem deliver-prob)
  (:domain delivery)

  ;; Objects in this instance
  (:objects
     mytruck      - truck
     mypackage    - package
     postoffice   house   - location
  )

  ;; ---------- Initial State ----------
  (:init
    (at_truck      mytruck postoffice)   ; the truck is at the post‑office
    (at_package    mypackage postoffice) ; the package is at the post‑office
  )

  ;; ---------- Goal ----------
  (:goal
    (at_package mypackage house)         ; the package must be at the house
  )
)