(define (problem schedule-problem)
  (:domain schedule-meetings)
  (:objects
    traveler paul - person
    richmond-district nob-hill - location
  )
  (:init
    ; Traveler arrival: 9:00AM -> time 0
    (at traveler richmond-district)

    ; met-count initial
    (= (met-count) 0)

    ; Paul's availability as timed initial literals.
    ; Time origin: 0 = 9:00AM.
    ; Paul is available from 9:30AM to 11:15AM -> [30, 135] minutes.
    (at 30 (paul-available))
    (at 135 (not (paul-available)))
  )

  ; No mandatory goal: planner should maximize met-count.
  (:goal (and))

  ; Maximize the number of meetings (met-count). This makes meeting Paul a planner objective.
  (:metric maximize (met-count))
)