(define (domain meet-margaret-sf)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location person time)
  (:predicates
    (current-time ?t - time)
    (next ?t - time ?t2 - time)
    (at ?l - location)
    (moving_mh)                ; Mission -> Haight in progress
    (moving_hm)                ; Haight -> Mission in progress
    (meeting_margaret)         ; meeting in progress
    ; Travel milestone steps Mission->Haight (1..12)
    (move_mh_1) (move_mh_2) (move_mh_3) (move_mh_4) (move_mh_5) (move_mh_6)
    (move_mh_7) (move_mh_8) (move_mh_9) (move_mh_10) (move_mh_11) (move_mh_12)
    ; Travel milestone steps Haight->Mission (1..11)
    (move_hm_1) (move_hm_2) (move_hm_3) (move_hm_4) (move_hm_5) (move_hm_6)
    (move_hm_7) (move_hm_8) (move_hm_9) (move_hm_10) (move_hm_11)
    ; Meeting milestone steps (1..30)
    (meet_m_1) (meet_m_2) (meet_m_3) (meet_m_4) (meet_m_5) (meet_m_6)
    (meet_m_7) (meet_m_8) (meet_m_9) (meet_m_10) (meet_m_11) (meet_m_12)
    (meet_m_13) (meet_m_14) (meet_m_15) (meet_m_16) (meet_m_17) (meet_m_18)
    (meet_m_19) (meet_m_20) (meet_m_21) (meet_m_22) (meet_m_23) (meet_m_24)
    (meet_m_25) (meet_m_26) (meet_m_27) (meet_m_28) (meet_m_29) (meet_m_30)
    (met_margaret_30)
    (available_margaret ?t - time)
  )
  (:functions (total-cost))
  ; Start movement Mission -> Haight
  (:action start-move-mh
    :parameters (?t - time)
    :precondition (and (current-time ?t) (at mission_district) (not (meeting_margaret)) (not (moving_mh)) (not (moving_hm)))
    :effect (and (not (at mission_district)) (moving_mh) (move_mh_1))
  )
  ; Tick movement Mission->Haight (1->2)
  (:action tick-move-mh-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_1))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_1)) (move_mh_2) (increase (total-cost) 1))
  )
  (:action tick-move-mh-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_2)) (move_mh_3) (increase (total-cost) 1))
  )
  (:action tick-move-mh-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_3))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_3)) (move_mh_4) (increase (total-cost) 1))
  )
  (:action tick-move-mh-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_4))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_4)) (move_mh_5) (increase (total-cost) 1))
  )
  (:action tick-move-mh-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_5))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_5)) (move_mh_6) (increase (total-cost) 1))
  )
  (:action tick-move-mh-6
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_6))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_6)) (move_mh_7) (increase (total-cost) 1))
  )
  (:action tick-move-mh-7
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_7))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_7)) (move_mh_8) (increase (total-cost) 1))
  )
  (:action tick-move-mh-8
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_8))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_8)) (move_mh_9) (increase (total-cost) 1))
  )
  (:action tick-move-mh-9
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_9))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_9)) (move_mh_10) (increase (total-cost) 1))
  )
  (:action tick-move-mh-10
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_10))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_10)) (move_mh_11) (increase (total-cost) 1))
  )
  (:action tick-move-mh-11
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_mh) (move_mh_11))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_mh_11)) (move_mh_12) (increase (total-cost) 1))
  )
  (:action finish-move-mh
    :parameters (?t - time)
    :precondition (and (current-time ?t) (moving_mh) (move_mh_12))
    :effect (and (not (moving_mh)) (not (move_mh_12)) (at haight_ashbury))
  )
  ; Start movement Haight -> Mission
  (:action start-move-hm
    :parameters (?t - time)
    :precondition (and (current-time ?t) (at haight_ashbury) (not (meeting_margaret)) (not (moving_hm)) (not (moving_mh)))
    :effect (and (not (at haight_ashbury)) (moving_hm) (move_hm_1))
  )
  (:action tick-move-hm-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_1))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_1)) (move_hm_2) (increase (total-cost) 1))
  )
  (:action tick-move-hm-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_2)) (move_hm_3) (increase (total-cost) 1))
  )
  (:action tick-move-hm-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_3))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_3)) (move_hm_4) (increase (total-cost) 1))
  )
  (:action tick-move-hm-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_4))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_4)) (move_hm_5) (increase (total-cost) 1))
  )
  (:action tick-move-hm-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_5))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_5)) (move_hm_6) (increase (total-cost) 1))
  )
  (:action tick-move-hm-6
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_6))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_6)) (move_hm_7) (increase (total-cost) 1))
  )
  (:action tick-move-hm-7
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_7))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_7)) (move_hm_8) (increase (total-cost) 1))
  )
  (:action tick-move-hm-8
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_8))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_8)) (move_hm_9) (increase (total-cost) 1))
  )
  (:action tick-move-hm-9
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_9))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_9)) (move_hm_10) (increase (total-cost) 1))
  )
  (:action tick-move-hm-10
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (moving_hm) (move_hm_10))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (move_hm_10)) (move_hm_11) (increase (total-cost) 1))
  )
  (:action finish-move-hm
    :parameters (?t - time)
    :precondition (and (current-time ?t) (moving_hm) (move_hm_11))
    :effect (and (not (moving_hm)) (not (move_hm_11)) (at mission_district))
  )
  ; Start meeting with Margaret
  (:action start-meeting-margaret
    :parameters (?t - time)
    :precondition (and (current-time ?t) (at haight_ashbury) (available_margaret ?t) (not (meeting_margaret)) (not (moving_mh)) (not (moving_hm)))
    :effect (and (meeting_margaret) (meet_m_1))
  )
  ; Tick meeting (1->2) ... (29->30)
  (:action tick-meet-m-1
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_1))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_1)) (meet_m_2) (increase (total-cost) 1))
  )
  (:action tick-meet-m-2
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_2)) (meet_m_3) (increase (total-cost) 1))
  )
  (:action tick-meet-m-3
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_3))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_3)) (meet_m_4) (increase (total-cost) 1))
  )
  (:action tick-meet-m-4
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_4))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_4)) (meet_m_5) (increase (total-cost) 1))
  )
  (:action tick-meet-m-5
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_5))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_5)) (meet_m_6) (increase (total-cost) 1))
  )
  (:action tick-meet-m-6
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_6))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_6)) (meet_m_7) (increase (total-cost) 1))
  )
  (:action tick-meet-m-7
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_7))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_7)) (meet_m_8) (increase (total-cost) 1))
  )
  (:action tick-meet-m-8
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_8))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_8)) (meet_m_9) (increase (total-cost) 1))
  )
  (:action tick-meet-m-9
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_9))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_9)) (meet_m_10) (increase (total-cost) 1))
  )
  (:action tick-meet-m-10
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_10))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_10)) (meet_m_11) (increase (total-cost) 1))
  )
  (:action tick-meet-m-11
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_11))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_11)) (meet_m_12) (increase (total-cost) 1))
  )
  (:action tick-meet-m-12
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_12))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_12)) (meet_m_13) (increase (total-cost) 1))
  )
  (:action tick-meet-m-13
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_13))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_13)) (meet_m_14) (increase (total-cost) 1))
  )
  (:action tick-meet-m-14
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_14))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_14)) (meet_m_15) (increase (total-cost) 1))
  )
  (:action tick-meet-m-15
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_15))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_15)) (meet_m_16) (increase (total-cost) 1))
  )
  (:action tick-meet-m-16
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_16))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_16)) (meet_m_17) (increase (total-cost) 1))
  )
  (:action tick-meet-m-17
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_17))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_17)) (meet_m_18) (increase (total-cost) 1))
  )
  (:action tick-meet-m-18
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_18))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_18)) (meet_m_19) (increase (total-cost) 1))
  )
  (:action tick-meet-m-19
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_19))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_19)) (meet_m_20) (increase (total-cost) 1))
  )
  (:action tick-meet-m-20
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_20))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_20)) (meet_m_21) (increase (total-cost) 1))
  )
  (:action tick-meet-m-21
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_21))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_21)) (meet_m_22) (increase (total-cost) 1))
  )
  (:action tick-meet-m-22
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_22))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_22)) (meet_m_23) (increase (total-cost) 1))
  )
  (:action tick-meet-m-23
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_23))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_23)) (meet_m_24) (increase (total-cost) 1))
  )
  (:action tick-meet-m-24
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_24))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_24)) (meet_m_25) (increase (total-cost) 1))
  )
  (:action tick-meet-m-25
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_25))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_25)) (meet_m_26) (increase (total-cost) 1))
  )
  (:action tick-meet-m-26
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_26))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_26)) (meet_m_27) (increase (total-cost) 1))
  )
  (:action tick-meet-m-27
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_27))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_27)) (meet_m_28) (increase (total-cost) 1))
  )
  (:action tick-meet-m-28
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_28))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_28)) (meet_m_29) (increase (total-cost) 1))
  )
  (:action tick-meet-m-29
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (meeting_margaret) (available_margaret ?t) (at haight_ashbury) (meet_m_29))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (meet_m_29)) (meet_m_30) (increase (total-cost) 1))
  )
  (:action finish-meeting-margaret
    :parameters (?t - time)
    :precondition (and (current-time ?t) (meeting_margaret) (meet_m_30) (available_margaret ?t) (at haight_ashbury))
    :effect (and (not (meeting_margaret)) (not (meet_m_30)) (met_margaret_30))
  )
  ; Idle advance-time when not moving or meeting
  (:action advance-time-idle
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next ?t ?t2) (not (moving_mh)) (not (moving_hm)) (not (meeting_margaret)))
    :effect (and (not (current-time ?t)) (current-time ?t2) (increase (total-cost) 1))
  )
)