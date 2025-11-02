(define (problem meetup-you-george)
  (:domain meetup-day)

  (:objects
    northbeach haight - location
    you george - agent
  )

  ;; Initial state:
  ;; - Visitor ("you") arrives at North Beach at 09:00 = 540 minutes.
  ;; - George is present in Haight-Ashbury from 07:30 (450) to 13:15 (795).
  ;;   (George's presence window is enforced in meeting preconditions.)
  ;; - No meeting has occurred yet; counters start at zero.
  (:init
    (at you northbeach)

    ;; time in minutes since midnight: 09:00 = 540
    (= (time) 540)

    (= (total-cost) 0)
    (= (meetings-count) 0)
    (= (total-travel-time) 0)
    (= (total-meeting-time) 0)

    ;; No meeting has happened yet
    ;; (met-george) absent means false initially
  )

  ;; Goal: allow the planner to decide when to finish the day.
  ;; The explicit goal is to have executed end-day (done).
  (:goal (done))

  ;; Optimization objective: minimize total-cost.
  ;; total-cost is constructed such that:
  ;;   total-cost = -10000 * meetings_count - 1 * total_meeting_time + 1 * total_travel_time
  ;; This yields the lexicographic preference:
  ;;   1) maximize number of meetings (most heavily weighted)
  ;;   2) maximize total meeting time (next weight)
  ;;   3) minimize total travel time (small positive cost per minute)
  (:metric minimize (total-cost))
)