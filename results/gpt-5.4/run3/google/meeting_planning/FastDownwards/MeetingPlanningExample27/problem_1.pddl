(define (problem meet_margaret_san_francisco_instance)
  (:domain meet_margaret_san_francisco)

  (:objects
    marina_district pacific_heights - location
    margaret - person
    t0900 t1900 t1915 t1945 - timepoint
  )

  (:init
    (at marina_district)
    (current t0900)
    (pre_window)

    (connected marina_district pacific_heights)
    (connected pacific_heights marina_district)

    (available margaret pacific_heights t1900 t1945)
  )

  (:goal
    (and
      (met_minimum margaret)
    )
  )
)