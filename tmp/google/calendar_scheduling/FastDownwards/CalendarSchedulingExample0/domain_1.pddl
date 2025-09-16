(define (domain monday-ensemble)
  (:requirements :typing)
  (:types slot)
  (:predicates
     (free ?t - slot)
     (meeting-scheduled)
  )

  ; Time tokens are now treated as objects defined in the problem file

  ; Agent 1 actions (distinct per slot)
  (:action schedule-slot9
     :parameters ()
     :precondition (free slot9)
     :effect (and (not (free slot9)) (meeting-scheduled))
  )
  (:action schedule-slot10
     :parameters ()
     :precondition (free slot10)
     :effect (and (not (free slot10)) (meeting-scheduled))
  )
  (:action schedule-slot11
     :parameters ()
     :precondition (free slot11)
     :effect (and (not (free slot11)) (meeting-scheduled))
  )
  (:action schedule-slot12
     :parameters ()
     :precondition (free slot12)
     :effect (and (not (free slot12)) (meeting-scheduled))
  )
  (:action schedule-slot13
     :parameters ()
     :precondition (free slot13)
     :effect (and (not (free slot13)) (meeting-scheduled))
  )
  (:action schedule-slot14
     :parameters ()
     :precondition (free slot14)
     :effect (and (not (free slot14)) (meeting-scheduled))
  )
  (:action schedule-slot15
     :parameters ()
     :precondition (free slot15)
     :effect (and (not (free slot15)) (meeting-scheduled))
  )
  (:action schedule-slot16
     :parameters ()
     :precondition (free slot16)
     :effect (and (not (free slot16)) (meeting-scheduled))
  )

  ; Agent 2 actions (distinct, time-pair based)
  (:action schedule_9_30_10_30
     :parameters ()
     :precondition (and (free a2_s9_30) (free a2_s10_00) (not (meeting-scheduled)))
     :effect (and (not (free a2_s9_30)) (not (free a2_s10_00)) (meeting-scheduled))
  )
  (:action schedule_10_00_10_30
     :parameters ()
     :precondition (and (free a2_s10_00) (free a2_s10_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s10_00)) (not (free a2_s10_30)) (meeting-scheduled))
  )
  (:action schedule_12_00_12_30
     :parameters ()
     :precondition (and (free a2_s12_00) (free a2_s12_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s12_00)) (not (free a2_s12_30)) (meeting-scheduled))
  )
  (:action schedule_14_00_14_30
     :parameters ()
     :precondition (and (free a2_s14_00) (free a2_s14_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s14_00)) (not (free a2_s14_30)) (meeting-scheduled))
  )
  (:action schedule_14_30_15_00
     :parameters ()
     :precondition (and (free a2_s14_30) (free a2_s15_00) (not (meeting-scheduled)))
     :effect (and (not (free a2_s14_30)) (not (free a2_s15_00)) (meeting-scheduled))
  )
  (:action schedule_16_00_16_30
     :parameters ()
     :precondition (and (free a2_s16_00) (free a2_s16_30) (not (meeting-scheduled)))
     :effect (and (not (free a2_s16_00)) (not (free a2_s16_30)) (meeting-scheduled))
  )

  ; Agent 3 action (the 14:30-15:30 window, represented as four 15-min slots)
  (:action schedule-meeting-14-30
     :parameters ()
     :precondition (and (free m14_30) (free m14_45) (free m15_00) (free m15_15)
                      (not (meeting-scheduled)))
     :effect (and
               (not (free m14_30)) (not (free m14_45))
               (not (free m15_00)) (not (free m15_15))
               meeting-scheduled)
  )
)