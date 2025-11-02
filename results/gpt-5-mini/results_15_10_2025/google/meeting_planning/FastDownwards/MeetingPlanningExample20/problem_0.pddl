(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    visitor joseph - person
    chinatown nobhill - location
  )
  ;; Time 0 in this problem corresponds to 09:00 (09:00 = baseline).
  ;; Minutes are the time unit. Joseph becomes available at 11:30 (150 minutes after 09:00)
  ;; and stops being available at 15:15 (375 minutes after 09:00).
  (:init
    ;; Visitor arrives at Chinatown at 09:00 (baseline time 0)
    (at visitor chinatown)
    ;; Joseph is located at Nob Hill (his availability is time-windowed below)
    (at joseph nobhill)

    ;; Timed initial literals express Joseph's availability window:
    ;; joseph-available becomes true at 11:30 (150 minutes after baseline)
    (at 150 (joseph-available))
    ;; and becomes false at 15:15 (375 minutes after baseline)
    (at 375 (not (joseph-available)))
  )

  ;; Goal: have the meeting with Joseph completed (meeting must last at least 75 minutes,
  ;; entirely during Joseph's availability window at Nob Hill).
  (:goal (meeting-done))

  ;; Encourage earliest feasible schedule (planner will minimize makespan).
  (:metric minimize (total-time))
)