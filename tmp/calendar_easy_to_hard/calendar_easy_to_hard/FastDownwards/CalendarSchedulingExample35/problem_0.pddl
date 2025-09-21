(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30
  )
  (:init
    ;; Slots available between 09:00 and 17:00 in 30-minute increments
    (slot t09_00) (slot t09_30) (slot t10_00) (slot t10_30)
    (slot t11_00) (slot t11_30) (slot t12_00) (slot t12_30)
    (slot t13_00) (slot t13_30) (slot t14_00) (slot t14_30)
    (slot t15_00) (slot t15_30) (slot t16_00) (slot t16_30)

    ;; Initially no meeting scheduled
    (unscheduled)

    ;; Participant-specific availability facts (kept distinct per participant)
    ;; Alice's availability (example constraints from a participant)
    (available-alice t09_00) (available-alice t09_30)
    (available-alice t10_00) (available-alice t10_30)
    (available-alice t11_00) (available-alice t11_30)
    (available-alice t13_00) (available-alice t13_30)
    (available-alice t14_00) (available-alice t14_30)
    (available-alice t15_00) (available-alice t15_30)
    (available-alice t16_00) (available-alice t16_30)

    ;; Bob's availability (example constraints from a participant)
    (available-bob t10_00) (available-bob t10_30)
    (available-bob t11_00) (available-bob t11_30)
    (available-bob t14_30) (available-bob t15_00)
    (available-bob t15_30) (available-bob t16_00) (available-bob t16_30)

    ;; Diane's availability and preference to avoid meetings after 15:30.
    ;; To enforce Diane's preference, Diane is only marked available up to and including
    ;; the slot that starts at 15:00 (meeting of 30 minutes will end at 15:30).
    (available-diane t09_00) (available-diane t09_30)
    (available-diane t10_00) (available-diane t10_30)
    (available-diane t11_00) (available-diane t11_30)
    (available-diane t13_00) (available-diane t13_30)
    (available-diane t14_00) (available-diane t14_30)
    (available-diane t15_00)
  )
  (:goal (meeting-scheduled))
)