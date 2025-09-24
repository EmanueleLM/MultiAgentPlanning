(define (problem orchestrate-meetings-problem)
  (:domain orchestrated-meetings)
  (:objects
    you agent2 - agent
    presidio north_beach - location
  )
  (:init
    ;; Both agents start at Presidio at 09:00 -> 9*60 = 540 minutes since midnight
    (at you presidio)
    (at agent2 presidio)

    ;; Betty is available at North Beach between 18:45 (1125) and 22:00 (1320).
    (betty-at north_beach)

    (= (time) 540)
    (= (meetings-count) 0)
  )

  ;; Goal: ensure that "you" meet Betty for at least 75 minutes.
  ;; The planner will also maximize the total number of meetings via the metric below.
  (:goal (met you))

  ;; Maximize total completed meetings (each meeting is 75 minutes).
  (:metric maximize (meetings-count))
)