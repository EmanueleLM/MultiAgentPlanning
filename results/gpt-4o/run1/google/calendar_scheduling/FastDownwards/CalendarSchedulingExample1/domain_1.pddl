(define (domain calendar_scheduling_example)
  (:requirements :strips :typing)

  (:types participant time_slot)

  (:predicates
    (meeting_scheduled)
    (available ?p - participant ?t - time_slot)
    (consecutive ?t1 - time_slot ?t2 - time_slot)
    (preferred ?p - participant ?t - time_slot)
  )

  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
                   (not (meeting_scheduled))
                   (consecutive ?t1 ?t2)
                   (available raymond ?t1)
                   (available raymond ?t2)
                   (available billy ?t1)
                   (available billy ?t2)
                   (available donald ?t1)
                   (available donald ?t2)
                   (not (preferred billy ?t1))
                  )
    :effect (and
             (meeting_scheduled)
             (not (available raymond ?t1))
             (not (available raymond ?t2))
             (not (available billy ?t1))
             (not (available billy ?t2))
             (not (available donald ?t1))
             (not (available donald ?t2))
               )
  )
)