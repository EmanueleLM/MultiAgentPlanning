(define (problem meeting_scheduling_problem)
  (:domain meeting_scheduling)

  (:objects
    traveler william - person
    nob_hill the_castro - location

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 - slot
  )

  (:init
    ;; successor chain s0 -> s1 -> ... -> s17
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17)

    ;; initial location: traveler arrives at nob_hill at 09:00 (s0)
    (at traveler nob_hill s0)

    ;; William availability: from 12:15 (s13) through s17 inclusive
    (william_available the_castro s13) (william_available the_castro s14)
    (william_available the_castro s15) (william_available the_castro s16)
    (william_available the_castro s17)
  )

  (:goal (met_william))
)