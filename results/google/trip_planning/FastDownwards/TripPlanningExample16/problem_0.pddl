(define (problem trip-9days-prague-vienna-porto)
  (:domain trip-multiagent)

  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day

    prg_t1 prg_t2 prg_t3
    vie_t1 vie_t2 vie_t3
    por_t1 por_t2 por_t3 - token
  )

  (:init
    ;; all nine days are initially unassigned
    (day-available d1) (day-available d2) (day-available d3) (day-available d4) (day-available d5)
    (day-available d6) (day-available d7) (day-available d8) (day-available d9)

    ;; tokens represent required day-units to be spent in each city
    (token-available prg_t1) (token-for prg_t1 prague)
    (token-available prg_t2) (token-for prg_t2 prague)
    (token-available prg_t3) (token-for prg_t3 prague)

    (token-available vie_t1) (token-for vie_t1 vienna)
    (token-available vie_t2) (token-for vie_t2 vienna)
    (token-available vie_t3) (token-for vie_t3 vienna)

    (token-available por_t1) (token-for por_t1 porto)
    (token-available por_t2) (token-for por_t2 porto)
    (token-available por_t3) (token-for por_t3 porto)

    ;; direct flight connectivity (bidirectional as separate facts)
    (flight prague vienna) (flight vienna prague)
    (flight vienna porto) (flight porto vienna)

    ;; no workshop yet (will be achieved by attending on one of days 1..3)
  )

  (:goal
    (and
      ;; all days must be assigned (i.e., no day remains available)
      (not (day-available d1)) (not (day-available d2)) (not (day-available d3))
      (not (day-available d4)) (not (day-available d5)) (not (day-available d6))
      (not (day-available d7)) (not (day-available d8)) (not (day-available d9))

      ;; all tokens must be consumed (ensures exactly the prescribed per-city day counts)
      (not (token-available prg_t1)) (not (token-available prg_t2)) (not (token-available prg_t3))
      (not (token-available vie_t1)) (not (token-available vie_t2)) (not (token-available vie_t3))
      (not (token-available por_t1)) (not (token-available por_t2)) (not (token-available por_t3))

      ;; workshop in Prague attended between day 1 and day 3
      (workshop-done)
    )
  )
)