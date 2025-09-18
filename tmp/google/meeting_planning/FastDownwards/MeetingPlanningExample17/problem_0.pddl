(define (problem orchestrate-meeting)
  (:domain orchestrated-travelers)
  (:objects
    traveler matthew - agent
    AlamoSquare SunsetDistrict - location
  )

  ;; We maximize number of meetings while ensuring the required meeting with Matthew.
  (:metric maximize (num-meetings))

  (:init
    ;; Start time: 09:00 = 540 minutes since midnight
    (= (time) 540)

    ;; Initial locations (resolved from inputs: both start at AlamoSquare)
    (at traveler AlamoSquare)
    (at matthew AlamoSquare)

    ;; Matthew's availability window: 13:30 (810) to 14:30 (870)
    (= (avail-start matthew) 810)
    (= (avail-end matthew) 870)

    ;; Initialize meeting counter
    (= (num-meetings) 0)
  )

  ;; Goal: ensure traveler meets Matthew (meeting must be within Matthew's availability)
  (:goal (met matthew traveler))
)