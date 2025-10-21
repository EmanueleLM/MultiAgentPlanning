(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    thomas dylan jerry - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    ;; consecutive half-hour slots from 09:00 to 17:00 (s0=09:00-09:30 ... s15=16:30-17:00)
    (consecutive s0 s1) (consecutive s1 s2) (consecutive s2 s3) (consecutive s3 s4)
    (consecutive s4 s5) (consecutive s5 s6) (consecutive s6 s7) (consecutive s7 s8)
    (consecutive s8 s9) (consecutive s9 s10) (consecutive s10 s11) (consecutive s11 s12)
    (consecutive s12 s13) (consecutive s13 s14) (consecutive s14 s15)

    ;; thomas: no blocked intervals within work hours (09:00-17:00) -> free all slots
    (free thomas s0) (free thomas s1) (free thomas s2) (free thomas s3)
    (free thomas s4) (free thomas s5) (free thomas s6) (free thomas s7)
    (free thomas s8) (free thomas s9) (free thomas s10) (free thomas s11)
    (free thomas s12) (free thomas s13) (free thomas s14) (free thomas s15)

    ;; dylan: busy 10:30-11:00 (s3) and 13:30-14:00 (s9); free otherwise within work hours
    (free dylan s0) (free dylan s1) (free dylan s2)
    (free dylan s4) (free dylan s5) (free dylan s6) (free dylan s7) (free dylan s8)
    (free dylan s10) (free dylan s11) (free dylan s12) (free dylan s13) (free dylan s14) (free dylan s15)

    ;; jerry: busy 09:00-11:00 (s0,s1,s2,s3) and 11:30-14:30 (s5,s6,s7,s8,s9,s10) and 16:00-17:00 (s14,s15)
    ;; free intervals: 11:00-11:30 (s4) and 14:30-16:00 (s11,s12,s13)
    (free jerry s4)
    (free jerry s11) (free jerry s12) (free jerry s13)
  )

  (:goal (and (meeting-scheduled)))
)