(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:constants marie janice elijah theresa - participant
              s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )
  (:functions (total-cost))

  (:action schedule-s1
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s1) (free janice s1) (free elijah s1) (free theresa s1))
    :effect (and (meeting-scheduled) (scheduled s1) (increase (total-cost) 1))
  )

  (:action schedule-s2
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s2) (free janice s2) (free elijah s2) (free theresa s2))
    :effect (and (meeting-scheduled) (scheduled s2) (increase (total-cost) 2))
  )

  (:action schedule-s3
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s3) (free janice s3) (free elijah s3) (free theresa s3))
    :effect (and (meeting-scheduled) (scheduled s3) (increase (total-cost) 3))
  )

  (:action schedule-s4
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s4) (free janice s4) (free elijah s4) (free theresa s4))
    :effect (and (meeting-scheduled) (scheduled s4) (increase (total-cost) 4))
  )

  (:action schedule-s5
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s5) (free janice s5) (free elijah s5) (free theresa s5))
    :effect (and (meeting-scheduled) (scheduled s5) (increase (total-cost) 5))
  )

  (:action schedule-s6
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s6) (free janice s6) (free elijah s6) (free theresa s6))
    :effect (and (meeting-scheduled) (scheduled s6) (increase (total-cost) 6))
  )

  (:action schedule-s7
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s7) (free janice s7) (free elijah s7) (free theresa s7))
    :effect (and (meeting-scheduled) (scheduled s7) (increase (total-cost) 7))
  )

  (:action schedule-s8
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s8) (free janice s8) (free elijah s8) (free theresa s8))
    :effect (and (meeting-scheduled) (scheduled s8) (increase (total-cost) 8))
  )

  (:action schedule-s9
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s9) (free janice s9) (free elijah s9) (free theresa s9))
    :effect (and (meeting-scheduled) (scheduled s9) (increase (total-cost) 9))
  )

  (:action schedule-s10
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s10) (free janice s10) (free elijah s10) (free theresa s10))
    :effect (and (meeting-scheduled) (scheduled s10) (increase (total-cost) 10))
  )

  (:action schedule-s11
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s11) (free janice s11) (free elijah s11) (free theresa s11))
    :effect (and (meeting-scheduled) (scheduled s11) (increase (total-cost) 11))
  )

  (:action schedule-s12
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s12) (free janice s12) (free elijah s12) (free theresa s12))
    :effect (and (meeting-scheduled) (scheduled s12) (increase (total-cost) 12))
  )

  (:action schedule-s13
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s13) (free janice s13) (free elijah s13) (free theresa s13))
    :effect (and (meeting-scheduled) (scheduled s13) (increase (total-cost) 13))
  )

  (:action schedule-s14
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s14) (free janice s14) (free elijah s14) (free theresa s14))
    :effect (and (meeting-scheduled) (scheduled s14) (increase (total-cost) 14))
  )

  (:action schedule-s15
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s15) (free janice s15) (free elijah s15) (free theresa s15))
    :effect (and (meeting-scheduled) (scheduled s15) (increase (total-cost) 15))
  )

  (:action schedule-s16
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (free marie s16) (free janice s16) (free elijah s16) (free theresa s16))
    :effect (and (meeting-scheduled) (scheduled s16) (increase (total-cost) 16))
  )
)