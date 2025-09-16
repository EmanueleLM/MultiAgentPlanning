(define (domain monday-ensemble)
  (:requirements :typing)
  (:types slot)
  (:predicates
     (free ?t - slot)
     (meeting-scheduled)
  )

  ; Time tokens (covering the times used by the agents)
  (:constants
     ; Agent 1 (hourly slots)
     slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot

     ; Agent 2 (15-minute granularity tokens used in their responses)
     a2_s9_30 a2_s10_00 a2_s10_30 a2_s11_00 a2_s12_00 a2_s12_30
     a2_s13_00 a2_s14_00 a2_s14_30 a2_s15_00 a2_s16_00 a2_s16_30 - slot

     ; Agent 3 (15-minute granularity tokens for 14:30-15:30)
     m14_30 m14_45 m15_00 m15_15 - slot
  )

  ; Agent 1 actions (distinct per slot)
  (:action schedule-slot9
     :precondition (free slot9)
     :effect (and (not (free slot9)) (meeting-scheduled))
  )
  (:action schedule-slot10
     :precondition (free slot10)
     :effect (and (not (free slot10)) (meeting-scheduled))
  )
  (:action schedule-slot11
     :precondition (free slot11)
     :effect (and (not (free slot11)) (meeting-scheduled))
  )
  (:action schedule-slot12
     :precondition (free slot12)
     :effect (and (not (free slot12)) (meeting-scheduled))
  )
  (:action schedule-slot13
     :precondition (free slot13)
     :effect (and (not (free slot13)) (meeting-scheduled))
  )
  (:action schedule-slot14
     :precondition (free slot14)
     :effect (and (not (free slot14)) (meeting-scheduled))
  )
  (:action schedule-slot15
     :precondition (free slot15)
     :effect (and (not (free slot15)) (meeting-scheduled))
  )
  (:action schedule-slot16
     :precondition (free slot16)
     :effect (and (not (free slot16)) (meeting-scheduled))
  )

  ; Agent 2 actions (distinct, time-pair based)
  (:action schedule_9_30_10_30
     :precondition (and (free a2_s9_30) (free a2_s10_00) (not (meeting-scheduled)))
     :effect (and (not (free a2_s9_30)) (not (free a2_s10_00)) (meeting-scheduled))
  )
  (:action schedule_10_00_10_30
     :precondition (and (free a2_s10_00) (free a2_s10_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s10_00)) (not (free a2_s10_30)) (meeting-scheduled))
  )
  (:action schedule_12_00_12_30
     :precondition (and (free a2_s12_00) (free a2_s12_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s12_00)) (not (free a2_s12_30)) (meeting-scheduled))
  )
  (:action schedule_14_00_14_30
     :precondition (and (free a2_s14_00) (free a2_s14_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s14_00)) (not (free a2_s14_30)) (meeting-scheduled))
  )
  (:action schedule_14_30_15_00
     :precondition (and (free a2_s14_30) (free a2_s15_00) (not (meeting-scheduled)))
     :effect (and (not (free a2_s14_30)) (not (free a2_s15_00)) (meeting-scheduled))
  )
  (:action schedule_16_00_16_30
     :precondition (and (free a2_s16_00) (free a2_s16_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s16_00)) (not (free a2_s16_30)) (meeting-scheduled))
  )

  ; Agent 3 action (the 14:30-15:30 window, represented as four 15-min slots)
  (:action schedule-meeting-14-30
     :precondition (and (free m14_30) (free m14_45) (free m15_00) (free m15_15)
                      (not (meeting-scheduled)))
     :effect (and
               (not (free m14_30)) (not (free m14_45))
               (not (free m15_00)) (not (free m15_15))
               meeting-scheduled)
  )
)