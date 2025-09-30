(define (problem trip-11days)
  (:domain trip-scheduling)

  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; timeline ordering for 11-day discrete timeline
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

    ;; starting location: must be in Copenhagen on day 1
    (at copenhagen d1)
  )

  ;; Goals encode a complete feasible schedule for the 11-day trip.
  ;; Hard constraints: attend the Copenhagen conference on day1 and day5 are required.
  ;; The schedule below respects only direct flights (CPH<->VIE, VIE<->LYON),
  ;; uses attend actions on day1 and day5, and prioritises the earliest feasible travel.
  (:goal (and
    ;; Presence in Copenhagen for days 1 through 6 (attendance consumes days 1 and 5)
    (at copenhagen d1)
    (at copenhagen d2)
    (at copenhagen d3)
    (at copenhagen d4)
    (at copenhagen d5)
    (at copenhagen d6)

    ;; Conference attendance required and enforced by event actions
    (attended-conference d1)
    (attended-conference d5)

    ;; Travel after attending on day5: arrive Vienna on day7
    (at vienna d7)

    ;; Travel from Vienna to Lyon and remain in Lyon through day 11
    (at lyon d8)
    (at lyon d9)
    (at lyon d10)
    (at lyon d11)
  ))
)