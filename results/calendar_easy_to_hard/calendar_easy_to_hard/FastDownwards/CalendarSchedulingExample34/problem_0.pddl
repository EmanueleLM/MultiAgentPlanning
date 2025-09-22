(define (problem orchestrate-meeting-monday)
  (:domain orchestrator-meeting)

  (:objects
    christine janice bobby elizabeth tyler edward - participant

    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
    ;; declare all half-hour start slots between 09:00 and 16:30 as slots, work-time and Monday
    (slot t09_00) (slot t09_30) (slot t10_00) (slot t10_30)
    (slot t11_00) (slot t11_30) (slot t12_00) (slot t12_30)
    (slot t13_00) (slot t13_30) (slot t14_00) (slot t14_30)
    (slot t15_00) (slot t15_30) (slot t16_00) (slot t16_30)

    (work-time t09_00) (work-time t09_30) (work-time t10_00) (work-time t10_30)
    (work-time t11_00) (work-time t11_30) (work-time t12_00) (work-time t12_30)
    (work-time t13_00) (work-time t13_30) (work-time t14_00) (work-time t14_30)
    (work-time t15_00) (work-time t15_30) (work-time t16_00) (work-time t16_30)

    (day-monday t09_00) (day-monday t09_30) (day-monday t10_00) (day-monday t10_30)
    (day-monday t11_00) (day-monday t11_30) (day-monday t12_00) (day-monday t12_30)
    (day-monday t13_00) (day-monday t13_30) (day-monday t14_00) (day-monday t14_30)
    (day-monday t15_00) (day-monday t15_30) (day-monday t16_00) (day-monday t16_30)

    ;; ---------- Integrated availability facts ----------
    ;; We aggregate each participant's known availability from their PDDL contributions.
    ;; Where participants provided no explicit busy times (e.g., Janice), we assume availability unless another agent provided conflicting specifics.
    ;; To support the different agent action preconditions, we populate both (available ...) and (free ...) where appropriate,
    ;; and (free-edward ...) for Edward's domain-specific predicate.

    ;; Janice: (per Janice) available all slots
    (available janice t09_00) (available janice t09_30) (available janice t10_00) (available janice t10_30)
    (available janice t11_00) (available janice t11_30) (available janice t12_00) (available janice t12_30)
    (available janice t13_00) (available janice t13_30) (available janice t14_00) (available janice t14_30)
    (available janice t15_00) (available janice t15_30) (available janice t16_00) (available janice t16_30)

    ;; also mark Janice as 'free' at all slots to satisfy domains expecting (free janice ?t)
    (free janice t09_00) (free janice t09_30) (free janice t10_00) (free janice t10_30)
    (free janice t11_00) (free janice t11_30) (free janice t12_00) (free janice t12_30)
    (free janice t13_00) (free janice t13_30) (free janice t14_00) (free janice t14_30)
    (free janice t15_00) (free janice t15_30) (free janice t16_00) (free janice t16_30)

    ;; Christine: use Christine's provided free slots (her problem)
    (free christine t09_00)
    (free christine t10_30)
    (free christine t11_00)
    (free christine t11_30)
    (free christine t12_30)
    (free christine t13_30)
    (free christine t14_00)
    (free christine t15_00)
    (free christine t15_30)
    (free christine t16_30)

    (available christine t09_00)
    (available christine t10_30)
    (available christine t11_00)
    (available christine t11_30)
    (available christine t12_30)
    (available christine t13_30)
    (available christine t14_00)
    (available christine t15_00)
    (available christine t15_30)
    (available christine t16_30)

    ;; Bobby: free at all slots except t12_00 (12:00) and t14_30 (14:30) per Bobby's problem
    (free bobby t09_00) (free bobby t09_30) (free bobby t10_00) (free bobby t10_30)
    (free bobby t11_00) (free bobby t11_30)                (free bobby t12_30)
    (free bobby t13_00) (free bobby t13_30) (free bobby t14_00)                (free bobby t15_00)
    (free bobby t15_30) (free bobby t16_00) (free bobby t16_30)

    (available bobby t09_00) (available bobby t09_30) (available bobby t10_00) (available bobby t10_30)
    (available bobby t11_00) (available bobby t11_30)                (available bobby t12_30)
    (available bobby t13_00) (available bobby t13_30) (available bobby t14_00)                (available bobby t15_00)
    (available bobby t15_30) (available bobby t16_00) (available bobby t16_30)

    ;; Elizabeth: available slots per Elizabeth's problem:
    ;; (available) s0930, s1000, s1030, s1100, s1300, s1400, s1430, s1530
    (available elizabeth t09_30) (available elizabeth t10_00) (available elizabeth t10_30) (available elizabeth t11_00)
    (available elizabeth t13_00) (available elizabeth t14_00) (available elizabeth t14_30) (available elizabeth t15_30)

    (free elizabeth t09_30) (free elizabeth t10_00) (free elizabeth t10_30) (free elizabeth t11_00)
    (free elizabeth t13_00) (free elizabeth t14_00) (free elizabeth t14_30) (free elizabeth t15_30)

    ;; Tyler: available slots per Tyler's problem:
    ;; slot-1100 slot-1130 slot-1230 slot-1330 slot-1400 slot-1430 slot-1500 slot-1600
    (available tyler t11_00) (available tyler t11_30) (available tyler t12_30) (available tyler t13_30)
    (available tyler t14_00) (available tyler t14_30) (available tyler t15_00) (available tyler t16_00)

    (free tyler t11_00) (free tyler t11_30) (free tyler t12_30) (free tyler t13_30)
    (free tyler t14_00) (free tyler t14_30) (free tyler t15_00) (free tyler t16_00)

    ;; Edward: Edward's domain gave (free-edward) for specific slots: slot1(09:30), slot4(11:00), slot10(14:00), slot13(15:30)
    (free-edward t09_30) (free-edward t11_00) (free-edward t14_00) (free-edward t15_30)

    ;; Also expose Edward's availability with 'available' and 'free' so other agents' preconditions can be satisfied
    (available edward t09_30) (available edward t11_00) (available edward t14_00) (available edward t15_30)
    (free edward t09_30) (free edward t11_00) (free edward t14_00) (free edward t15_30)
  )

  ;; Final goal: confirm a scheduled time that works for all participants.
  (:goal (meeting-confirmed))
)