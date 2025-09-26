(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs :equality)
  (:types slot participant)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (free ?p - participant ?s - slot)
    (earlier ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (chosen ?s - slot)
    (all-free ?s - slot)
    (no-earlier-all-free ?s - slot)
  )

  (:action schedule-s0900
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s0900) (no-earlier-all-free s0900))
    :effect (and (meeting-scheduled) (chosen s0900))
    :cost 0
  )
  (:action schedule-s0930
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s0930) (no-earlier-all-free s0930))
    :effect (and (meeting-scheduled) (chosen s0930))
    :cost 1
  )
  (:action schedule-s1000
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1000) (no-earlier-all-free s1000))
    :effect (and (meeting-scheduled) (chosen s1000))
    :cost 2
  )
  (:action schedule-s1030
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1030) (no-earlier-all-free s1030))
    :effect (and (meeting-scheduled) (chosen s1030))
    :cost 3
  )
  (:action schedule-s1100
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1100) (no-earlier-all-free s1100))
    :effect (and (meeting-scheduled) (chosen s1100))
    :cost 4
  )
  (:action schedule-s1130
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1130) (no-earlier-all-free s1130))
    :effect (and (meeting-scheduled) (chosen s1130))
    :cost 5
  )
  (:action schedule-s1200
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1200) (no-earlier-all-free s1200))
    :effect (and (meeting-scheduled) (chosen s1200))
    :cost 6
  )
  (:action schedule-s1230
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1230) (no-earlier-all-free s1230))
    :effect (and (meeting-scheduled) (chosen s1230))
    :cost 7
  )
  (:action schedule-s1300
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1300) (no-earlier-all-free s1300))
    :effect (and (meeting-scheduled) (chosen s1300))
    :cost 8
  )
  (:action schedule-s1330
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1330) (no-earlier-all-free s1330))
    :effect (and (meeting-scheduled) (chosen s1330))
    :cost 9
  )
  (:action schedule-s1400
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1400) (no-earlier-all-free s1400))
    :effect (and (meeting-scheduled) (chosen s1400))
    :cost 10
  )
  (:action schedule-s1430
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1430) (no-earlier-all-free s1430))
    :effect (and (meeting-scheduled) (chosen s1430))
    :cost 11
  )
  (:action schedule-s1500
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1500) (no-earlier-all-free s1500))
    :effect (and (meeting-scheduled) (chosen s1500))
    :cost 12
  )
  (:action schedule-s1530
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1530) (no-earlier-all-free s1530))
    :effect (and (meeting-scheduled) (chosen s1530))
    :cost 13
  )
  (:action schedule-s1600
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1600) (no-earlier-all-free s1600))
    :effect (and (meeting-scheduled) (chosen s1600))
    :cost 14
  )
  (:action schedule-s1630
    :parameters ()
    :precondition (and (not (meeting-scheduled)) (all-free s1630) (no-earlier-all-free s1630))
    :effect (and (meeting-scheduled) (chosen s1630))
    :cost 15
  )
)