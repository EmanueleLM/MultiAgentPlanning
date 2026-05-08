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
    (connected porto vienna)
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
  )
  (:goal
    (and
      (exists (?d - day) (workshop_attended ?d))
      (forall (?d - day) (imply (or (= ?d day_1) (= ?d day_2) (= ?d day_3)) (visited prague ?d)))
      (forall (?d - day) (imply (or (= ?d day_4) (= ?d day_5) (= ?d day_6)) (visited vienna ?d)))
      (forall (?d - day) (imply (or (= ?d day_7) (= ?d day_8) (= ?d day_9)) (visited porto ?d)))
    )
  )
)