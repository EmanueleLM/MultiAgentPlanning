(define (problem meet-nancy-sf)
  (:domain meeting-planning-sf)

  (:objects
    sunset_district haight_ashbury - location

    ;; 15-minute slices from 09:00 (s0) through 22:00 (s52) inclusive (53 slices)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 - slice
  )

  (:init
    ;; City graph: only the provided directed routes (15 min each way)
    (route sunset_district haight_ashbury)
    (route haight_ashbury sunset_district)

    ;; Succession chain (each succ is 15 minutes later)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50)
    (succ s50 s51) (succ s51 s52)

    ;; Nancy's confirmed availability: 19:30..21:45 corresponds to slice starts s42..s50 inclusive
    (nancy-available s42) (nancy-available s43) (nancy-available s44) (nancy-available s45) (nancy-available s46)
    (nancy-available s47) (nancy-available s48) (nancy-available s49) (nancy-available s50)

    ;; Initial state: at Sunset District at 09:00 (s0)
    (at sunset_district s0)
  )

  ;; Goals:
  ;; - Meet Nancy for at least the minimum required time (met-nancy is set by any meet-5..9 action)
  ;; - Finish back at Sunset District at 22:00 (s52)
  (:goal (and
    (met-nancy)
    (at sunset_district s52)
  ))
)