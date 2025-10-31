(define (problem integrated-meet-betty)
  (:domain integrated-travelers)
  (:objects
    traveler - person
    marina richmond - location
  )
  (:init
    ;; Start at Marina at 09:00 (540 minutes since midnight)
    (at traveler marina)
    (= (now) 540)

    ;; Betty is available in Richmond from 20:30 (1230) to 22:00 (1320)
    (= (betty-start) 1230)
    (= (betty-end) 1320)
  )

  ;; Goal: ensure Betty is met for at least 75 minutes within her window.
  ;; Meeting can be achieved by either agent's meeting action (actions are kept distinct).
  (:goal (met-betty))
)