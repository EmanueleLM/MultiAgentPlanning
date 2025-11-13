(define (problem meeting_planning_example9-problem)
  (:domain meeting_planning_example9)

  (:objects
    ;; ticks: tick0 corresponds to 09:00. Each tick = 5 minutes.
    ;; Include ticks tick0 .. tick87 (09:00 through 16:15 inclusive).
    tick0 tick1 tick2 tick3 tick4 tick5 tick6 tick7 tick8 tick9
    tick10 tick11 tick12 tick13 tick14 tick15 tick16 tick17 tick18 tick19
    tick20 tick21 tick22 tick23 tick24 tick25 tick26 tick27 tick28 tick29
    tick30 tick31 tick32 tick33 tick34 tick35 tick36 tick37 tick38 tick39
    tick40 tick41 tick42 tick43 tick44 tick45 tick46 tick47 tick48 tick49
    tick50 tick51 tick52 tick53 tick54 tick55 tick56 tick57 tick58 tick59
    tick60 tick61 tick62 tick63 tick64 tick65 tick66 tick67 tick68 tick69
    tick70 tick71 tick72 tick73 tick74 tick75 tick76 tick77 tick78 tick79
    tick80 tick81 tick82 tick83 tick84 tick85 tick86 tick87 - tick
  )

  (:init
    ;; Initial traveler location at 09:00 (tick0) and tick0 occupied.
    (at union_square tick0)
    (occupied tick0)

    ;; Successor chain tick0 -> tick1 -> ... -> tick87.
    (succ tick0 tick1) (succ tick1 tick2) (succ tick2 tick3) (succ tick3 tick4)
    (succ tick4 tick5) (succ tick5 tick6) (succ tick6 tick7) (succ tick7 tick8)
    (succ tick8 tick9) (succ tick9 tick10) (succ tick10 tick11) (succ tick11 tick12)
    (succ tick12 tick13) (succ tick13 tick14) (succ tick14 tick15) (succ tick15 tick16)
    (succ tick16 tick17) (succ tick17 tick18) (succ tick18 tick19) (succ tick19 tick20)
    (succ tick20 tick21) (succ tick21 tick22) (succ tick22 tick23) (succ tick23 tick24)
    (succ tick24 tick25) (succ tick25 tick26) (succ tick26 tick27) (succ tick27 tick28)
    (succ tick28 tick29) (succ tick29 tick30) (succ tick30 tick31) (succ tick31 tick32)
    (succ tick32 tick33) (succ tick33 tick34) (succ tick34 tick35) (succ tick35 tick36)
    (succ tick36 tick37) (succ tick37 tick38) (succ tick38 tick39) (succ tick39 tick40)
    (succ tick40 tick41) (succ tick41 tick42) (succ tick42 tick43) (succ tick43 tick44)
    (succ tick44 tick45) (succ tick45 tick46) (succ tick46 tick47) (succ tick47 tick48)
    (succ tick48 tick49) (succ tick49 tick50) (succ tick50 tick51) (succ tick51 tick52)
    (succ tick52 tick53) (succ tick53 tick54) (succ tick54 tick55) (succ tick55 tick56)
    (succ tick56 tick57) (succ tick57 tick58) (succ tick58 tick59) (succ tick59 tick60)
    (succ tick60 tick61) (succ tick61 tick62) (succ tick62 tick63) (succ tick63 tick64)
    (succ tick64 tick65) (succ tick65 tick66) (succ tick66 tick67) (succ tick67 tick68)
    (succ tick68 tick69) (succ tick69 tick70) (succ tick70 tick71) (succ tick71 tick72)
    (succ tick72 tick73) (succ tick73 tick74) (succ tick74 tick75) (succ tick75 tick76)
    (succ tick76 tick77) (succ tick77 tick78) (succ tick78 tick79) (succ tick79 tick80)
    (succ tick80 tick81) (succ tick81 tick82) (succ tick82 tick83) (succ tick83 tick84)
    (succ tick84 tick85) (succ tick85 tick86) (succ tick86 tick87)

    ;; Mary is available starting at tick36 (12:00) through tick87 (16:15).
    ;; To minimize repeated facts in :init we encode this by fixing the meeting start
    ;; at tick36 in the domain action (meet_mary_15ticks). Thus we omit enumerating
    ;; per-tick mary_at facts while preserving the availability constraint for this problem.
  )

  ;; Goal: schedule a contiguous 15-tick meeting with Mary (meeting_done).
  (:goal (meeting_done))
)