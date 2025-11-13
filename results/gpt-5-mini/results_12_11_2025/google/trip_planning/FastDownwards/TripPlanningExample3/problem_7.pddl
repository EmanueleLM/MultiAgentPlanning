(define (problem trip-berlin-warsaw-bucharest)
  (:domain trip-domain)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )
  (:init
    ;; initial day and location
    (cur d1)
    (at berlin)

    ;; day order
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (last-day d6)

    ;; direct flights (undirected)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ;; allowed cities per day:
    ;; enforce Bucharest exactly on days d5 and d6 (the 2-day contiguous Bucharest stay)
    ;; and forbid Bucharest on earlier days to make the 2-day stay structural
    ;; days d1..d4 allowed: berlin or warsaw
    (allowed d1 berlin)
    (allowed d1 warsaw)
    (allowed d2 berlin)
    (allowed d2 warsaw)
    (allowed d3 berlin)
    (allowed d3 warsaw)
    (allowed d4 berlin)
    (allowed d4 warsaw)
    ;; days d5 and d6 allowed only bucharest
    (allowed d5 bucharest)
    (allowed d6 bucharest)
  )

  (:goal (and
    ;; every day must be booked to exactly one city (day-booked enforces single booking)
    (day-booked d1)
    (day-booked d2)
    (day-booked d3)
    (day-booked d4)
    (day-booked d5)
    (day-booked d6)
    ;; hard constraint: be in Bucharest on d5 and d6
    (booked d5 bucharest)
    (booked d6 bucharest)
  ))
)