(define (problem meeting-planning-example)
  (:domain meeting-planning)
  (:objects
    traveler - agent
    friend - agent
    marina mission - location
  )
  (:init
    (= (total-cost) 0) ; Initialize total cost to 0
    (at traveler marina) ; Traveler starts at Marina District
    
    ;; Timed Initial Literals for Stephanie's availability at Mission District
    ;; Stephanie is available from 10:30 AM (90 minutes after 9:00 AM start time)
    (at 90 (available friend mission))
    ;; Stephanie becomes unavailable at 1:30 PM (270 minutes after 9:00 AM start time)
    (at 270 (not (available friend mission)))
  )
  (:goal
    (and
      (meeting-happened traveler friend) ; The goal is for the meeting to have successfully happened
    )
  )
  (:metric minimize (total-cost)) ; Minimize the total cost of actions (e.g., travel)
)