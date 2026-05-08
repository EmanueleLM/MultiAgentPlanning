(define (problem meeting_planning_example11-problem)
  (:domain meeting_planning_example11)
  (:objects
    ;; locations
    nob_hill sunset_district - location
    ;; person (declared for clarity)
    carol - person
    ;; slots s0..s23 representing 09:00..20:30 in 30-minute steps
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 - slot
  )
  (:init
    ;; initial location and time: at nob_hill at 09:00 (s0)
    (at nob_hill s0)

    ;; explicit successor relation: ordered contiguous slots
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23)

    ;; Carol availability: from 14:00 (s10) through 20:30 (s23) inclusive
    (carol_available s10) (carol_available s11) (carol_available s12) (carol_available s13)
    (carol_available s14) (carol_available s15) (carol_available s16) (carol_available s17)
    (carol_available s18) (carol_available s19) (carol_available s20) (carol_available s21)
    (carol_available s22) (carol_available s23)

    ;; meeting state: not started
    (meeting_0)
  )

  ;; Goal: require completion of the contiguous three-slot meeting sequence (meeting_done).
  ;; This enforces a contiguous meeting of at least 90 minutes (3 slots) entirely within Carol's availability window.
  (:goal (and (meeting_done)))
)