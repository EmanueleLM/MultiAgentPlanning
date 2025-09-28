(define (problem trip-11days)
  (:domain trip-scheduling)

  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; Starting location: must be in Copenhagen on day 1 (conference day 1).
    (at copenhagen d1)

    ;; Allowed direct flights (only these links exist).
    (allowed-flight copenhagen vienna)
    (allowed-flight vienna copenhagen)
    (allowed-flight vienna lyon)
    (allowed-flight lyon vienna)

    ;; Discrete day successor chain for an 11-day trip
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
  )

  ;; Hard constraints as goals:
  ;; - Conference attendance on Copenhagen day 1 and day 5
  ;; - Trip runs for 11 days and finishes in Lyon on day 11 (feasible schedule
  ;;   using only the allowed direct flights and honoring conference days).
  (:goal (and
           (attended d1)
           (attended d5)
           (at lyon d11)
         ))
)