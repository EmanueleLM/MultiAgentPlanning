(define (problem meeting-scheduling-problem)
  (:domain meeting-scheduling)

  (:objects
    traveler william - person
    nob_hill the_castro - location
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 - slot
  )

  (:init
    ; timeline: 15-minute slots from 09:00 (s0) to 21:45 (s51) inclusive (13 hours -> 52 slots).
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16)
    (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20) (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24)
    (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30) (succ s30 s31) (succ s31 s32)
    (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48)
    (succ s48 s49) (succ s49 s50) (succ s50 s51)

    ; Traveler arrives at Nob Hill at 09:00 (s0).
    (at traveler nob_hill s0)

    ; William is at The Castro from 12:15 to 22:00.
    ; 12:15 corresponds to s13 (09:00 + 13*15min = 12:15). William is available on slots s13 .. s51.
    (william_available s13) (william_available s14) (william_available s15) (william_available s16)
    (william_available s17) (william_available s18) (william_available s19) (william_available s20)
    (william_available s21) (william_available s22) (william_available s23) (william_available s24)
    (william_available s25) (william_available s26) (william_available s27) (william_available s28)
    (william_available s29) (william_available s30) (william_available s31) (william_available s32)
    (william_available s33) (william_available s34) (william_available s35) (william_available s36)
    (william_available s37) (william_available s38) (william_available s39) (william_available s40)
    (william_available s41) (william_available s42) (william_available s43) (william_available s44)
    (william_available s45) (william_available s46) (william_available s47) (william_available s48)
    (william_available s49) (william_available s50) (william_available s51)
  )

  ; Hard goal: ensure William is met for at least 75 minutes (5 contiguous 15-min slots) at The Castro.
  (:goal (met_william))
)