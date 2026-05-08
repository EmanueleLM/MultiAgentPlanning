(define (problem calendar_scheduling_example_6)
  (:domain calendar_scheduling)
  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ;; Time adjacency (30-minute blocks from 09:00 to 17:00)
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13)
    (next s13 s14) (next s14 s15) (next s15 s16)

    ;; Thomas: Wide open the entire day
    (free thomas s1) (free thomas s2) (free thomas s3) (free thomas s4)
    (free thomas s5) (free thomas s6) (free thomas s7) (free thomas s8)
    (free thomas s9) (free thomas s10) (free thomas s11) (free thomas s12)
    (free thomas s13) (free thomas s14) (free thomas s15) (free thomas s16)

    ;; Dylan: Busy 10:30-11:00 (s4), 13:30-14:00 (s10)
    (free dylan s1) (free dylan s2) (free dylan s3)
    (free dylan s5) (free dylan s6) (free dylan s7) (free dylan s8)
    (free dylan s9) (free dylan s11) (free dylan s12) (free dylan s13)
    (free dylan s14) (free dylan s15) (free dylan s16)

    ;; Jerry: Busy 9:00-11:00 (s1,s2,s3,s4), 11:30-14:30 (s6,s7,s8,s9,s10,s11), 16:00-17:00 (s15,s16)
    (free jerry s5)
    (free jerry s12) (free jerry s13) (free jerry s14)
  )
  (:goal (meeting_scheduled))
)