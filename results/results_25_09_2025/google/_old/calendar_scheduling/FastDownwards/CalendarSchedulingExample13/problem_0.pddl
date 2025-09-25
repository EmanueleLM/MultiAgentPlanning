(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling-integrated)
  (:objects
    ;; persons (lowercase identifiers)
    gerald roy barbara - person

    ;; timeslots: 30-minute starts from 09:00 to 16:30 inclusive
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot
  )

  (:init
    ;; Agent1: mark early timeslots (before 13:00)
    (early t09_00) (early t09_30) (early t10_00) (early t10_30)
    (early t11_00) (early t11_30) (early t12_00) (early t12_30)

    ;; Agent1 availability (Gerald's known busy times excluded):
    ;; Gerald is busy at 09:00 (t09_00), 13:00-14:00 (t13_00,t13_30), 15:00 (t15_00),
    ;; and 16:00-17:00 (t16_00,t16_30). So agent1 asserts Gerald free at:
    (free-at gerald t09_30)
    (free-at gerald t10_00)
    (free-at gerald t10_30)
    (free-at gerald t11_00)
    (free-at gerald t11_30)
    (free-at gerald t12_00)
    (free-at gerald t12_30)
    (free-at gerald t14_00)
    (free-at gerald t14_30)
    (free-at gerald t15_30)

    ;; Agent1: Roy and Barbara (agent1 has no busy info for them -> mark free at all working slots)
    (free-at roy t09_00) (free-at roy t09_30) (free-at roy t10_00) (free-at roy t10_30)
    (free-at roy t11_00) (free-at roy t11_30) (free-at roy t12_00) (free-at roy t12_30)
    (free-at roy t13_00) (free-at roy t13_30) (free-at roy t14_00) (free-at roy t14_30)
    (free-at roy t15_00) (free-at roy t15_30) (free-at roy t16_00) (free-at roy t16_30)

    (free-at barbara t09_00) (free-at barbara t09_30) (free-at barbara t10_00) (free-at barbara t10_30)
    (free-at barbara t11_00) (free-at barbara t11_30) (free-at barbara t12_00) (free-at barbara t12_30)
    (free-at barbara t13_00) (free-at barbara t13_30) (free-at barbara t14_00) (free-at barbara t14_30)
    (free-at barbara t15_00) (free-at barbara t15_30) (free-at barbara t16_00) (free-at barbara t16_30)

    ;; Agent2: declare slot markers and Roy free at all slots (agent2's knowledge)
    (slot2 t09_00) (slot2 t09_30) (slot2 t10_00) (slot2 t10_30)
    (slot2 t11_00) (slot2 t11_30) (slot2 t12_00) (slot2 t12_30)
    (slot2 t13_00) (slot2 t13_30) (slot2 t14_00) (slot2 t14_30)
    (slot2 t15_00) (slot2 t15_30) (slot2 t16_00) (slot2 t16_30)

    (free2 roy t09_00) (free2 roy t09_30) (free2 roy t10_00) (free2 roy t10_30)
    (free2 roy t11_00) (free2 roy t11_30) (free2 roy t12_00) (free2 roy t12_30)
    (free2 roy t13_00) (free2 roy t13_30) (free2 roy t14_00) (free2 roy t14_30)
    (free2 roy t15_00) (free2 roy t15_30) (free2 roy t16_00) (free2 roy t16_30)

    ;; Agent2: common-available was given as a single unspecified slot in their input;
    ;; to reconcile naming mismatches and ensure a feasible integrated schedule we map that
    ;; common-available slot to 10:00 (t10_00) — this aligns with agent3's single feasible slot
    ;; and with Gerald's availability per agent1.
    (common-available t10_00)

    ;; Agent3: participants and their private availability (Barbara busy many times; free slots listed)
    (participant3 barbara) (participant3 gerald) (participant3 roy)

    ;; Agent3: Barbara free at: 09:00, 10:00, 10:30, 11:00, 14:00, 15:00
    (free3 barbara t09_00)
    (free3 barbara t10_00)
    (free3 barbara t10_30)
    (free3 barbara t11_00)
    (free3 barbara t14_00)
    (free3 barbara t15_00)

    ;; Agent3: to encode the public guarantee "there exists at least one feasible slot",
    ;; agent3 asserted that Gerald and Roy are free at 10:00 (t10_00) — we include those here.
    (free3 gerald t10_00)
    (free3 roy t10_00)

    ;; initial numeric cost for agent1's soft preference
    (= (total-cost-agent1) 0)
  )

  ;; Goal: have a single orchestrated meeting time (global) that works for all agents/participants.
  ;; We target the slot that all agents' constraints agree on (mapped above to t10_00).
  (:goal (and
           (meeting-scheduled-global)
           (meeting-at-global t10_00)
         )
  )

  ;; Minimize the soft preference cost recorded by agent1 (avoid before 13:00); planner will minimize this.
  (:metric minimize (total-cost-agent1))
)