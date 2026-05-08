(define (problem transport-instance-1)
  (:domain multiagent-transport)

  (:objects
    ;; days (explicit timeline to enforce ordering and contiguity)
    day1 day2 day3 day4 - day

    ;; agents / vehicles
    truck1 - truck
    plane1 - airplane

    ;; packages
    p1 - package

    ;; locations (typed)
    d1 d2 - depot
    a1 a2 - airport
  )

  (:init
    ;; days and successor links (enforce exact step ordering)
    (day day1) (day day2) (day day3) (day day4)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)

    ;; initial vehicle locations at day1
    (vehicle-at truck1 d1 day1)
    (vehicle-at plane1 a1 day1)

    ;; initial package location at day1
    (package-at p1 d1 day1)

    ;; static connectivity (do not invent connections beyond these)
    ;; Roads: truck can move between depot d1 and airport a1, and between airport a2 and depot d2.
    (road d1 a1) (road a1 d1)
    (road a2 d2) (road d2 a2)

    ;; Air routes: airplane can fly between airport a1 and airport a2 (bi-directional).
    (airroute a1 a2) (airroute a2 a1)
  )

  (:goal (and
    ;; Mandated terminal condition: package p1 must be at depot d2 on the final day (day4).
    ;; This fixes the required sequence (truck to a1, plane to a2, truck to d2) over consecutive days.
    (package-at p1 d2 day4)
  ))
)