(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    north_beach alamo_square - location
    t0900 t0916 t1930 t1945 t2100 - time
    emily - person
  )
  (:init
    (at north_beach)
    (current_time t0900)
    (can_travel north_beach alamo_square t0900 t0916)
    (can_wait t0916 t1930)
    (can_wait t1945 t2100)
    (can_meet emily alamo_square t1930 t1945)
    (= (total-cost) 0)
  )
  (:goal (met emily))
  (:metric minimize (total-cost))
)