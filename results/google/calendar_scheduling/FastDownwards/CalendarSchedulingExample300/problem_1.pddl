(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    eric jeremy joe brian brittany julia
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16
  )
  (:init
    ;; slots
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ;; participants (declared as objects, also add participant facts)
    (participant eric) (participant jeremy) (participant joe) (participant brian) (participant brittany) (participant julia)

    ;; availability: "free" facts computed from private busy intervals (30-minute slots from 09:00 to 16:30)
    ;; eric: busy s3 (10:00), s8 (12:30)
    (free eric s1) (free eric s2) (free eric s4) (free eric s5) (free eric s6) (free eric s7)
    (free eric s9) (free eric s10) (free eric s11) (free eric s12) (free eric s13) (free eric s14) (free eric s15) (free eric s16)

    ;; jeremy: busy s5 (11:00), s6 (11:30), s8 (12:30), s13 (15:00)
    (free jeremy s1) (free jeremy s2) (free jeremy s3) (free jeremy s4)
    (free jeremy s7) (free jeremy s9) (free jeremy s10) (free jeremy s11) (free jeremy s12) (free jeremy s14) (free jeremy s15) (free jeremy s16)

    ;; joe: free all day
    (free joe s1) (free joe s2) (free joe s3) (free joe s4) (free joe s5) (free joe s6) (free joe s7) (free joe s8)
    (free joe s9) (free joe s10) (free joe s11) (free joe s12) (free joe s13) (free joe s14) (free joe s15) (free joe s16)

    ;; brian: busy s1,s2,s3 (09:00-10:30), s5,s6,s7,s8 (11:00-13:00), s10 (13:30), s12,s13,s14 (14:30-16:00), s16 (16:30)
    ;; free: s4 (10:30), s9 (13:00), s11 (14:00), s15 (16:00)
    (free brian s4) (free brian s9) (free brian s11) (free brian s15)

    ;; brittany: busy s1 (09:00-09:30), s4,s5,s6 (10:30-12:00), s10,s11 (13:30-14:30), s13 (15:00), s16 (16:30)
    ;; free: s2,s3,s7,s8,s9,s12,s14,s15
    (free brittany s2) (free brittany s3) (free brittany s7) (free brittany s8)
    (free brittany s9) (free brittany s12) (free brittany s14) (free brittany s15)

    ;; julia: busy s1,s2,s3,s4 (09:00-11:00), s8 (12:30), s10,s11,s12 (13:30-15:00), s15,s16 (16:00-17:00)
    ;; free: s5,s6,s7,s9,s13,s14
    (free julia s5) (free julia s6) (free julia s7) (free julia s9) (free julia s13) (free julia s14)
  )
  (:goal (meeting-scheduled))
)