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
    (busy alexander s15)

    (busy elizabeth s0)
    (busy elizabeth s5)
    (busy elizabeth s6)
    (busy elizabeth s8)
    (busy elizabeth s9)
    (busy elizabeth s10)

    (busy walter s0)
    (busy walter s1)
    (busy walter s2)
    (busy walter s3)
    (busy walter s4)
    (busy walter s5)
    (busy walter s6)
    (busy walter s7)
    (busy walter s8)
    (busy walter s9)
    (busy walter s10)
    (busy walter s13)
    (busy walter s14)
    (busy walter s15)
  )

  (:goal (meeting-scheduled))
)