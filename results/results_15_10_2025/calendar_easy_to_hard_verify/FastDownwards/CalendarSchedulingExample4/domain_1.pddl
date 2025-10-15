(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types slot agent)
  (:predicates
    (free ?s - slot ?a - agent)
    (meeting-scheduled)
    (chosen-slot ?s - slot)
  )

  (:action choose-s0900
    :parameters ()
    :precondition (and (free s0900 donna) (free s0900 john) (free s0900 billy))
    :effect (and (meeting-scheduled) (chosen-slot s0900))
  )
  (:action choose-s0930
    :parameters ()
    :precondition (and (free s0930 donna) (free s0930 john) (free s0930 billy))
    :effect (and (meeting-scheduled) (chosen-slot s0930))
  )
  (:action choose-s1000
    :parameters ()
    :precondition (and (free s1000 donna) (free s1000 john) (free s1000 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1000))
  )
  (:action choose-s1030
    :parameters ()
    :precondition (and (free s1030 donna) (free s1030 john) (free s1030 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1030))
  )
  (:action choose-s1100
    :parameters ()
    :precondition (and (free s1100 donna) (free s1100 john) (free s1100 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1100))
  )
  (:action choose-s1130
    :parameters ()
    :precondition (and (free s1130 donna) (free s1130 john) (free s1130 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1130))
  )
  (:action choose-s1200
    :parameters ()
    :precondition (and (free s1200 donna) (free s1200 john) (free s1200 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1200))
  )
  (:action choose-s1230
    :parameters ()
    :precondition (and (free s1230 donna) (free s1230 john) (free s1230 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1230))
  )
  (:action choose-s1300
    :parameters ()
    :precondition (and (free s1300 donna) (free s1300 john) (free s1300 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1300))
  )
  (:action choose-s1330
    :parameters ()
    :precondition (and (free s1330 donna) (free s1330 john) (free s1330 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1330))
  )
  (:action choose-s1400
    :parameters ()
    :precondition (and (free s1400 donna) (free s1400 john) (free s1400 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1400))
  )
  (:action choose-s1430
    :parameters ()
    :precondition (and (free s1430 donna) (free s1430 john) (free s1430 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1430))
  )
  (:action choose-s1500
    :parameters ()
    :precondition (and (free s1500 donna) (free s1500 john) (free s1500 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1500))
  )
  (:action choose-s1530
    :parameters ()
    :precondition (and (free s1530 donna) (free s1530 john) (free s1530 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1530))
  )
  (:action choose-s1600
    :parameters ()
    :precondition (and (free s1600 donna) (free s1600 john) (free s1600 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1600))
  )
  (:action choose-s1630
    :parameters ()
    :precondition (and (free s1630 donna) (free s1630 john) (free s1630 billy))
    :effect (and (meeting-scheduled) (chosen-slot s1630))
  )
)