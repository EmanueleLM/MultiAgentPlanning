(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    jesse kathryn megan - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    (free kathryn s0) (free kathryn s1) (free kathryn s2) (free kathryn s3)
    (free kathryn s4) (free kathryn s5) (free kathryn s6) (free kathryn s7)
    (free kathryn s8) (free kathryn s9) (free kathryn s10) (free kathryn s11)
    (free kathryn s12) (free kathryn s13) (free kathryn s14) (free kathryn s15)

    (free jesse s0) (free jesse s1) (free jesse s3) (free jesse s4)
    (free jesse s5) (free jesse s6) (free jesse s7) (free jesse s8)
    (free jesse s9) (free jesse s10) (free jesse s11) (free jesse s12)
    (free jesse s14) (free jesse s15)

    (free megan s0) (free megan s1) (free megan s2) (free megan s4)
    (free megan s7) (free megan s8) (free megan s11) (free megan s15)
  )
  (:goal (and
    (scheduled)
    (meeting-at s0)
  ))
)