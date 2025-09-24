(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    brandon jerry bradley - participant

    ; half-hour slots from 09:00 to 16:30 (start times)
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Unscheduled resource and penalty initial value
    (unscheduled)
    (= (total-penalty) 0)

    ;; Slot classification relative to Brandon's preference (14:30)
    (early s09_00) (early s09_30) (early s10_00) (early s10_30)
    (early s11_00) (early s11_30) (early s12_00) (early s12_30)
    (early s13_00) (early s13_30) (early s14_00)
    (late  s14_30) (late  s15_00) (late  s15_30) (late  s16_00) (late  s16_30)

    ;; -------------------------
    ;; Combined availability (merged from agents' partial inputs)
    ;; Strategy: explicitly enumerate free facts; where explicit busy info exists,
    ;; do not assert free for that slot.
    ;; -------------------------

    ;; Jerry: known free for all slots (from agent 2 & 3)
    (free jerry s09_00) (free jerry s09_30) (free jerry s10_00) (free jerry s10_30)
    (free jerry s11_00) (free jerry s11_30) (free jerry s12_00) (free jerry s12_30)
    (free jerry s13_00) (free jerry s13_30) (free jerry s14_00) (free jerry s14_30)
    (free jerry s15_00) (free jerry s15_30) (free jerry s16_00) (free jerry s16_30)

    ;; Brandon: agent 1 provided busy slots; agent 3 listed Brandon as free on all slots.
    ;; We encode Brandon as free on all slots except his known busy slots:
    ;; Busy: s13_00, s13_30 (13:00-14:00); s15_30 (15:30-16:00); s16_30 (16:30-17:00)
    (free brandon s09_00) (free brandon s09_30) (free brandon s10_00) (free brandon s10_30)
    (free brandon s11_00) (free brandon s11_30) (free brandon s12_00) (free brandon s12_30)
    ; s13_00 busy -> do NOT assert free
    ; s13_30 busy -> do NOT assert free
    (free brandon s14_00) (free brandon s14_30)
    (free brandon s15_00)
    ; s15_30 busy -> do NOT assert free
    (free brandon s16_00)
    ; s16_30 busy -> do NOT assert free

    ;; Bradley: agent 3 provided Bradley's availability (busy intervals -> only some free slots)
    ;; Bradley free only at: s11_30, s15_00, s15_30, s16_30
    (free bradley s11_30) (free bradley s15_00) (free bradley s15_30) (free bradley s16_30)
  )

  ;; Goal: one meeting scheduled that all three attend.
  (:goal (meeting-scheduled))

  ;; Minimize Brandon's preference violations (penalize early meetings)
  (:metric minimize (total-penalty))
)