(define (domain meeting_planning_sf_margaret)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location person time
  )
  (:predicates
    (at ?l - location)
    (time ?t - time)
    (next ?t1 - time ?t2 - time)
    (minute-open)

    (moving-mh)
    (moving-hm)
    (meeting-margaret)
    (met-margaret-30)
    (available-margaret ?t - time)
    (at-location-haight-when-meeting)

    ; Mission -> Haight 12-minute chain
    (mh-s0) (mh-s1) (mh-s2) (mh-s3) (mh-s4) (mh-s5) (mh-s6)
    (mh-s7) (mh-s8) (mh-s9) (mh-s10) (mh-s11) (mh-s12)

    ; Haight -> Mission 11-minute chain
    (hm-s0) (hm-s1) (hm-s2) (hm-s3) (hm-s4) (hm-s5)
    (hm-s6) (hm-s7) (hm-s8) (hm-s9) (hm-s10) (hm-s11)

    ; Margaret meeting 30-minute minimum chain
    (margaret-s0) (margaret-s1) (margaret-s2) (margaret-s3) (margaret-s4)
    (margaret-s5) (margaret-s6) (margaret-s7) (margaret-s8) (margaret-s9)
    (margaret-s10) (margaret-s11) (margaret-s12) (margaret-s13) (margaret-s14)
    (margaret-s15) (margaret-s16) (margaret-s17) (margaret-s18) (margaret-s19)
    (margaret-s20) (margaret-s21) (margaret-s22) (margaret-s23) (margaret-s24)
    (margaret-s25) (margaret-s26) (margaret-s27) (margaret-s28) (margaret-s29)
    (margaret-s30)
  )
  (:functions
    (total-cost)
  )

  ; Advance the discrete clock by one minute after a minute has been consumed
  (:action advance-time
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (time ?t)
      (next ?t ?t2)
      (not (minute-open))
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (minute-open)
      (increase (total-cost) 1)
    )
  )

  ; Idle tick to consume exactly one minute while doing nothing
  (:action consume-minute-idle
    :parameters (?t - time)
    :precondition (and
      (time ?t)
      (minute-open)
      (not (moving-mh))
      (not (moving-hm))
      (not (meeting-margaret))
    )
    :effect (and
      (not (minute-open))
    )
  )

  ; Start travel: Mission -> Haight (12 minutes)
  (:action start-move-mh
    :parameters (?t - time)
    :precondition (and
      (time ?t)
      (at mission_district)
      (not (moving-mh))
      (not (moving-hm))
      (not (meeting-margaret))
    )
    :effect (and
      (moving-mh)
      (not (at mission_district))
      (mh-s0)
      (not (mh-s1)) (not (mh-s2)) (not (mh-s3)) (not (mh-s4)) (not (mh-s5)) (not (mh-s6))
      (not (mh-s7)) (not (mh-s8)) (not (mh-s9)) (not (mh-s10)) (not (mh-s11)) (not (mh-s12))
    )
  )

  (:action tick-move-mh-0
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s0))
    :effect (and (not (mh-s0)) (mh-s1) (not (minute-open)))
  )
  (:action tick-move-mh-1
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s1))
    :effect (and (not (mh-s1)) (mh-s2) (not (minute-open)))
  )
  (:action tick-move-mh-2
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s2))
    :effect (and (not (mh-s2)) (mh-s3) (not (minute-open)))
  )
  (:action tick-move-mh-3
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s3))
    :effect (and (not (mh-s3)) (mh-s4) (not (minute-open)))
  )
  (:action tick-move-mh-4
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s4))
    :effect (and (not (mh-s4)) (mh-s5) (not (minute-open)))
  )
  (:action tick-move-mh-5
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s5))
    :effect (and (not (mh-s5)) (mh-s6) (not (minute-open)))
  )
  (:action tick-move-mh-6
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s6))
    :effect (and (not (mh-s6)) (mh-s7) (not (minute-open)))
  )
  (:action tick-move-mh-7
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s7))
    :effect (and (not (mh-s7)) (mh-s8) (not (minute-open)))
  )
  (:action tick-move-mh-8
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s8))
    :effect (and (not (mh-s8)) (mh-s9) (not (minute-open)))
  )
  (:action tick-move-mh-9
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s9))
    :effect (and (not (mh-s9)) (mh-s10) (not (minute-open)))
  )
  (:action tick-move-mh-10
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s10))
    :effect (and (not (mh-s10)) (mh-s11) (not (minute-open)))
  )
  (:action tick-move-mh-11
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-mh) (mh-s11))
    :effect (and (not (mh-s11)) (mh-s12) (not (minute-open)))
  )

  (:action finish-move-mh
    :parameters ()
    :precondition (and (moving-mh) (mh-s12))
    :effect (and
      (not (moving-mh))
      (at haight_ashbury)
      (not (mh-s0)) (not (mh-s1)) (not (mh-s2)) (not (mh-s3)) (not (mh-s4)) (not (mh-s5))
      (not (mh-s6)) (not (mh-s7)) (not (mh-s8)) (not (mh-s9)) (not (mh-s10)) (not (mh-s11)) (not (mh-s12))
    )
  )

  ; Start travel: Haight -> Mission (11 minutes)
  (:action start-move-hm
    :parameters (?t - time)
    :precondition (and
      (time ?t)
      (at haight_ashbury)
      (not (moving-hm))
      (not (moving-mh))
      (not (meeting-margaret))
    )
    :effect (and
      (moving-hm)
      (not (at haight_ashbury))
      (hm-s0)
      (not (hm-s1)) (not (hm-s2)) (not (hm-s3)) (not (hm-s4)) (not (hm-s5))
      (not (hm-s6)) (not (hm-s7)) (not (hm-s8)) (not (hm-s9)) (not (hm-s10)) (not (hm-s11))
    )
  )

  (:action tick-move-hm-0
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s0))
    :effect (and (not (hm-s0)) (hm-s1) (not (minute-open)))
  )
  (:action tick-move-hm-1
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s1))
    :effect (and (not (hm-s1)) (hm-s2) (not (minute-open)))
  )
  (:action tick-move-hm-2
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s2))
    :effect (and (not (hm-s2)) (hm-s3) (not (minute-open)))
  )
  (:action tick-move-hm-3
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s3))
    :effect (and (not (hm-s3)) (hm-s4) (not (minute-open)))
  )
  (:action tick-move-hm-4
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s4))
    :effect (and (not (hm-s4)) (hm-s5) (not (minute-open)))
  )
  (:action tick-move-hm-5
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s5))
    :effect (and (not (hm-s5)) (hm-s6) (not (minute-open)))
  )
  (:action tick-move-hm-6
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s6))
    :effect (and (not (hm-s6)) (hm-s7) (not (minute-open)))
  )
  (:action tick-move-hm-7
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s7))
    :effect (and (not (hm-s7)) (hm-s8) (not (minute-open)))
  )
  (:action tick-move-hm-8
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s8))
    :effect (and (not (hm-s8)) (hm-s9) (not (minute-open)))
  )
  (:action tick-move-hm-9
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s9))
    :effect (and (not (hm-s9)) (hm-s10) (not (minute-open)))
  )
  (:action tick-move-hm-10
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (moving-hm) (hm-s10))
    :effect (and (not (hm-s10)) (hm-s11) (not (minute-open)))
  )

  (:action finish-move-hm
    :parameters ()
    :precondition (and (moving-hm) (hm-s11))
    :effect (and
      (not (moving-hm))
      (at mission_district)
      (not (hm-s0)) (not (hm-s1)) (not (hm-s2)) (not (hm-s3)) (not (hm-s4)) (not (hm-s5))
      (not (hm-s6)) (not (hm-s7)) (not (hm-s8)) (not (hm-s9)) (not (hm-s10)) (not (hm-s11))
    )
  )

  ; Start meeting with Margaret at Haight
  (:action start-meeting-margaret
    :parameters (?t - time)
    :precondition (and
      (time ?t)
      (available-margaret ?t)
      (at haight_ashbury)
      (not (moving-mh))
      (not (moving-hm))
      (not (meeting-margaret))
    )
    :effect (and
      (meeting-margaret)
      (at-location-haight-when-meeting)
      (margaret-s0)
      (not (margaret-s1)) (not (margaret-s2)) (not (margaret-s3)) (not (margaret-s4))
      (not (margaret-s5)) (not (margaret-s6)) (not (margaret-s7)) (not (margaret-s8))
      (not (margaret-s9)) (not (margaret-s10)) (not (margaret-s11)) (not (margaret-s12))
      (not (margaret-s13)) (not (margaret-s14)) (not (margaret-s15)) (not (margaret-s16))
      (not (margaret-s17)) (not (margaret-s18)) (not (margaret-s19)) (not (margaret-s20))
      (not (margaret-s21)) (not (margaret-s22)) (not (margaret-s23)) (not (margaret-s24))
      (not (margaret-s25)) (not (margaret-s26)) (not (margaret-s27)) (not (margaret-s28))
      (not (margaret-s29)) (not (margaret-s30))
    )
  )

  ; 30 minutes of meeting progress (0..29 -> 30)
  (:action tick-meeting-margaret-0
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s0)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s0)) (margaret-s1) (not (minute-open)))
  )
  (:action tick-meeting-margaret-1
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s1)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s1)) (margaret-s2) (not (minute-open)))
  )
  (:action tick-meeting-margaret-2
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s2)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s2)) (margaret-s3) (not (minute-open)))
  )
  (:action tick-meeting-margaret-3
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s3)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s3)) (margaret-s4) (not (minute-open)))
  )
  (:action tick-meeting-margaret-4
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s4)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s4)) (margaret-s5) (not (minute-open)))
  )
  (:action tick-meeting-margaret-5
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s5)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s5)) (margaret-s6) (not (minute-open)))
  )
  (:action tick-meeting-margaret-6
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s6)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s6)) (margaret-s7) (not (minute-open)))
  )
  (:action tick-meeting-margaret-7
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s7)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s7)) (margaret-s8) (not (minute-open)))
  )
  (:action tick-meeting-margaret-8
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s8)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s8)) (margaret-s9) (not (minute-open)))
  )
  (:action tick-meeting-margaret-9
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s9)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s9)) (margaret-s10) (not (minute-open)))
  )
  (:action tick-meeting-margaret-10
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s10)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s10)) (margaret-s11) (not (minute-open)))
  )
  (:action tick-meeting-margaret-11
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s11)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s11)) (margaret-s12) (not (minute-open)))
  )
  (:action tick-meeting-margaret-12
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s12)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s12)) (margaret-s13) (not (minute-open)))
  )
  (:action tick-meeting-margaret-13
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s13)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s13)) (margaret-s14) (not (minute-open)))
  )
  (:action tick-meeting-margaret-14
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s14)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s14)) (margaret-s15) (not (minute-open)))
  )
  (:action tick-meeting-margaret-15
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s15)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s15)) (margaret-s16) (not (minute-open)))
  )
  (:action tick-meeting-margaret-16
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s16)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s16)) (margaret-s17) (not (minute-open)))
  )
  (:action tick-meeting-margaret-17
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s17)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s17)) (margaret-s18) (not (minute-open)))
  )
  (:action tick-meeting-margaret-18
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s18)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s18)) (margaret-s19) (not (minute-open)))
  )
  (:action tick-meeting-margaret-19
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s19)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s19)) (margaret-s20) (not (minute-open)))
  )
  (:action tick-meeting-margaret-20
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s20)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s20)) (margaret-s21) (not (minute-open)))
  )
  (:action tick-meeting-margaret-21
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s21)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s21)) (margaret-s22) (not (minute-open)))
  )
  (:action tick-meeting-margaret-22
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s22)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s22)) (margaret-s23) (not (minute-open)))
  )
  (:action tick-meeting-margaret-23
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s23)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s23)) (margaret-s24) (not (minute-open)))
  )
  (:action tick-meeting-margaret-24
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s24)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s24)) (margaret-s25) (not (minute-open)))
  )
  (:action tick-meeting-margaret-25
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s25)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s25)) (margaret-s26) (not (minute-open)))
  )
  (:action tick-meeting-margaret-26
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s26)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s26)) (margaret-s27) (not (minute-open)))
  )
  (:action tick-meeting-margaret-27
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s27)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s27)) (margaret-s28) (not (minute-open)))
  )
  (:action tick-meeting-margaret-28
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s28)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s28)) (margaret-s29) (not (minute-open)))
  )
  (:action tick-meeting-margaret-29
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s29)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (margaret-s29)) (margaret-s30) (not (minute-open)))
  )

  ; Optional additional minutes beyond 30, still gated by availability
  (:action tick-meeting-margaret-keep
    :parameters (?t - time)
    :precondition (and (time ?t) (minute-open) (meeting-margaret) (margaret-s30)
                       (available-margaret ?t) (at haight_ashbury) (at-location-haight-when-meeting))
    :effect (and (not (minute-open)))
  )

  ; Finish meeting after at least 30 minutes
  (:action finish-meeting-margaret
    :parameters ()
    :precondition (and (meeting-margaret) (margaret-s30))
    :effect (and
      (not (meeting-margaret))
      (not (at-location-haight-when-meeting))
      (met-margaret-30)
      (not (margaret-s0)) (not (margaret-s1)) (not (margaret-s2)) (not (margaret-s3)) (not (margaret-s4))
      (not (margaret-s5)) (not (margaret-s6)) (not (margaret-s7)) (not (margaret-s8)) (not (margaret-s9))
      (not (margaret-s10)) (not (margaret-s11)) (not (margaret-s12)) (not (margaret-s13)) (not (margaret-s14))
      (not (margaret-s15)) (not (margaret-s16)) (not (margaret-s17)) (not (margaret-s18)) (not (margaret-s19))
      (not (margaret-s20)) (not (margaret-s21)) (not (margaret-s22)) (not (margaret-s23)) (not (margaret-s24))
      (not (margaret-s25)) (not (margaret-s26)) (not (margaret-s27)) (not (margaret-s28)) (not (margaret-s29))
      (not (margaret-s30))
    )
  )
)