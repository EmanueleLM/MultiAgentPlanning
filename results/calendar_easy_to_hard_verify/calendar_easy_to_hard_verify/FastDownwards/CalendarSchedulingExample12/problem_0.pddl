(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
    Dylan Kathryn Hannah Anna - person
  )

  (:init
    ; define slots
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    ; adjacency (30-minute steps). Meeting requires two consecutive slots (60 minutes).
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)

    ; Participant availability.
    ; No busy intervals were provided in the input; per instructions, do not invent unavailable slots.
    ; Therefore, every participant is free in every defined slot on Monday by the provided data.
    (free Dylan s0) (free Dylan s1) (free Dylan s2) (free Dylan s3) (free Dylan s4) (free Dylan s5)
    (free Dylan s6) (free Dylan s7) (free Dylan s8) (free Dylan s9) (free Dylan s10) (free Dylan s11)
    (free Dylan s12) (free Dylan s13) (free Dylan s14) (free Dylan s15)

    (free Kathryn s0) (free Kathryn s1) (free Kathryn s2) (free Kathryn s3) (free Kathryn s4) (free Kathryn s5)
    (free Kathryn s6) (free Kathryn s7) (free Kathryn s8) (free Kathryn s9) (free Kathryn s10) (free Kathryn s11)
    (free Kathryn s12) (free Kathryn s13) (free Kathryn s14) (free Kathryn s15)

    (free Hannah s0) (free Hannah s1) (free Hannah s2) (free Hannah s3) (free Hannah s4) (free Hannah s5)
    (free Hannah s6) (free Hannah s7) (free Hannah s8) (free Hannah s9) (free Hannah s10) (free Hannah s11)
    (free Hannah s12) (free Hannah s13) (free Hannah s14) (free Hannah s15)

    (free Anna s0) (free Anna s1) (free Anna s2) (free Anna s3) (free Anna s4) (free Anna s5)
    (free Anna s6) (free Anna s7) (free Anna s8) (free Anna s9) (free Anna s10) (free Anna s11)
    (free Anna s12) (free Anna s13) (free Anna s14) (free Anna s15)

    ; initialize time to a large value; planner will minimize this to pick the earliest legal start
    (= (time) 1000)
  )

  (:goal (meeting-scheduled))

  ; Minimize the numeric 'time' function so the planner chooses the earliest possible start slot index.
  (:metric minimize (time))
)