(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    theresa charles betty - agent
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ; temporal adjacency (30-min increments from 09:00 to 17:00)
    (next s1 s2)  ; 09:00-09:30 -> 09:30-10:00
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16) ; 16:00-16:30 -> 16:30-17:00

    ; Free slots derived from each agent's private busy intervals (30-min slots s1..s16 represent 09:00-09:30 .. 16:30-17:00)
    ; Theresa busy: s1, s8, s9, s11, s12, s16
    ; Therefore Theresa free:
    (free theresa s2)
    (free theresa s3)
    (free theresa s4)
    (free theresa s5)
    (free theresa s6)
    (free theresa s7)
    (free theresa s10)
    (free theresa s13)
    (free theresa s14)
    (free theresa s15)

    ; Charles busy: s3, s6, s7, s11, s12, s13
    ; Therefore Charles free:
    (free charles s1)
    (free charles s2)
    (free charles s4)
    (free charles s5)
    (free charles s8)
    (free charles s9)
    (free charles s10)
    (free charles s14)
    (free charles s15)
    (free charles s16)

    ; Betty busy: s1, s2, s3, s7, s9, s10, s13, s14
    ; Therefore Betty free:
    (free betty s4)
    (free betty s5)
    (free betty s6)
    (free betty s8)
    (free betty s11)
    (free betty s12)
    (free betty s15)
    (free betty s16)
  )

  ; Goal: schedule a 60-minute meeting (two consecutive 30-min slots) that all participants attend.
  ; Based on the integrated availabilities above, the only mutual consecutive free pair is s4 & s5 (10:30-11:30).
  (:goal (meeting-scheduled s4))
)