(define (domain meet-margaret-sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time)
  (:predicates
    (current_time ?t - time)
    (next ?t - time ?t2 - time)
    (at ?l - location)
    (moving_mh)
    (moving_hm)
    (meeting_margaret)
    ;; movement progress markers for Mission->Haight (12-minute travel uses 12 ticks -> final marker index 13)
    (move_mh_1) (move_mh_2) (move_mh_3) (move_mh_4) (move_mh_5) (move_mh_6)
    (move_mh_7) (move_mh_8) (move_mh_9) (move_mh_10) (move_mh_11) (move_mh_12) (move_mh_13)
    ;; movement progress markers for Haight->Mission (11-minute travel uses 11 ticks -> final marker index 12)
    (move_hm_1) (move_hm_2) (move_hm_3) (move_hm_4) (move_hm_5) (move_hm_6)
    (move_hm_7) (move_hm_8) (move_hm_9) (move_hm_10) (move_hm_11) (move_hm_12)
    ;; meeting progress markers for Margaret meeting (30-minute contiguous meeting -> final marker index 31)
    (meet_m_1) (meet_m_2) (meet_m_3) (meet_m_4) (meet_m_5) (meet_m_6)
    (meet_m_7) (meet_m_8) (meet_m_9) (meet_m_10) (meet_m_11) (meet_m_12)
    (meet_m_13) (meet_m_14) (meet_m_15) (meet_m_16) (meet_m_17) (meet_m_18)
    (meet_m_19) (meet_m_20) (meet_m_21) (meet_m_22) (meet_m_23) (meet_m_24)
    (meet_m_25) (meet_m_26) (meet_m_27) (meet_m_28) (meet_m_29) (meet_m_30) (meet_m_31)
    (met_margaret_30)
    (available_margaret ?t - time)
  )
  (:functions (total-cost))

  ;; Start moving from Mission District to Haight-Ashbury.
  ;; Preconditions: currently at mission_district, not moving or meeting.
  ;; Effects: remove 'at mission_district', set moving mode and initial progress marker.
  (:action start_move_mh
    :parameters (?t - time)
    :precondition (and (current_time ?t) (at mission_district) (not (meeting_margaret)) (not (moving_mh)) (not (moving_hm)))
    :effect (and (not (at mission_district)) (moving_mh) (move_mh_1))
  )

  ;; 12 per-minute tick actions for Mission->Haight (each advances time by one minute and increments progress marker).
  (:action tick_move_mh_1
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_1))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_1)) (move_mh_2) (increase (total-cost) 1))
  )
  (:action tick_move_mh_2
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_2))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_2)) (move_mh_3) (increase (total-cost) 1))
  )
  (:action tick_move_mh_3
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_3))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_3)) (move_mh_4) (increase (total-cost) 1))
  )
  (:action tick_move_mh_4
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_4))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_4)) (move_mh_5) (increase (total-cost) 1))
  )
  (:action tick_move_mh_5
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_5))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_5)) (move_mh_6) (increase (total-cost) 1))
  )
  (:action tick_move_mh_6
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_6))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_6)) (move_mh_7) (increase (total-cost) 1))
  )
  (:action tick_move_mh_7
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_7))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_7)) (move_mh_8) (increase (total-cost) 1))
  )
  (:action tick_move_mh_8
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_8))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_8)) (move_mh_9) (increase (total-cost) 1))
  )
  (:action tick_move_mh_9
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_9))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_9)) (move_mh_10) (increase (total-cost) 1))
  )
  (:action tick_move_mh_10
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_10))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_10)) (move_mh_11) (increase (total-cost) 1))
  )
  (:action tick_move_mh_11
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_11))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_11)) (move_mh_12) (increase (total-cost) 1))
  )
  (:action tick_move_mh_12
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_mh) (move_mh_12))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_mh_12)) (move_mh_13) (increase (total-cost) 1))
  )

  ;; Finish moving to Haight-Ashbury: no time advance, places agent at haight_ashbury and clears moving markers.
  (:action finish_move_mh
    :parameters (?t - time)
    :precondition (and (current_time ?t) (moving_mh) (move_mh_13))
    :effect (and (not (moving_mh)) (not (move_mh_13)) (at haight_ashbury))
  )

  ;; Start moving from Haight-Ashbury to Mission District.
  (:action start_move_hm
    :parameters (?t - time)
    :precondition (and (current_time ?t) (at haight_ashbury) (not (meeting_margaret)) (not (moving_hm)) (not (moving_mh)))
    :effect (and (not (at haight_ashbury)) (moving_hm) (move_hm_1))
  )

  ;; 11 per-minute tick actions for Haight->Mission (each advances time by one minute and increments progress marker).
  (:action tick_move_hm_1
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_1))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_1)) (move_hm_2) (increase (total-cost) 1))
  )
  (:action tick_move_hm_2
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_2))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_2)) (move_hm_3) (increase (total-cost) 1))
  )
  (:action tick_move_hm_3
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_3))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_3)) (move_hm_4) (increase (total-cost) 1))
  )
  (:action tick_move_hm_4
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_4))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_4)) (move_hm_5) (increase (total-cost) 1))
  )
  (:action tick_move_hm_5
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_5))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_5)) (move_hm_6) (increase (total-cost) 1))
  )
  (:action tick_move_hm_6
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_6))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_6)) (move_hm_7) (increase (total-cost) 1))
  )
  (:action tick_move_hm_7
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_7))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_7)) (move_hm_8) (increase (total-cost) 1))
  )
  (:action tick_move_hm_8
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_8))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_8)) (move_hm_9) (increase (total-cost) 1))
  )
  (:action tick_move_hm_9
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_9))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_9)) (move_hm_10) (increase (total-cost) 1))
  )
  (:action tick_move_hm_10
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_10))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_10)) (move_hm_11) (increase (total-cost) 1))
  )
  (:action tick_move_hm_11
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (moving_hm) (move_hm_11))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (move_hm_11)) (move_hm_12) (increase (total-cost) 1))
  )

  ;; Finish moving to Mission District: no time advance, places agent at mission_district.
  (:action finish_move_hm
    :parameters (?t - time)
    :precondition (and (current_time ?t) (moving_hm) (move_hm_12))
    :effect (and (not (moving_hm)) (not (move_hm_12)) (at mission_district))
  )

  ;; Start meeting with Margaret: only when at Haight-Ashbury and Margaret is available at the current minute.
  ;; Sets meeting mode and initial meeting progress marker.
  (:action start_meeting_margaret
    :parameters (?t - time)
    :precondition (and (current_time ?t) (at haight_ashbury) (available_margaret ?t) (not (meeting_margaret)) (not (moving_mh)) (not (moving_hm)))
    :effect (and (meeting_margaret) (meet_m_1))
  )

  ;; 30 per-minute meeting ticks to complete a contiguous 30-minute meeting.
  ;; Each tick requires: currently meeting_margaret, still at haight_ashbury, and Margaret available at that minute.
  (:action tick_meet_m_1
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_1))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_1)) (meet_m_2) (increase (total-cost) 1))
  )
  (:action tick_meet_m_2
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_2))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_2)) (meet_m_3) (increase (total-cost) 1))
  )
  (:action tick_meet_m_3
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_3))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_3)) (meet_m_4) (increase (total-cost) 1))
  )
  (:action tick_meet_m_4
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_4))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_4)) (meet_m_5) (increase (total-cost) 1))
  )
  (:action tick_meet_m_5
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_5))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_5)) (meet_m_6) (increase (total-cost) 1))
  )
  (:action tick_meet_m_6
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_6))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_6)) (meet_m_7) (increase (total-cost) 1))
  )
  (:action tick_meet_m_7
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_7))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_7)) (meet_m_8) (increase (total-cost) 1))
  )
  (:action tick_meet_m_8
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_8))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_8)) (meet_m_9) (increase (total-cost) 1))
  )
  (:action tick_meet_m_9
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_9))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_9)) (meet_m_10) (increase (total-cost) 1))
  )
  (:action tick_meet_m_10
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_10))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_10)) (meet_m_11) (increase (total-cost) 1))
  )
  (:action tick_meet_m_11
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_11))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_11)) (meet_m_12) (increase (total-cost) 1))
  )
  (:action tick_meet_m_12
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_12))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_12)) (meet_m_13) (increase (total-cost) 1))
  )
  (:action tick_meet_m_13
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_13))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_13)) (meet_m_14) (increase (total-cost) 1))
  )
  (:action tick_meet_m_14
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_14))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_14)) (meet_m_15) (increase (total-cost) 1))
  )
  (:action tick_meet_m_15
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_15))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_15)) (meet_m_16) (increase (total-cost) 1))
  )
  (:action tick_meet_m_16
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_16))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_16)) (meet_m_17) (increase (total-cost) 1))
  )
  (:action tick_meet_m_17
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_17))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_17)) (meet_m_18) (increase (total-cost) 1))
  )
  (:action tick_meet_m_18
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_18))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_18)) (meet_m_19) (increase (total-cost) 1))
  )
  (:action tick_meet_m_19
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_19))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_19)) (meet_m_20) (increase (total-cost) 1))
  )
  (:action tick_meet_m_20
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_20))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_20)) (meet_m_21) (increase (total-cost) 1))
  )
  (:action tick_meet_m_21
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_21))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_21)) (meet_m_22) (increase (total-cost) 1))
  )
  (:action tick_meet_m_22
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_22))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_22)) (meet_m_23) (increase (total-cost) 1))
  )
  (:action tick_meet_m_23
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_23))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_23)) (meet_m_24) (increase (total-cost) 1))
  )
  (:action tick_meet_m_24
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_24))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_24)) (meet_m_25) (increase (total-cost) 1))
  )
  (:action tick_meet_m_25
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_25))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_25)) (meet_m_26) (increase (total-cost) 1))
  )
  (:action tick_meet_m_26
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_26))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_26)) (meet_m_27) (increase (total-cost) 1))
  )
  (:action tick_meet_m_27
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_27))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_27)) (meet_m_28) (increase (total-cost) 1))
  )
  (:action tick_meet_m_28
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_28))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_28)) (meet_m_29) (increase (total-cost) 1))
  )
  (:action tick_meet_m_29
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_29))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_29)) (meet_m_30) (increase (total-cost) 1))
  )
  (:action tick_meet_m_30
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_30))
    :effect (and (not (current_time ?t)) (current_time ?t2) (not (meet_m_30)) (meet_m_31) (increase (total-cost) 1))
  )

  ;; Finish meeting: requires the final meeting progress marker and marginal availability at that minute; sets met_margaret_30.
  (:action finish_meeting_margaret
    :parameters (?t - time)
    :precondition (and (current_time ?t) (meeting_margaret) (meet_m_31) (available_margaret ?t) (at haight_ashbury))
    :effect (and (not (meeting_margaret)) (not (meet_m_31)) (met_margaret_30))
  )

  ;; Idle advance time when not moving and not meeting (allows waiting/minute-by-minute progression).
  (:action advance_time_idle
    :parameters (?t - time ?t2 - time)
    :precondition (and (current_time ?t) (next ?t ?t2) (not (moving_mh)) (not (moving_hm)) (not (meeting_margaret)))
    :effect (and (not (current_time ?t)) (current_time ?t2) (increase (total-cost) 1))
  )
)