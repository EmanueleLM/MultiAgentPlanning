(define (problem meet-sarah-and-friends)
  (:domain multiagent-meetings)
  (:objects
    traveler - agent
    sunset-district union-square - location
  )
  (:init
    (= (current-time) 540)    ; start at 09:00 = 9*60 = 540
    (= (total-meetings) 0)
    (at-traveler-sd)          ; traveler starts at Sunset District at 09:00
    ; Sarah's concrete availability is enforced by preconditions on meet-sarah action:
    ; she is available only for meeting actions that start >= 750 and end <= 1290.
  )
  (:goal (and
    (sarah-met)               ; must meet Sarah at least once for >=15 minutes inside her window
  ))
  ; Objective: maximize number of meetings, secondary objective: minimize finishing time.
  ; Encoded as minimizing (current-time - 1000 * total-meetings) so meeting count is strongly prioritized.
  (:metric minimize (+ (current-time) (* -1000 (total-meetings))))
)