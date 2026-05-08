(define (problem meet-nancy-sunset)
  (:domain sunset-meetings)
  (:objects
    sunset_district haight_ashbury - location
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 - slice
  )

  (:init
    ;; explicit directed routes (only those given)
    (route sunset_district haight_ashbury)
    (route haight_ashbury sunset_district)

    ;; Only two departure times are allowed to encode the top-ranked schedule as a strict constraint:
    ;; depart Sunset->Haight at s41 (19:15) and depart Haight->Sunset at s51 (21:45).
    (allowed-depart sunset_district haight_ashbury s41)
    (allowed-depart haight_ashbury sunset_district s51)

    ;; Succession chain for discrete 15-minute slices from 09:00 (s0) through 22:00 (s52)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50)
    (succ s50 s51) (succ s51 s52)

    ;; Nancy's confirmed availability: 19:30..21:45 inclusive corresponds to slices s42..s50 (each slice is 15min).
    ;; A meeting may occupy any consecutive set of slices fully inside this set. Top-ranked meeting uses full set 9 slices starting at s42.
    (nancy-available s42) (nancy-available s43) (nancy-available s44) (nancy-available s45) (nancy-available s46)
    (nancy-available s47) (nancy-available s48) (nancy-available s49) (nancy-available s50)

    ;; Initial location: you arrive at Sunset District at 09:00 (start of s0)
    (at sunset_district s0)
  )

  ;; Goals:
  ;; - The plan must realize the top-ranked audited schedule: the full-window meeting (135 minutes).
  ;; - Enforce that the meeting chosen is the 9-slice meeting by requiring met-nancy-9.
  ;; - Return to Sunset District at 22:00 (start of slice s52).
  (:goal (and
    (met-nancy-9)
    (at sunset_district s52)
  ))

)