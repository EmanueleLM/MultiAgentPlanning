(define (problem meet_john_problem)
  (:domain meeting_planning)
  (:objects
    russian_hill golden_gate_park - location
    t0900 t0921 t1300 t1430 - time
    john - person
  )
  (:init
    (at russian_hill)
    (time_at t0900)
  )
  (:goal
    (met john)
  )
)