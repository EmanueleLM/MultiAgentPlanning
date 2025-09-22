(define (problem integrated-trip-problem)
  (:domain integrated-trip-domain)

  (:objects
    berlin munich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    ;; Day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8)

    ;; Direct flight connectivity retained per each agent's vocabulary
    ;; Agent1 direct-flight
    (direct-flight munich dubrovnik)
    (direct-flight dubrovnik munich)
    (direct-flight berlin munich)
    (direct-flight munich berlin)

    ;; Agent2 connected
    (connected munich dubrovnik)
    (connected dubrovnik munich)
    (connected berlin munich)
    (connected munich berlin)

    ;; Agent3 flight
    (flight munich dubrovnik)
    (flight dubrovnik munich)
    (flight berlin munich)
    (flight munich berlin)

    ;; City markers
    (is-dubrovnik dubrovnik)
    (is-berlin berlin)
    (is-munich munich)

    ;; Start location: in Berlin on day 1 to allow day1 attendance
    (at berlin d1)

    ;; Initialize counters
    (= (dubrovnik-days) 0)
    (= (munich-days) 0)
  )

  ;; Goal:
  ;; - Attend Berlin conference on day1 and day4
  ;; - Spend at least 3 days in Dubrovnik (>= 3)
  ;; - Spend exactly 3 days in Munich (as requested by agent3)
  ;; The following allocation is feasible within 8 days:
  ;;   Berlin: d1, d4
  ;;   Munich: d2, d3, d5  (3 days)
  ;;   Dubrovnik: d6, d7, d8 (3 days)
  (:goal
    (and
      (attended-day1)
      (attended-day4)
      (>= (dubrovnik-days) 3)
      (= (munich-days) 3)
    )
  )
)