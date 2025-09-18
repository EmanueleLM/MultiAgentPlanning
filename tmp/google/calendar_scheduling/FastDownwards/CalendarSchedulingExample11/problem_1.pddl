(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling)

  (:objects
    alexander elizabeth walter - person

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    (busy alexander s1)
    (busy alexander s3)
    (busy alexander s7)
    (busy alexander s11)
    (busy alexander s14)

    (free alexander s0) (free alexander s1) (free alexander s2) (free alexander s3)
    (free alexander s4) (free alexander s5) (free alexander s6) (free alexander s7)
    (free alexander s8) (free alexander s9) (free alexander s10) (free alexander s11)
    (free alexander s12) (free alexander s13) (free alexander s14) (free alexander s15)

    (free walter s0) (free walter s1) (free walter s2) (free walter s3)
    (free walter s4) (free walter s5) (free walter s6) (free walter s7)
    (free walter s8) (free walter s9) (free walter s10) (free walter s11)
    (free walter s12) (free walter s13) (free walter s14) (free walter s15)

    (free elizabeth s1) (free elizabeth s2) (free elizabeth s3) (free elizabeth s4)
    (free elizabeth s7) (free elizabeth s11) (free elizabeth s12) (free elizabeth s13)
    (free elizabeth s14) (free elizabeth s15)

    (available alexander s0) (available alexander s1) (available alexander s2) (available alexander s3)
    (available alexander s4) (available alexander s5) (available alexander s6) (available alexander s7)
    (available alexander s8) (available alexander s9) (available alexander s10) (available alexander s11)
    (available alexander s12) (available alexander s13) (available alexander s14) (available alexander s15)

    (available elizabeth s0) (available elizabeth s1) (available elizabeth s2) (available elizabeth s3)
    (available elizabeth s4) (available elizabeth s5) (available elizabeth s6) (available elizabeth s7)
    (available elizabeth s8) (available elizabeth s9) (available elizabeth s10) (available elizabeth s11)
    (available elizabeth s12) (available elizabeth s13) (available elizabeth s14) (available elizabeth s15)

    (available walter s11) (available walter s12)

    (meeting-unscheduled)
  )

  (:goal (meeting-scheduled))
)