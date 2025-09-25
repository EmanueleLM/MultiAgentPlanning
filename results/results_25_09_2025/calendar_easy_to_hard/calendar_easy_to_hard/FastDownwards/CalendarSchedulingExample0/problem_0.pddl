(define (problem schedule-monday-9-17)
  (:domain meeting-scheduling-multiagent)

  (:objects
    ; agents
    michelle steven jerry - agent

    ; half-hour slots between 09:00 and 17:00
    ; start is a subtype of halfslot (meeting can start at any of these)
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 - start
    t16_30 - halfslot
  )

  (:init
    ; next(start) -> the following halfslot (meeting occupies start and next(start))
    (next t9_00  t9_30)
    (next t9_30  t10_00)
    (next t10_00 t10_30)
    (next t10_30 t11_00)
    (next t11_00 t11_30)
    (next t11_30 t12_00)
    (next t12_00 t12_30)
    (next t12_30 t13_00)
    (next t13_00 t13_30)
    (next t13_30 t14_00)
    (next t14_00 t14_30)
    (next t14_30 t15_00)
    (next t15_00 t15_30)
    (next t15_30 t16_00)
    (next t16_00 t16_30)

    ; ===== Michelle's availability (private: busy 11:00-12:00 -> t11_00 and t11_30 are busy) =====
    ; Michelle free on all halfslots except t11_00 and t11_30
    (free michelle t9_00)  (free michelle t9_30)
    (free michelle t10_00) (free michelle t10_30)
    ; t11_00 and t11_30 are busy -> not listed as free
    (free michelle t12_00) (free michelle t12_30)
    (free michelle t13_00) (free michelle t13_30)
    (free michelle t14_00) (free michelle t14_30)
    (free michelle t15_00) (free michelle t15_30)
    (free michelle t16_00) (free michelle t16_30)

    ; ===== Steven's availability (private busy: 9:00-9:30, 11:30-12:00, 13:30-14:00, 15:30-16:00) =====
    ; busy: t9_00, t11_30, t13_30, t15_30 -> not listed as free
    (free steven t9_30)
    (free steven t10_00) (free steven t10_30)
    (free steven t11_00)
    (free steven t12_00) (free steven t12_30)
    (free steven t13_00)
    (free steven t14_00) (free steven t14_30)
    (free steven t15_00)
    (free steven t16_00) (free steven t16_30)

    ; ===== Jerry's availability (private busy: 9:00-9:30,10:00-11:00,11:30-12:30,13:00-14:30,15:30-16:00,16:30-17:00) =====
    ; busy: t9_00, t10_00, t10_30, t11_30, t12_00, t13_00, t13_30, t14_00, t15_30, t16_30
    (free jerry t9_30)
    (free jerry t11_00)
    (free jerry t12_30)
    (free jerry t14_30)
    (free jerry t15_00)
    (free jerry t16_00)

    ; Note: no confirmations are yet done; agents must use their confirm actions.
    ; The planner must produce confirms from all three agents for a common start and then schedule it.
  )

  ; Goal: there exists some start time where meeting is scheduled (one hour between 9:00 and 17:00)
  (:goal (exists (?s - start) (meeting-scheduled ?s)))
)