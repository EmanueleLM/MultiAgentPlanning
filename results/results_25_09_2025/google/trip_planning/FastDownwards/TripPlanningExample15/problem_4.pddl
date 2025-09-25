(define (problem trip-11-days)
  (:domain multiagent-trip)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    berlin porto krakow - city
  )
  (:init
    ;; direct flights (only these direct connections exist)
    (flight berlin porto)
    (flight porto berlin)
    (flight berlin krakow)
    (flight krakow berlin)

    ;; day succession
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)

    ;; start in Berlin on day 1
    (at berlin d1)
    (assigned d1)

    ;; wedding occurs in Porto between day 10 and day 11 (modeled as at Porto on d10)
    (wedding porto d10)
  )
  (:goal (and
    ;; Berlin: stay for 6 days (days 1-6)
    (at berlin d1) (at berlin d2) (at berlin d3) (at berlin d4) (at berlin d5) (at berlin d6)

    ;; Porto: stay for 2 days and attend wedding (modelled as being in Porto on d10 and d11)
    (at porto d10) (at porto d11)
    (wedding porto d10)

    ;; Krakow: stay for 5 days (days 7-11)
    (at krakow d7) (at krakow d8) (at krakow d9) (at krakow d10) (at krakow d11)
  ))
)