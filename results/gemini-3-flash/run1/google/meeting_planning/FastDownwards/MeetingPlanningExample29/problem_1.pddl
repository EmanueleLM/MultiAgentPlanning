(define (problem meet-nancy-sf)
  (:domain meeting_planning)
  (:objects
    sunset_district haight_ashbury - location
    t0900 t0915 t1930 t2045 t2145 - time
  )
  (:init
    (at sunset_district)
    (time-at t0900)
    (connected sunset_district haight_ashbury)
    (connected haight_ashbury sunset_district)
    (next t0900 t0915)
    (duration-15min t0900 t0915)
    (next t0915 t1930)
    (next t1930 t2045)
    (duration-75min t1930 t2045)
    (next t2045 t2145)
    (is-nancy-at haight_ashbury t1930 t2045)
  )
  (:goal (met-nancy))
)