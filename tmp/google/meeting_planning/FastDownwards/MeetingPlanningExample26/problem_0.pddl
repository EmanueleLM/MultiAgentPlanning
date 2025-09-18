(define (problem integrated-meet-problem)
  (:domain integrated-meeting)
  (:objects
    traveler sarah - agent
    richmond presidio - location
  )

  (:init
    ;; Initial time: 09:00 = 540 minutes since midnight
    (= (current-time) 540)

    ;; Meeting-quality starts at 0
    (= (meeting-quality) 0)

    ;; Sarah's availability at Presidio: 13:15 (795) to 15:15 (915)
    (= (avail-start-presidio) 795)
    (= (avail-end-presidio) 915)

    ;; Initial locations
    (at traveler richmond)
    (at sarah presidio)
  )

  ;; Goal: meeting accomplished
  (:goal (met))

  ;; Metric: maximize meeting-quality (planner will prefer longer meetings up to Sarah's window)
  (:metric maximize (meeting-quality))
)