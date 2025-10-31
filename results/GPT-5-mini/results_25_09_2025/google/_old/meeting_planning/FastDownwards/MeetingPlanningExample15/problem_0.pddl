(define (problem integrated_schedule_problem)
  (:domain integrated_scheduling)
  (:objects
    ;; locations
    russian_hill golden_gate_park - location

    ;; person(s)
    john - person

    ;; candidate schedules
    s1 s2 - schedule
  )

  (:init
    ;; Starting location and user/john location markers
    (at russian_hill)
    (at-user russian_hill)
    (at-john golden_gate_park)

    ;; Global time: 09:00 = 9*60 = 540
    (= (time) 540)
    (= (initial-arrival) 540)

    ;; John's availability window: 13:00 (780) to 18:15 (1095)
    (= (john-start) 780)
    (= (john-end) 1095)
    ;; latest start to fit a 90-minute meeting: 1095 - 90 = 1005 (16:45)
    (= (john-latest-start) 1005)

    ;; Candidate schedules (in minutes from midnight)
    ;; s1: start 13:00 (780), duration 90 -> ends 870 (feasible)
    (= (start s1) 780)
    (= (duration s1) 90)

    ;; s2: start 16:30 (990), duration 120 -> ends 1110 (infeasible, after 18:15)
    (= (start s2) 990)
    (= (duration s2) 120)

    ;; Travel times (minutes)
    (= (travel-time russian_hill golden_gate_park) 21)
    (= (travel-time golden_gate_park russian_hill) 19)

    ;; initial met count
    (= (met-count) 0)
  )

  ;; Goal conditions:
  ;; - Meet John (so we select a schedule and actually perform the meeting)
  ;; - Validate the feasible candidate schedule s1
  ;; - Do not validate the infeasible candidate s2
  (:goal (and
    (met john)
    (valid s1)
    (not (valid s2))
  ))

  ;; Optimize to maximize number of friends met (met-count).
  (:metric maximize (met-count))
)