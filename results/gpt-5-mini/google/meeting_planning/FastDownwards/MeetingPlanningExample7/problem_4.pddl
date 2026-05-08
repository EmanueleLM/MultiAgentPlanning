(define (problem meeting_planning_instance)
  (:domain meeting_planning)
  (:objects
    traveler john - person
    richmond_district north_beach - location
    ;; 15-minute slots from 09:00 (s0) through 18:00 (s35) inclusive (36 slots)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 - slot
  )

  (:init
    ;; slot ordering: each slot is 15 minutes; s0 = 09:00, s35 = 18:00
    (slot-next s0 s1)   (slot-next s1 s2)   (slot-next s2 s3)   (slot-next s3 s4)
    (slot-next s4 s5)   (slot-next s5 s6)   (slot-next s6 s7)   (slot-next s7 s8)
    (slot-next s8 s9)   (slot-next s9 s10)  (slot-next s10 s11) (slot-next s11 s12)
    (slot-next s12 s13) (slot-next s13 s14) (slot-next s14 s15) (slot-next s15 s16)
    (slot-next s16 s17) (slot-next s17 s18) (slot-next s18 s19) (slot-next s19 s20)
    (slot-next s20 s21) (slot-next s21 s22) (slot-next s22 s23) (slot-next s23 s24)
    (slot-next s24 s25) (slot-next s25 s26) (slot-next s26 s27) (slot-next s27 s28)
    (slot-next s28 s29) (slot-next s29 s30) (slot-next s30 s31) (slot-next s31 s32)
    (slot-next s32 s33) (slot-next s33 s34) (slot-next s34 s35)

    ;; roles
    (is_traveler traveler)
    (is_friend john)

    ;; initial traveler position: arrive Richmond District at 09:00 (s0)
    (at traveler richmond_district s0)

    ;; John's availability: John will be at North Beach from 15:15 to 17:15.
    ;; Mapping: 09:00 = s0 => 15:15 = s25, 17:15 = s33 (include s25..s33)
    (at john north_beach s25)
    (at john north_beach s26)
    (at john north_beach s27)
    (at john north_beach s28)
    (at john north_beach s29)
    (at john north_beach s30)
    (at john north_beach s31)
    (at john north_beach s32)
    (at john north_beach s33)

    ;; travel edges (both directions): each requires two consecutive slots (conservative for 17/18 minutes)
    (travel-two richmond_district north_beach)
    (travel-two north_beach richmond_district)
  )

  ;; Goal: meet John for at least 75 minutes (encoded by meet_five producing (met john))
  (:goal (met john))
)