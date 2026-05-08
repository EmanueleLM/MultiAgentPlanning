(define (problem MeetingPlanningExample9-problem)
  (:domain MeetingPlanningExample9)
  (:objects
    traveler mary - person
    union_square nob_hill - location
  )

  ;; Initial state:
  ;; - Traveler is at Union Square at 09:00 -> time = 0 ticks.
  ;; - No meeting ticks accumulated.
  ;; Note: Mary's presence at Nob Hill is time-window constrained and enforced by the meet_mary_5 action preconditions.
  (:init
    (at traveler union_square)
    ;; numeric fluents
    (= (time) 0)
    (= (meet_ticks) 0)
  )

  ;; Goal: accumulate at least 15 meeting ticks (15 * 5 = 75 minutes) with Mary within her availability window.
  (:goal (>= (meet_ticks) 15))

  ;; Notes:
  ;; - One tick = 5 minutes.
  ;; - Mary's availability is constrained in the meet_mary_5 precondition:
  ;;   earliest tick = 36 (12:00), latest allowed end tick = 87 (16:15).
  ;; - Movement durations are rounded up to 5-minute ticks:
  ;;   Union Square -> Nob Hill: 9 min -> 2 ticks (10 minutes).
  ;;   Nob Hill -> Union Square: 7 min -> 2 ticks (10 minutes).
)