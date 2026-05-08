(define (problem meeting_jessica_instance)
  (:domain meeting_planning)
  (:objects
    jessica - person
    haight_ashbury sunset_district - loc
    ;; slots of 15 minutes starting at 09:00 (s0 = 09:00-09:15). s45 is the sentinel after the last usable slot.
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 - slot
  )

  (:init
    ;; starting location and time
    (agent-at haight_ashbury)
    (current-slot s0)

    ;; Jessica's preferred meeting location
    (pref-loc jessica sunset_district)

    ;; Jessica availability: 15:15 (s25) up to and including the 20:00-20:15 slot (s44).
    ;; This allows a 6-slot (90-minute) contiguous meeting starting as early as s25 and as late as s39.
    (person-available jessica s25) (person-available jessica s26) (person-available jessica s27)
    (person-available jessica s28) (person-available jessica s29) (person-available jessica s30)
    (person-available jessica s31) (person-available jessica s32) (person-available jessica s33)
    (person-available jessica s34) (person-available jessica s35) (person-available jessica s36)
    (person-available jessica s37) (person-available jessica s38) (person-available jessica s39)
    (person-available jessica s40) (person-available jessica s41) (person-available jessica s42)
    (person-available jessica s43) (person-available jessica s44)

    ;; All usable slots initially free (do not mark sentinel s45 as free)
    (free s0) (free s1) (free s2) (free s3) (free s4) (free s5) (free s6) (free s7) (free s8) (free s9)
    (free s10) (free s11) (free s12) (free s13) (free s14) (free s15) (free s16) (free s17) (free s18) (free s19)
    (free s20) (free s21) (free s22) (free s23) (free s24) (free s25) (free s26) (free s27) (free s28) (free s29)
    (free s30) (free s31) (free s32) (free s33) (free s34) (free s35) (free s36) (free s37) (free s38) (free s39)
    (free s40) (free s41) (free s42) (free s43) (free s44)

    ;; successor chain for contiguous slot consumption
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35)
    (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40)
    (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45)
  )

  (:goal (and
    ;; Hard constraint: meet Jessica for at least 90 contiguous minutes (enforced by meet-jessica-6)
    (met jessica)
  ))