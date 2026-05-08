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
    (can_travel russian_hill golden_gate_park t0900 t0921)
    (can_wait golden_gate_park t0921 t1300)
    (can_meet john golden_gate_park t1300 t1430)
  )
  (:goal
    (met john)
  )
)