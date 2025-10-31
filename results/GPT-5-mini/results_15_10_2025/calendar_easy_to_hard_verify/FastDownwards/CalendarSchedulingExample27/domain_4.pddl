(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:constants walter danielle julia samuel lori - participant
              s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  (:action schedule-s1
    :precondition (and (free walter s1) (free danielle s1) (free julia s1) (free samuel s1) (free lori s1))
    :cost 1
    :effect (and (meeting-scheduled) (scheduled s1))
  )
  (:action schedule-s2
    :precondition (and (free walter s2) (free danielle s2) (free julia s2) (free samuel s2) (free lori s2))
    :cost 2
    :effect (and (meeting-scheduled) (scheduled s2))
  )
  (:action schedule-s3
    :precondition (and (free walter s3) (free danielle s3) (free julia s3) (free samuel s3) (free lori s3))
    :cost 3
    :effect (and (meeting-scheduled) (scheduled s3))
  )
  (:action schedule-s4
    :precondition (and (free walter s4) (free danielle s4) (free julia s4) (free samuel s4) (free lori s4))
    :cost 4
    :effect (and (meeting-scheduled) (scheduled s4))
  )
  (:action schedule-s5
    :precondition (and (free walter s5) (free danielle s5) (free julia s5) (free samuel s5) (free lori s5))
    :cost 5
    :effect (and (meeting-scheduled) (scheduled s5))
  )
  (:action schedule-s6
    :precondition (and (free walter s6) (free danielle s6) (free julia s6) (free samuel s6) (free lori s6))
    :cost 6
    :effect (and (meeting-scheduled) (scheduled s6))
  )
  (:action schedule-s7
    :precondition (and (free walter s7) (free danielle s7) (free julia s7) (free samuel s7) (free lori s7))
    :cost 7
    :effect (and (meeting-scheduled) (scheduled s7))
  )
  (:action schedule-s8
    :precondition (and (free walter s8) (free danielle s8) (free julia s8) (free samuel s8) (free lori s8))
    :cost 8
    :effect (and (meeting-scheduled) (scheduled s8))
  )
  (:action schedule-s9
    :precondition (and (free walter s9) (free danielle s9) (free julia s9) (free samuel s9) (free lori s9))
    :cost 9
    :effect (and (meeting-scheduled) (scheduled s9))
  )
  (:action schedule-s10
    :precondition (and (free walter s10) (free danielle s10) (free julia s10) (free samuel s10) (free lori s10))
    :cost 10
    :effect (and (meeting-scheduled) (scheduled s10))
  )
  (:action schedule-s11
    :precondition (and (free walter s11) (free danielle s11) (free julia s11) (free samuel s11) (free lori s11))
    :cost 11
    :effect (and (meeting-scheduled) (scheduled s11))
  )
  (:action schedule-s12
    :precondition (and (free walter s12) (free danielle s12) (free julia s12) (free samuel s12) (free lori s12))
    :cost 12
    :effect (and (meeting-scheduled) (scheduled s12))
  )
  (:action schedule-s13
    :precondition (and (free walter s13) (free danielle s13) (free julia s13) (free samuel s13) (free lori s13))
    :cost 13
    :effect (and (meeting-scheduled) (scheduled s13))
  )
  (:action schedule-s14
    :precondition (and (free walter s14) (free danielle s14) (free julia s14) (free samuel s14) (free lori s14))
    :cost 14
    :effect (and (meeting-scheduled) (scheduled s14))
  )
  (:action schedule-s15
    :precondition (and (free walter s15) (free danielle s15) (free julia s15) (free samuel s15) (free lori s15))
    :cost 15
    :effect (and (meeting-scheduled) (scheduled s15))
  )
  (:action schedule-s16
    :precondition (and (free walter s16) (free danielle s16) (free julia s16) (free samuel s16) (free lori s16))
    :cost 16
    :effect (and (meeting-scheduled) (scheduled s16))
  )
)