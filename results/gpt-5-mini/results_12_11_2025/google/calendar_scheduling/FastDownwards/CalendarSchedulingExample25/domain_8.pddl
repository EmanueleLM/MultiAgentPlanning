(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot segment)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (segment ?seg - segment)
    (available ?p - participant ?seg - segment)
    (covers ?s - slot ?seg - segment)
    (next ?seg1 - segment ?seg2 - segment)
    (chosen ?s - slot)
    (scheduled)
  )

  ;; Irreversible action that selects the audited recommended slot s_1330_1430.
  ;; Preconditions enforce contiguous segments covering the slot and that each
  ;; named participant is available on every covered segment (enforces contiguous occupancy).
  (:action select_s_1330_1430
    :parameters ()
    :precondition (and
      (slot s_1330_1430)
      (segment seg_1330_1400)
      (segment seg_1400_1430)
      (covers s_1330_1430 seg_1330_1400)
      (covers s_1330_1430 seg_1400_1430)
      (next seg_1330_1400 seg_1400_1430)
      (not (chosen s_1330_1430))
      ;; Anthony must be available for both contiguous 30-min segments (13:30-14:00, 14:00-14:30)
      (available anthony seg_1330_1400)
      (available anthony seg_1400_1430)
      ;; Pamela must be available for both segments (slot ends at 14:30, respecting her preference)
      (available pamela seg_1330_1400)
      (available pamela seg_1400_1430)
      ;; Zachary must be available for both segments
      (available zachary seg_1330_1400)
      (available zachary seg_1400_1430)
    )
    :effect (and
      (chosen s_1330_1430)
      (scheduled)
    )
  )
)