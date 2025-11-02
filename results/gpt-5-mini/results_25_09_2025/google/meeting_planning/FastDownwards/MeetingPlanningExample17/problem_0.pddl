(define (problem orchestrate-meeting)
  (:domain orchestrator)

  ;; NOTE: Time is expressed in minutes relative to 09:00 (09:00 == time 0).
  ;; Matthew is available from 13:30 to 14:30 -> relative times 270..330.
  (:objects
    traveler matthew - agent
    AlamoSquare SunsetDistrict - location
  )

  (:init
    ;; Traveler initial location at 09:00 (time 0)
    (at traveler AlamoSquare)

    ;; Start with zero meetings counted
    (= (meetings-count) 0)

    ;; Timed Initial Literals (represent Matthew's availability window at SunsetDistrict)
    ;; At relative time 270 (13:30), Matthew becomes present at SunsetDistrict.
    (at 270 (at matthew SunsetDistrict))
    ;; At relative time 330 (14:30), Matthew is no longer present.
    (at 330 (not (at matthew SunsetDistrict)))
  )

  ;; Goal: ensure a meeting with Matthew is achieved (meeting required).
  (:goal
    (met-matthew)
  )

  ;; Also maximize the number of meetings (primary objective is to meet Matthew;
  ;; metric aims to maximize meetings-count if additional meetings become available).
  (:metric maximize (meetings-count))
)