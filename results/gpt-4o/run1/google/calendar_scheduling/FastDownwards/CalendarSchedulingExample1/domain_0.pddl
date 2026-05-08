(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)

  (:types participant time)

  (:predicates
    (meeting_scheduled)
    (available ?p - participant ?t - time)
    (next ?t1 - time ?t2 - time)
    (preferred ?p - participant ?t - time)
  )

  (:action schedule_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and 
                   (not (meeting_scheduled))
                   (next ?t1 ?t2)
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