(define (problem trip-9days)
  (:domain trip-planning)
  (:objects
    Oslo Valencia Dublin - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; All days initially free
    (free d1) (free d2) (free d3) (free d4) (free d5) (free d6) (free d7) (free d8) (free d9)

    ;; Direct flights available (only direct connections known)
    (flight Oslo Dublin)
    (flight Dublin Oslo)
    (flight Dublin Valencia)
    (flight Valencia Dublin)

    ;; Encoded hard constraints and derived windows:
    ;; - Valencia must occupy days 5..9 inclusive -> enforced by making only start-valencia-day5 available
    ;; - Oslo must be a 3-day consecutive block with start day only 1 or 2 (derived feasible window)
    ;; - Dublin must be a 3-day consecutive block (arrival days available 1..7)
    ;; Note: these constraints are encoded by the available actions in the domain (start-oslo-day1/2, start-valencia-day5, start-dublin-day1..7).
  )

  (:goal
    (and
      (oslo-scheduled)
      (valencia-scheduled)
      (dublin-scheduled)
    )
  )
)