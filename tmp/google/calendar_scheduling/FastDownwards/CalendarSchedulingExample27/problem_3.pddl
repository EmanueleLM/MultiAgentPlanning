(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-schedule)

  (:objects
    jesse kathryn megan orchestrator - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; Jesse is busy on s3 (10:00-10:30) and s14 (15:30-16:00)
    (free jesse s1) (free jesse s2) (free jesse s4) (free jesse s5)
    (free jesse s6) (free jesse s7) (free jesse s8) (free jesse s9)
    (free jesse s10) (free jesse s11) (free jesse s12) (free jesse s13)
    (free jesse s15) (free jesse s16)

    ;; Kathryn is free all day
    (free kathryn s1) (free kathryn s2) (free kathryn s3) (free kathryn s4)
    (free kathryn s5) (free kathryn s6) (free kathryn s7) (free kathryn s8)
    (free kathryn s9) (free kathryn s10) (free kathryn s11) (free kathryn s12)
    (free kathryn s13) (free kathryn s14) (free kathryn s15) (free kathryn s16)

    ;; Megan is busy on s4 (10:30-11:00), s6 & s7 (11:30-12:30), s10 & s11 (13:30-14:30), s13 s14 s15 (15:00-16:30)
    (free megan s1) (free megan s2) (free megan s3) (free megan s5)
    (free megan s8) (free megan s9) (free megan s12) (free megan s16)

    (earliest s1)

    (is-orchestrator orchestrator)
  )

  (:goal (and (meeting-scheduled) (meeting-at s1)))
)