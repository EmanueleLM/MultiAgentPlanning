(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot segment)
  (:predicates
    (available ?p - participant ?seg - segment)
    (covers ?slot - slot ?seg - segment)
    (next ?seg1 - segment ?seg2 - segment)
    (chosen ?slot - slot)
    (scheduled)
  )

  ;; Action that schedules the audited recommended slot s_1330_1430.
  ;; Preconditions enforce that the slot is covered by two contiguous segments
  ;; and that each named participant is available on every covered segment
  ;; (ensures contiguous occupancy for the 60-minute meeting modeled as two 30-min segments).
  (:action schedule_recommended
    :parameters ()
    :precondition (and
      (covers s_1330_1430 seg_1330_1400)
      (covers s_1330_1430 seg_1400_1430)
      (next seg_1330_1400 seg_1400_1430)
      (not (chosen s_1330_1430))
      ;; Availabilities for all participants over both contiguous segments
      (available anthony seg_1330_1400)
      (available anthony seg_1400_1430)
      (available pamela seg_1330_1400)
      (available pamela seg_1400_1430)
      (available zachary seg_1330_1400)
      (available zachary seg_1400_1430)
    )
    :effect (and
      (chosen s_1330_1430)
      (scheduled)
    )
  )
)