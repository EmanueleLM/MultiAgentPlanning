(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Assumptions (recorded here as comments):
  ;; - Workday Monday, 09:00-17:00, 30-minute slots aligned on :00 and :30.
  ;; - Times are local and common for all participants.
  ;; - No travel/buffer time required.
  ;; - The auditor's cleaned/normalized busy intervals are authoritative for constraints:
  ;;   Diane busy: 09:30-12:00, 12:30-14:30, 15:30-17:00
  ;;   Kelly busy: 09:30-10:00, 10:30-11:00
  ;;   Deborah busy: 09:30-10:00, 14:00-14:30
  ;; - The goal is to schedule exactly one 30-minute meeting on Monday during work hours
  ;;   at a slot that is free for all three participants. All natural-language preferences
  ;;   are enforced as strict (hard) constraints: no busy slot may be used.

  (:objects
    ;; participants
    diane kelly deborah - participant

    ;; explicit 30-minute slots from 09:00 to 17:00 (each half-hour)
    s09_00_09_30   s09_30_10_00
    s10_00_10_30   s10_30_11_00
    s11_00_11_30   s11_30_12_00
    s12_00_12_30   s12_30_13_00
    s13_00_13_30   s13_30_14_00
    s14_00_14_30   s14_30_15_00
    s15_00_15_30   s15_30_16_00
    s16_00_16_30   s16_30_17_00
    - slot
  )

  (:init
    ;; declare participants and slots
    (participant diane)
    (participant kelly)
    (participant deborah)

    (slot s09_00_09_30)
    (slot s09_30_10_00)
    (slot s10_00_10_30)
    (slot s10_30_11_00)
    (slot s11_00_11_30)
    (slot s11_30_12_00)
    (slot s12_00_12_30)
    (slot s12_30_13_00)
    (slot s13_00_13_30)
    (slot s13_30_14_00)
    (slot s14_00_14_30)
    (slot s14_30_15_00)
    (slot s15_00_15_30)
    (slot s15_30_16_00)
    (slot s16_00_16_30)
    (slot s16_30_17_00)

    ;; BUSY constraints (auditor-cleaned / provided):
    ;; Diane busy merged intervals -> these translate to the half-hour slots below
    (busy diane s09_30_10_00)
    (busy diane s10_00_10_30)
    (busy diane s10_30_11_00)
    (busy diane s11_00_11_30)
    (busy diane s11_30_12_00)

    (busy diane s12_30_13_00)
    (busy diane s13_00_13_30)
    (busy diane s13_30_14_00)
    (busy diane s14_00_14_30)

    (busy diane s15_30_16_00)
    (busy diane s16_00_16_30)
    (busy diane s16_30_17_00)

    ;; Kelly busy slots (explicit)
    (busy kelly s09_30_10_00)
    (busy kelly s10_30_11_00)

    ;; Deborah busy slots (explicit)
    (busy deborah s09_30_10_00)
    (busy deborah s14_00_14_30)
  )

  ;; Goal: a single meeting must be scheduled (meeting-scheduled),
  ;; and it must be scheduled in a common-free slot (scheduled-in-common).
  ;; The domain actions ensure that scheduled-in-common can only become true
  ;; when all three participants approved the same slot and none were busy for it.
  (:goal (and
    (meeting-scheduled)
    (scheduled-in-common)
  ))
)