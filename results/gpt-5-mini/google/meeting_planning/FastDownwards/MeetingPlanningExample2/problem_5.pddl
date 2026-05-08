(define (problem meeting_jessica_instance)
  (:domain meeting_planning)
  (:objects
    jessica - person
    haight_ashbury sunset_district - loc
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 - slot
  )

  (:init
    ;; start location and time
    (agent_at haight_ashbury)
    (current_slot s0)

    ;; Jessica's preferred location and availability window.
    ;; Availability encoded in 15-minute slots: s25 corresponds to 15:15 (start).
    (pref_loc jessica sunset_district)
    (person_available jessica s25) (person_available jessica s26) (person_available jessica s27)
    (person_available jessica s28) (person_available jessica s29) (person_available jessica s30)
    (person_available jessica s31) (person_available jessica s32) (person_available jessica s33)
    (person_available jessica s34) (person_available jessica s35) (person_available jessica s36)
    (person_available jessica s37) (person_available jessica s38) (person_available jessica s39)
    (person_available jessica s40) (person_available jessica s41) (person_available jessica s42)
    (person_available jessica s43) (person_available jessica s44)

    ;; All slots initially free (travels and waits will consume slots).
    (free_slot s0) (free_slot s1) (free_slot s2) (free_slot s3) (free_slot s4) (free_slot s5)
    (free_slot s6) (free_slot s7) (free_slot s8) (free_slot s9) (free_slot s10) (free_slot s11)
    (free_slot s12) (free_slot s13) (free_slot s14) (free_slot s15) (free_slot s16) (free_slot s17)
    (free_slot s18) (free_slot s19) (free_slot s20) (free_slot s21) (free_slot s22) (free_slot s23)
    (free_slot s24) (free_slot s25) (free_slot s26) (free_slot s27) (free_slot s28) (free_slot s29)
    (free_slot s30) (free_slot s31) (free_slot s32) (free_slot s33) (free_slot s34) (free_slot s35)
    (free_slot s36) (free_slot s37) (free_slot s38) (free_slot s39) (free_slot s40) (free_slot s41)
    (free_slot s42) (free_slot s43) (free_slot s44) (free_slot s45)

    ;; Discrete time ordering in 15-minute increments.
    (next_slot s0 s1) (next_slot s1 s2) (next_slot s2 s3) (next_slot s3 s4) (next_slot s4 s5)
    (next_slot s5 s6) (next_slot s6 s7) (next_slot s7 s8) (next_slot s8 s9) (next_slot s9 s10)
    (next_slot s10 s11) (next_slot s11 s12) (next_slot s12 s13) (next_slot s13 s14) (next_slot s14 s15)
    (next_slot s15 s16) (next_slot s16 s17) (next_slot s17 s18) (next_slot s18 s19) (next_slot s19 s20)
    (next_slot s20 s21) (next_slot s21 s22) (next_slot s22 s23) (next_slot s23 s24) (next_slot s24 s25)
    (next_slot s25 s26) (next_slot s26 s27) (next_slot s27 s28) (next_slot s28 s29) (next_slot s29 s30)
    (next_slot s30 s31) (next_slot s31 s32) (next_slot s32 s33) (next_slot s33 s34) (next_slot s34 s35)
    (next_slot s35 s36) (next_slot s36 s37) (next_slot s37 s38) (next_slot s38 s39) (next_slot s39 s40)
    (next_slot s40 s41) (next_slot s41 s42) (next_slot s42 s43) (next_slot s43 s44) (next_slot s44 s45)

    ;; Travel connectivity: only the two directed travel legs exist (15 minutes each).
    (connected haight_ashbury sunset_district)
    (connected sunset_district haight_ashbury)
  )

  (:goal (and
    ;; Hard constraint: meet Jessica for at least 90 contiguous minutes within her window.
    (met jessica)
  ))