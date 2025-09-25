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

    ;; numeric function initializations: day 1 already counted for Berlin
    (= (days-in berlin) 1)
    (= (days-in porto) 0)
    (= (days-in krakow) 0)
    (= (total-assigned) 1)
  )
  (:goal (and
    ;; Agent private wishes: required stays per city (these sum to 13, while total trip length is 11;
    ;; the problem is unsatisfiable if these wishes are all enforced, which accurately reflects the
    ;; inconsistent human specification)
    (= (days-in berlin) 6)
    (= (days-in porto) 2)
    (= (days-in krakow) 5)

    ;; total trip length must be 11 days
    (= (total-assigned) 11)

    ;; attend wedding in Porto on day 10
    (at porto d10)
    (wedding porto d10)
  ))
)