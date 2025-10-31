(define (problem integrated-meet-betty)
  (:domain integrated-travelers)
  (:objects
    traveler betty - person
    marina richmond - location
    t540 t1230 t1305 t1320 - time
  )
  (:init
    (at traveler marina)
    (at betty richmond)
    (now t540)

    ;; Precomputed ordering facts (arithmetic precomputation)
    (leq t540 t1230)
    (leq t1230 t1305)
    (leq t1305 t1320)

    ;; Precomputed availability window that satisfies the 75-minute meeting requirement:
    ;; Betty available from t1230 (20:30) to t1320 (22:00); meeting required from t1230 to t1305 (75 minutes)
    (can_meet t1230 t1305)

    (= (total-cost) 0)
  )

  (:goal (met-betty))

  (:metric minimize (total-cost))
)