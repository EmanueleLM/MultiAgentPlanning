(define (problem meet-joshua-problem-classical)
  (:domain meeting-schedule-classical)

  (:objects
    you - agent
    joshua - person
    union-square chinatown - location
    time540 time1080 time1087 time1162 - time
  )

  (:init
    ;; Traveler arrives at Union Square at 09:00 (time540)
    (at union-square)
    (at-time time540)

    ;; Allow advancing from arrival to Joshua's availability window at 18:00
    (adv-gap time540 time1080)

    ;; Travel time Union Square <-> Chinatown = 7 minutes (18:00 -> 18:07)
    (adv7 time1080 time1087)

    ;; A 75-minute meeting starting at 18:07 ends at 19:22
    (adv75 time1087 time1162)

    ;; Only allow meeting starts that fit entirely within Joshua's availability.
    ;; Here we allow the 18:07 start (which yields a full 75-minute meeting within 18:00-21:30).
    (start-ok time1087)

    ;; Joshua is located in Chinatown during his availability
    (person-location joshua chinatown)
  )

  (:goal (met joshua))
)