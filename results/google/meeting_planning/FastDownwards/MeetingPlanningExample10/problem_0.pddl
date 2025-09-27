(define (problem schedule-james-meeting)
  (:domain schedule-orchestration)
  (:objects
    traveler - agent
    golden-gate-park marina - location
  )

  (:init
    ;; You arrive at Golden Gate Park at 09:00 -> 9*60 = 540
    (= (time) 540)
    (at traveler golden-gate-park)
    (= (meeting-duration-james) 0)
    (= (total-meetings) 0)
    ;; Public/travel times are encoded as action durations in the domain; James' presence is encoded as a temporal constraint on the meeting action.
    ;; James will be at Marina District from 10:15 (615) to 13:30 (810) -- enforced in the meet-with-james action.
  )

  ;; Hard goal: ensure at least 15 minutes meeting with James within James' availability window.
  (:goal
    (and
      (>= (meeting-duration-james) 15)
    )
  )

  ;; Metric: primary objective maximize number of meetings; secondary objective earliest completion time.
  ;; We combine lexicographically by a single numeric objective that heavily weights total-meetings,
  ;; then prefers smaller global time (i.e., earlier finish).
  (:metric maximize
    (+ (* 10000 (total-meetings)) (- (time)))
  )
)