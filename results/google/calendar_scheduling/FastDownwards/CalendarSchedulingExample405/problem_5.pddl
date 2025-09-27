(define (problem schedule-monday)
  (:domain schedule-meeting)

  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
    m1 - meeting
    emily brian gerald julia logan judith michael - participant
  )

  (:init
    (work-slot s1) (work-slot s2) (work-slot s3) (work-slot s4) (work-slot s5) (work-slot s6)
    (work-slot s7) (work-slot s8) (work-slot s9) (work-slot s10) (work-slot s11) (work-slot s12)
    (work-slot s13) (work-slot s14) (work-slot s15) (work-slot s16)

    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7)
    (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13)
    (next s13 s14) (next s14 s15) (next s15 s16)

    (free emily s2) (free emily s3) (free emily s4) (free emily s6) (free emily s7)
    (free emily s8) (free emily s9) (free emily s10) (free emily s12) (free emily s13)
    (free emily s14) (free emily s15)

    (free brian s1) (free brian s3) (free brian s4) (free brian s5) (free brian s6)
    (free brian s7) (free brian s8) (free brian s9) (free brian s10) (free brian s11)
    (free brian s14) (free brian s15)

    (free gerald s1) (free gerald s2) (free gerald s3) (free gerald s4) (free gerald s5)
    (free gerald s6) (free gerald s7) (free gerald s8) (free gerald s9) (free gerald s10)
    (free gerald s11) (free gerald s12) (free gerald s13) (free gerald s14) (free gerald s15)
    (free gerald s16)

    (free julia s1) (free julia s2) (free julia s3) (free julia s4) (free julia s5)
    (free julia s6) (free julia s7) (free julia s8) (free julia s9) (free julia s10)
    (free julia s11) (free julia s12) (free julia s13) (free julia s14) (free julia s15)
    (free julia s16)

    (free logan s3) (free logan s4) (free logan s11) (free logan s12) (free logan s13)
    (free logan s14)

    (free judith s5) (free judith s9) (free judith s10) (free judith s11) (free judith s12)
    (free judith s14)

    (free michael s2) (free michael s5) (free michael s8) (free michael s14)
  )

  (:goal
    (scheduled-at m1 s14)
  )
)