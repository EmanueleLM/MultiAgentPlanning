(define (problem travel-integration-problem)
  (:domain travel-integration)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    (workshop-day d1) (workshop-day d2) (workshop-day d3)

    (ready d1)

    (unassigned d1) (unassigned d2) (unassigned d3)
    (unassigned d4) (unassigned d5) (unassigned d6)
    (unassigned d7) (unassigned d8) (unassigned d9)

    (direct prague vienna) (direct vienna prague)
    (direct vienna porto)  (direct porto vienna)

    (is-prague prague)

    (last prague)

    (last-day d9)
  )

  (:goal (and
    (at d1 prague)
    (at d2 prague)
    (at d3 prague)
    (at d4 vienna)
    (at d5 vienna)
    (at d6 vienna)
    (at d7 porto)
    (at d8 porto)
    (at d9 porto)
  ))
)