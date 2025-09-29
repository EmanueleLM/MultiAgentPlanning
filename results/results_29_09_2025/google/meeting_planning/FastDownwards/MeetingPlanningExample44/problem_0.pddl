(define (problem meeting-problem)
  (:domain meeting-domain)

  (:objects
    traveler betty - agent
    pacific fishermans - location
  )

  (:init
    ;; Locations at initial time
    (at traveler pacific)
    (at betty fishermans)

    ;; Numeric clock and availability bounds expressed in minutes since midnight
    ;; 08:45 = 525, 09:00 = 540, 18:00 = 1080
    (= (clock) 540)
    (= (meeting-time) 0)
    (= (betty-start) 525)
    (= (betty-end) 1080)
  )

  ;; Hard goal: ensure at least the minimum required meeting time (105 minutes)
  (:goal (and (>= (meeting-time) 105)))

  ;; Optimize: prefer schedules that maximize total meeting time
  (:metric maximize (meeting-time))
)