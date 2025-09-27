(define (problem meet-joshua-problem-classical)
  (:domain meeting-schedule-classical)
  (:objects
    you - agent
    joshua - person
    union-square chinatown - location
    time540 time1080 time1087 time1162 - time
  )
  (:init
    (at you union-square)
    (at-time time540)
    (adv-gap time540 time1080)
    (adv7 time1080 time1087)
    (adv75 time1087 time1162)
    (start-ok time1087)
    (person-location joshua chinatown)
  )
  (:goal (met you joshua))
)