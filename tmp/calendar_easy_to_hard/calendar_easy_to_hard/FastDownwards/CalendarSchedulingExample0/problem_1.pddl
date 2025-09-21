(define (problem orchestrate-meeting)
  (:domain orchestrated-scheduling)

  (:objects
    michelle steven jerry - person
    m1 - meeting
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    (duration-60 m1)
    (person michelle) (person steven) (person jerry)

    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    (free michelle s0) (free michelle s1)
    (free michelle s2) (free michelle s3)
    (free michelle s6) (free michelle s7)
    (free michelle s8) (free michelle s9)
    (free michelle s10) (free michelle s11)
    (free michelle s12) (free michelle s13)
    (free michelle s14) (free michelle s15)

    (free steven s1) (free steven s2) (free steven s3) (free steven s4)
    (free steven s6) (free steven s7) (free steven s8)
    (free steven s10) (free steven s11) (free steven s12)
    (free steven s14) (free steven s15)

    (free jerry s1)
    (free jerry s4)
    (free jerry s7)
    (free jerry s11)
    (free jerry s12)
    (free jerry s14)
  )

  (:goal (meeting-finalized m1))
  (:metric minimize (total-cost))
)