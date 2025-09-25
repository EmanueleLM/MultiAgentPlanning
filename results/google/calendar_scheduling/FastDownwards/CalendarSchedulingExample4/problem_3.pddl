(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    donna john billy - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    (= (total-cost) 0)
    (busy donna s10)
    (busy donna s13)
    (busy john s4)
    (busy john s15)
    (busy billy s0) (busy billy s1)
    (busy billy s3) (busy billy s4) (busy billy s5)
    (busy billy s6) (busy billy s7) (busy billy s8) (busy billy s9)
    (busy billy s11) (busy billy s12) (busy billy s13) (busy billy s14) (busy billy s15)
  )
  (:metric minimize (total-cost))
  (:goal
    (or
      (meeting-scheduled s0) (meeting-scheduled s1) (meeting-scheduled s2) (meeting-scheduled s3)
      (meeting-scheduled s4) (meeting-scheduled s5) (meeting-scheduled s6) (meeting-scheduled s7)
      (meeting-scheduled s8) (meeting-scheduled s9) (meeting-scheduled s10) (meeting-scheduled s11)
      (meeting-scheduled s12) (meeting-scheduled s13) (meeting-scheduled s14) (meeting-scheduled s15)
    )
  )
)