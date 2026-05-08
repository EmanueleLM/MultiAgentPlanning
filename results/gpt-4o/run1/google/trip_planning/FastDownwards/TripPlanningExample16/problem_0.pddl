(define (problem european_trip_plan)
  (:domain european_trip)
  (:objects
    prague vienna porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )
  (:init
    (at prague day_1)
    (connected prague vienna)
    (connected vienna porto)
  )
  (:goal
    (and
      (or (workshop_attended day_1) (workshop_attended day_2) (workshop_attended day_3))
      (forall (?d - day) (imply (or (= ?d day_1) (= ?d day_2) (= ?d day_3)) (visited_prague ?d)))
      (forall (?d - day) (imply (or (= ?d day_4) (= ?d day_5) (= ?d day_6)) (visited_vienna ?d)))
      (forall (?d - day) (imply (or (= ?d day_7) (= ?d day_8) (= ?d day_9)) (visited_porto ?d)))
    )
  )
)